import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/network/entities/response_model.dart';
import 'package:moding_seller_web/feature/business_profile/data/repositories/business_profile_repository.dart';
import 'package:moding_seller_web/feature/business_profile/presentation/providers/seller_withdrawal_state.dart';

final sellerWithdrawalViewModelProvider =
    NotifierProvider<SellerWithdrawalViewModel, SellerWithdrawalState>(
      SellerWithdrawalViewModel.new,
    );

class SellerWithdrawalViewModel extends Notifier<SellerWithdrawalState> {
  late final BusinessProfileRepository _repository;

  @override
  SellerWithdrawalState build() {
    _repository = ref.read(businessProfileRepositoryProvider);
    return SellerWithdrawalState.initial();
  }

  Future<String?> withdrawFromSelling(String reauthKey) async {
    final trimmedKey = reauthKey.trim();
    if (trimmedKey.isEmpty) {
      return '재인증 키를 찾을 수 없습니다. 비밀번호를 다시 입력해주세요.';
    }

    state = state.copyWith(isSubmitting: true);

    try {
      await _repository.withdrawFromSelling(trimmedKey);
      state = state.copyWith(isSubmitting: false);
      return null;
    } on BusinessProfileRepositoryException catch (e) {
      state = state.copyWith(isSubmitting: false);
      return e.message;
    } on DioException catch (e) {
      state = state.copyWith(isSubmitting: false);
      return _resolveErrorMessage(e, '판매자 권한 해지 신청에 실패했습니다.');
    } catch (_) {
      state = state.copyWith(isSubmitting: false);
      return '판매자 권한 해지 신청에 실패했습니다.';
    }
  }

  String _resolveErrorMessage(DioException exception, String fallback) {
    final data = exception.response?.data;
    if (data is Map<String, dynamic>) {
      try {
        final response = ResponseModel.fromJson(data);
        if (response.message.isNotEmpty) {
          return response.message;
        }
      } catch (_) {
        final message = data['message']?.toString() ?? '';
        if (message.isNotEmpty) {
          return message;
        }
      }
    }

    if (exception.response?.statusCode == 403) {
      return '재인증이 만료되었습니다. 비밀번호를 다시 입력해주세요.';
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
