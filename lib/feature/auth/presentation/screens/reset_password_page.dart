import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_president_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_president_web/core/services/token_storage.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:moding_president_web/feature/auth/presentation/providers/reset_password_viewmodel.dart';
import 'package:moding_president_web/feature/auth/presentation/widgets/auth_center_card.dart';
import 'package:moding_president_web/feature/auth/presentation/widgets/auth_info_notice.dart';
import 'package:moding_president_web/feature/auth/presentation/widgets/auth_labeled_field.dart';
import 'package:moding_president_web/feature/auth/presentation/widgets/auth_page_header.dart';
import 'package:moding_president_web/feature/auth/presentation/widgets/auth_page_shell.dart';

import '../../../../core/constants/app_colors.dart';

class ResetPasswordPage extends ConsumerStatefulWidget {
  const ResetPasswordPage({
    super.key,
    this.identityVerificationKey = '',
    this.verifiedName = '',
    this.verifiedPhone = '',
    this.isIdentityVerifyMode = false,
  });

  final String identityVerificationKey;
  final String verifiedName;
  final String verifiedPhone;
  final bool isIdentityVerifyMode;

  @override
  ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {
  final _loginIdController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _newPasswordConfirmController = TextEditingController();

  @override
  void dispose() {
    _loginIdController.dispose();
    _newPasswordController.dispose();
    _newPasswordConfirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (widget.identityVerificationKey.trim().isEmpty) {
      if (widget.isIdentityVerifyMode) {
        final confirmed = await _showIdentityVerificationRequiredDialog();

        if (!mounted || !confirmed) {
          return;
        }
      }

      final startResult = await ref
          .read(authRepositoryProvider)
          .startIdentityVerification(
            widget.isIdentityVerifyMode
                ? 'WEB_IDENTITY_VERIFY'
                : 'WEB_RESET_PASSWORD',
          );

      if (!mounted) {
        return;
      }

      final authUrl = startResult.authUrl?.trim() ?? '';
      if (!startResult.success || authUrl.isEmpty) {
        await AppDialog.showError(
          context,
          startResult.message.isNotEmpty
              ? startResult.message
              : '본인인증을 시작하지 못했습니다.',
        );
        return;
      }

      final uri = Uri.tryParse(authUrl);
      if (uri == null) {
        await AppDialog.showError(context, '본인인증 주소가 올바르지 않습니다.');
        return;
      }

      if (widget.isIdentityVerifyMode) {
        html.window.sessionStorage['pendingIdentityVerifyMode'] = '1';
      }
      html.window.location.replace(uri.toString());
      return;
    }

    final viewModel = ref.read(resetPasswordViewModelProvider.notifier);
    final result = widget.isIdentityVerifyMode
        ? await viewModel.submitIdentityVerifyReset(
            widget.identityVerificationKey,
          )
        : await viewModel.submit(widget.identityVerificationKey);

    if (!mounted) {
      return;
    }

    if (result.success) {
      await AppDialog.showSuccess(
        context,
        result.message.isNotEmpty
            ? result.message
            : widget.isIdentityVerifyMode
            ? '비밀번호가 변경되었습니다.'
            : '비밀번호가 재설정되었습니다.',
      );
      if (!mounted) {
        return;
      }
      context.go(widget.isIdentityVerifyMode ? '/main' : '/login?forceLogin=1');
      return;
    }

    final errorMessage = widget.isIdentityVerifyMode
        ? result.message.isNotEmpty
              ? result.message
              : '비밀번호 재설정에 실패했습니다.'
        : switch (result.statusCode) {
            400 => '기존 비밀번호와 일치합니다.',
            404 => '일치하는 계정이 없습니다.',
            _ =>
              result.message.isNotEmpty ? result.message : '비밀번호 재설정에 실패했습니다.',
          };

    await AppDialog.showError(context, errorMessage);

    final shouldReturnToLogin =
        widget.isIdentityVerifyMode && result.code == 'DUPLICATE_RESOURCE';

    if (shouldReturnToLogin && mounted) {
      await ref.read(tokenStorageProvider).deleteAll();

      if (!mounted) {
        return;
      }

      context.go('/login?forceLogin=1');
    }
  }

  Future<bool> _showIdentityVerificationRequiredDialog() async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEFF8EF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.verified_user_outlined,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    '본인인증이 필요합니다',
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '초기 판매자 계정은 첫 로그인 시에 본인인증이 필요합니다.',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: const Color(0xFF6B7169),
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 48,
                    child: FilledButton(
                      onPressed: () => Navigator.pop(dialogContext, true),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('본인인증'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(resetPasswordViewModelProvider);
    final hasIdentityVerificationKey = widget.identityVerificationKey
        .trim()
        .isNotEmpty;
    return AuthPageShell(
      child: AuthCenterCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AuthPageHeader(
              title: '비밀번호 재설정',
              description: '새 비밀번호를 등록해주세요.',
            ),
            const SizedBox(height: 24),
            AuthInfoNotice(
              message: hasIdentityVerificationKey
                  ? '본인인증이 완료되어 새 비밀번호를 등록할 수 있습니다.'
                  : widget.isIdentityVerifyMode
                  ? '계정 보호를 위해 본인인증 후 비밀번호를 변경해야 합니다.'
                  : '본인인증을 완료하면 이 페이지로 다시 돌아와 비밀번호를 변경할 수 있습니다.',
            ),
            const SizedBox(height: 20),
            if (hasIdentityVerificationKey) ...[
              if (widget.verifiedName.trim().isNotEmpty ||
                  widget.verifiedPhone.trim().isNotEmpty) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FBF8),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFDDE9DD)),
                  ),
                  child: Text(
                    [
                      if (widget.verifiedName.trim().isNotEmpty)
                        widget.verifiedName.trim(),
                      if (widget.verifiedPhone.trim().isNotEmpty)
                        widget.verifiedPhone.trim(),
                    ].join(' · '),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 14),
              ],
              if (!widget.isIdentityVerifyMode) ...[
                AuthLabeledField(
                  label: '아이디',
                  controller: _loginIdController,
                  hintText: '아이디를 입력해주세요.',
                  textInputAction: TextInputAction.next,
                  onChanged: ref
                      .read(resetPasswordViewModelProvider.notifier)
                      .updateLoginId,
                ),
                const SizedBox(height: 14),
              ],
              AuthLabeledField(
                label: '새 비밀번호',
                controller: _newPasswordController,
                hintText: '새 비밀번호를 입력해주세요.',
                obscureText: true,
                textInputAction: TextInputAction.next,
                onChanged: ref
                    .read(resetPasswordViewModelProvider.notifier)
                    .updateNewPassword,
              ),
              const SizedBox(height: 14),
              AuthLabeledField(
                label: '새 비밀번호 확인',
                controller: _newPasswordConfirmController,
                hintText: '새 비밀번호를 한번 더 입력해주세요.',
                obscureText: true,
                textInputAction: TextInputAction.done,
                onChanged: ref
                    .read(resetPasswordViewModelProvider.notifier)
                    .updateNewPasswordConfirm,
                onSubmitted: (_) => _submit(),
              ),
            ] else ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FBF8),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFDDE9DD)),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.lock_reset_outlined,
                      color: AppColors.primary,
                      size: 28,
                    ),
                    SizedBox(height: 12),
                    Text(
                      '비밀번호를 재설정하려면 먼저 나이스 본인인증이 필요합니다.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 24),
            SizedBox(
              height: 48,
              child: FilledButton(
                onPressed: state.isLoading ? null : _submit,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
                child: state.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.4,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        hasIdentityVerificationKey
                            ? '비밀번호 변경'
                            : widget.isIdentityVerifyMode
                            ? '본인인증 후 비밀번호 변경'
                            : '본인인증 후 비밀번호 재설정',
                      ),
              ),
            ),
            const SizedBox(height: 12),
            if (!widget.isIdentityVerifyMode)
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('로그인으로 돌아가기'),
              ),
          ],
        ),
      ),
    );
  }
}
