import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_seller_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_seller_web/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:moding_seller_web/feature/auth/presentation/providers/find_id_viewmodel.dart';
import 'package:moding_seller_web/feature/auth/presentation/widgets/auth_center_card.dart';
import 'package:moding_seller_web/feature/auth/presentation/widgets/auth_info_notice.dart';
import 'package:moding_seller_web/feature/auth/presentation/widgets/auth_page_header.dart';
import 'package:moding_seller_web/feature/auth/presentation/widgets/auth_page_shell.dart';

import '../../../../core/constants/app_colors.dart';

class FindIdPage extends ConsumerStatefulWidget {
  const FindIdPage({
    super.key,
    this.identityVerificationKey = '',
    this.verifiedName = '',
    this.verifiedPhone = '',
  });

  final String identityVerificationKey;
  final String verifiedName;
  final String verifiedPhone;

  @override
  ConsumerState<FindIdPage> createState() => _FindIdPageState();
}

class _FindIdPageState extends ConsumerState<FindIdPage> {
  bool _autoSubmitted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.identityVerificationKey.trim().isNotEmpty && !_autoSubmitted) {
        _autoSubmitted = true;
        _submit();
      }
    });
  }

  Future<void> _submit() async {
    final key = widget.identityVerificationKey.trim();
    if (key.isEmpty) {
      final startResult = await ref
          .read(authRepositoryProvider)
          .startIdentityVerification('WEB_FIND_ID');

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

      html.window.location.replace(uri.toString());
      return;
    }

    final result = await ref.read(findIdViewModelProvider.notifier).submit(key);

    if (!mounted) {
      return;
    }

    if (result.success && (result.loginId?.isNotEmpty ?? false)) {
      context.go('/find-id/result', extra: result.loginId!);
      return;
    }

    await AppDialog.showError(
      context,
      result.message.isNotEmpty ? result.message : '아이디를 찾을 수 없습니다.',
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(findIdViewModelProvider);
    return AuthPageShell(
      child: AuthCenterCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AuthPageHeader(
              title: '아이디 찾기',
              description: '본인인증 완료 후 판매자 계정을 확인할 수 있어요.',
            ),
            const SizedBox(height: 24),
            AuthInfoNotice(
              message: widget.identityVerificationKey.trim().isNotEmpty
                  ? '본인인증이 완료되어 아이디를 확인하고 있습니다.'
                  : '본인인증을 완료하면 이 페이지로 다시 돌아와 아이디를 확인합니다.',
            ),
            const SizedBox(height: 28),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FBF8),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFDDE9DD)),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.verified_user_outlined,
                    color: AppColors.primary,
                    size: 28,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.identityVerificationKey.trim().isNotEmpty
                        ? '본인인증 정보를 확인하고 아이디를 조회하고 있습니다.'
                        : '아이디를 찾기 위해 본인인증이 필요합니다.',
                    textAlign: TextAlign.center,
                  ),
                  if (widget.verifiedName.trim().isNotEmpty ||
                      widget.verifiedPhone.trim().isNotEmpty) ...[
                    const SizedBox(height: 14),
                    Text(
                      [
                        if (widget.verifiedName.trim().isNotEmpty)
                          widget.verifiedName.trim(),
                        if (widget.verifiedPhone.trim().isNotEmpty)
                          widget.verifiedPhone.trim(),
                      ].join(' · '),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
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
                        widget.identityVerificationKey.trim().isNotEmpty
                            ? '아이디 조회 다시 시도'
                            : '본인인증 후 아이디 확인',
                      ),
              ),
            ),
            const SizedBox(height: 12),
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
