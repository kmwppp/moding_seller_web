import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/network/entities/response_model.dart';
import 'package:moding_president_web/feature/reauth/data/repositories/reauth_repository.dart';
import 'package:moding_president_web/feature/reauth/presentation/providers/reauth_state.dart';

final reauthViewModelProvider = NotifierProvider<ReauthViewModel, ReauthState>(
  ReauthViewModel.new,
);

class ReauthViewModel extends Notifier<ReauthState> {
  late final ReauthRepository _repository;

  @override
  ReauthState build() {
    _repository = ref.read(reauthRepositoryProvider);
    return ReauthState.initial();
  }

  Future<String?> submitPassword(String password) async {
    if (password.trim().isEmpty) {
      return '비밀번호를 입력해주세요.';
    }

    state = state.copyWith(isSubmitting: true);

    try {
      await _repository.issueAndSaveReauthKey(password.trim());
      return null;
    } on DioException catch (e) {
      return _resolveErrorMessage(e, '비밀번호 재인증에 실패했습니다.');
    } catch (_) {
      return '비밀번호 재인증에 실패했습니다.';
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }

  Future<void> clearStoredKey() {
    return _repository.clearStoredReauthKey();
  }

  String _resolveErrorMessage(DioException exception, String fallback) {
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
