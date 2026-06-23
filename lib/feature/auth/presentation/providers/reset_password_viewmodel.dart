import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/services/token_storage.dart';
import 'package:moding_seller_web/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:moding_seller_web/feature/auth/domain/entities/reset_password_result.dart';
import 'package:moding_seller_web/feature/auth/presentation/providers/reset_password_state.dart';

final resetPasswordViewModelProvider =
    NotifierProvider<ResetPasswordViewModel, ResetPasswordState>(
      ResetPasswordViewModel.new,
    );

class ResetPasswordViewModel extends Notifier<ResetPasswordState> {
  @override
  ResetPasswordState build() => ResetPasswordState.initial();

  void updateLoginId(String value) {
    state = state.copyWith(loginId: value.trim());
  }

  void updateNewPassword(String value) {
    state = state.copyWith(newPassword: value);
  }

  void updateNewPasswordConfirm(String value) {
    state = state.copyWith(newPasswordConfirm: value);
  }

  String? validate() {
    return _validate(requireLoginId: true);
  }

  String? validateIdentityVerifyReset() {
    return _validate(requireLoginId: false);
  }

  String? _validate({required bool requireLoginId}) {
    if (requireLoginId && state.loginId.isEmpty) {
      return '아이디를 입력해주세요.';
    }
    if (state.newPassword.trim().isEmpty) {
      return '새 비밀번호를 입력해주세요.';
    }
    if (state.newPassword != state.newPasswordConfirm) {
      return '새 비밀번호가 서로 일치하지 않습니다.';
    }
    return null;
  }

  Future<ResetPasswordResult> submit(String identityVerificationKey) async {
    final message = validate();
    if (message != null) {
      return ResetPasswordResult(success: false, message: message);
    }
    if (identityVerificationKey.trim().isEmpty) {
      return ResetPasswordResult(success: false, message: '본인인증 정보가 없습니다.');
    }

    state = state.copyWith(isLoading: true);

    try {
      return await ref
          .read(authRepositoryProvider)
          .resetPassword(
            loginId: state.loginId,
            identityVerificationKey: identityVerificationKey.trim(),
            newPassword: state.newPassword,
          );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<ResetPasswordResult> submitIdentityVerifyReset(
    String identityVerificationKey,
  ) async {
    final message = validateIdentityVerifyReset();
    if (message != null) {
      return ResetPasswordResult(success: false, message: message);
    }
    if (identityVerificationKey.trim().isEmpty) {
      return ResetPasswordResult(success: false, message: '본인인증 정보가 없습니다.');
    }

    state = state.copyWith(isLoading: true);

    try {
      final session = await ref
          .read(authRepositoryProvider)
          .verifyIdentityAndResetPassword(
            identityVerificationKey: identityVerificationKey.trim(),
            newPassword: state.newPassword,
          );

      await ref
          .read(tokenStorageProvider)
          .saveTokens(
            accessToken: session.accessToken,
            refreshToken: session.refreshToken,
            role: session.role,
          );

      return const ResetPasswordResult(
        success: true,
        message: '비밀번호가 변경되었습니다.',
      );
    } on AuthRepositoryException catch (e) {
      return ResetPasswordResult(
        success: false,
        message: e.message,
        code: e.code,
      );
    } catch (_) {
      return const ResetPasswordResult(
        success: false,
        message: '비밀번호 재설정에 실패했습니다.',
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
