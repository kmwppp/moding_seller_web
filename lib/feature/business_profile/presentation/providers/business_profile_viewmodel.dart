import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/network/entities/response_model.dart';
import 'package:moding_seller_web/core/services/token_storage.dart';
import 'package:moding_seller_web/feature/business_profile/data/repositories/business_profile_repository.dart';
import 'package:moding_seller_web/feature/business_profile/domain/entities/refund_account_info.dart';
import 'package:moding_seller_web/feature/business_profile/presentation/providers/business_profile_state.dart';

final businessProfileViewModelProvider =
    NotifierProvider<BusinessProfileViewModel, BusinessProfileState>(
      BusinessProfileViewModel.new,
    );

class BusinessProfileViewModel extends Notifier<BusinessProfileState> {
  late final BusinessProfileRepository _repository;
  late final TokenStorage _tokenStorage;

  @override
  BusinessProfileState build() {
    _repository = ref.read(businessProfileRepositoryProvider);
    _tokenStorage = ref.read(tokenStorageProvider);
    return BusinessProfileState.initial();
  }

  Future<void> initialize() async {
    if (state.isInitialized || state.isLoading) {
      return;
    }

    await requireReauthOnEntry();
  }

  Future<void> requireReauthOnEntry() async {
    state = state.copyWith(
      isInitialized: true,
      isLoading: false,
      needsReauth: true,
      clearAccountInfo: true,
      clearProfile: true,
      clearSellerProfile: true,
      clearRefundAccount: true,
    );
    await _tokenStorage.deleteReauthKey();
  }

  Future<String?> loadProfileAfterReauth() async {
    final reauthKey = await _tokenStorage.getReauthKey();
    if (reauthKey == null || reauthKey.trim().isEmpty) {
      state = state.copyWith(
        isLoading: false,
        needsReauth: true,
        clearAccountInfo: true,
        clearProfile: true,
        clearSellerProfile: true,
        clearRefundAccount: true,
      );
      return '재인증 키를 찾을 수 없습니다. 다시 시도해주세요.';
    }

    state = state.copyWith(
      isLoading: true,
      needsReauth: false,
      clearAccountInfo: true,
      clearProfile: true,
      clearSellerProfile: true,
      clearRefundAccount: true,
    );

    try {
      await _loadProfile(reauthKey.trim());
      return null;
    } on DioException catch (e) {
      return _resolveErrorMessage(e, '판매자 프로필 정보를 불러오지 못했습니다.');
    } catch (_) {
      return '판매자 프로필 정보를 불러오지 못했습니다.';
    }
  }

  Future<void> _loadProfile(String reauthKey) async {
    try {
      final accountInfo = await _repository.getMyUserInfo();
      final profile = await _repository.getMyBusinessProfile(reauthKey);
      final sellerProfile = await _repository.getMySellerProfileInfo(reauthKey);
      final refundAccount = await _loadRefundAccountInfo(
        reauthKey,
        allowReauthFailure: true,
      );

      state = state.copyWith(
        isLoading: false,
        needsReauth: false,
        accountInfo: accountInfo,
        profile: profile,
        sellerProfile: sellerProfile,
        refundAccount: refundAccount,
      );
    } on DioException catch (e) {
      await _handleLoadError(e);
      rethrow;
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        needsReauth: false,
        clearAccountInfo: true,
        clearProfile: true,
        clearSellerProfile: true,
        clearRefundAccount: true,
      );
      rethrow;
    }
  }

  Future<RefundAccountInfo?> _loadRefundAccountInfo(
    String reauthKey, {
    bool allowReauthFailure = false,
  }) async {
    try {
      return await _repository.getMyRefundAccountInfo(reauthKey);
    } on DioException catch (error) {
      if (error.response?.statusCode == 404 &&
          _isRefundAccountNotFound(error)) {
        return null;
      }

      if (allowReauthFailure && error.response?.statusCode == 403) {
        return null;
      }

      rethrow;
    }
  }

  bool _isRefundAccountNotFound(DioException exception) {
    final data = exception.response?.data;
    if (data is Map<String, dynamic>) {
      final message = data['message']?.toString() ?? '';
      return message.contains('등록된 환불계좌가 없습니다.');
    }

    return false;
  }

  Future<void> _handleLoadError(DioException exception) async {
    final requiresReauth = exception.response?.statusCode == 403;
    if (requiresReauth) {
      await _tokenStorage.deleteReauthKey();
    }

    state = state.copyWith(
      isLoading: false,
      needsReauth: requiresReauth,
      clearAccountInfo: true,
      clearProfile: true,
      clearSellerProfile: true,
      clearRefundAccount: true,
    );
  }

  Future<String?> updateHanjinContract(String contractNo) async {
    final trimmed = contractNo.trim();
    if (trimmed.isEmpty) {
      return '한진 택배코드를 입력해주세요.';
    }

    state = state.copyWith(isUpdatingHanjinContract: true);

    try {
      await _repository.updateMyHanjinContract(trimmed);
      final sellerProfile = state.sellerProfile;
      state = state.copyWith(
        isUpdatingHanjinContract: false,
        sellerProfile: sellerProfile?.copyWith(hanjinContractNo: trimmed),
      );
      return null;
    } on DioException catch (e) {
      state = state.copyWith(isUpdatingHanjinContract: false);
      return _resolveErrorMessage(e, '한진 택배코드를 저장하지 못했습니다.');
    } catch (_) {
      state = state.copyWith(isUpdatingHanjinContract: false);
      return '한진 택배코드를 저장하지 못했습니다.';
    }
  }

  String _resolveErrorMessage(DioException exception, String fallback) {
    if (exception.response?.statusCode == 403) {
      return '재인증이 만료되었습니다. 비밀번호를 다시 입력해주세요.';
    }

    final data = exception.response?.data;
    if (data is Map<String, dynamic>) {
      try {
        final response = ResponseModel.fromJson(data);
        if (response.message.isNotEmpty) {
          return response.message;
        }
      } catch (_) {}
    }

    if (exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.receiveTimeout ||
        exception.type == DioExceptionType.sendTimeout) {
      return '서버 응답이 지연되고 있습니다. 잠시 후 다시 시도해주세요.';
    }

    if (exception.type == DioExceptionType.connectionError) {
      return '서버에 연결하지 못했습니다. 네트워크 상태를 확인해주세요.';
    }

    return fallback;
  }
}
