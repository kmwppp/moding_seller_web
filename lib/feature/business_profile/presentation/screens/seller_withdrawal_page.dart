import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/constants/app_responsive_layout.dart';
import 'package:moding_seller_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_seller_web/core/services/token_storage.dart';
import 'package:moding_seller_web/core/theme/app_box_styles.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/business_profile/presentation/providers/seller_withdrawal_viewmodel.dart';
import 'package:moding_seller_web/feature/reauth/presentation/widgets/reauth_required_card.dart';

class SellerWithdrawalPage extends ConsumerWidget {
  const SellerWithdrawalPage({super.key});

  static const _confirmMessage =
      '계속 진행하시면 판매자 권한이 해지되어 상품 등록, 판매, 주문 관리 기능을 이용할 수 없습니다.\n\n'
      '구매자 회원으로는 계속 이용할 수 있으며, 진행 중 주문·미정산금·활성 클레임·판매 중 상품이 있는 경우 해지가 제한될 수 있습니다. 판매자 권한 해지를 신청하시겠습니까?';

  Future<void> _handleReauthSuccess(BuildContext context, WidgetRef ref) async {
    final shouldWithdraw = await _showWithdrawConfirmDialog(context);
    if (!context.mounted || !shouldWithdraw) {
      return;
    }

    final reauthKey = await ref.read(tokenStorageProvider).getReauthKey();
    final message = await ref
        .read(sellerWithdrawalViewModelProvider.notifier)
        .withdrawFromSelling(reauthKey ?? '');

    if (!context.mounted) {
      return;
    }

    if (message == null) {
      await ref.read(tokenStorageProvider).deleteAll();
      if (context.mounted) {
        context.go('/login?forceLogin=1');
      }
      return;
    }

    await AppDialog.showError(context, message);
    if (context.mounted && context.canPop()) {
      context.pop();
    }
  }

  Future<bool> _showWithdrawConfirmDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF3E8),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.warning_amber_rounded,
                          color: Color(0xFFFF7A00),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '판매자 권한 해지 신청',
                          style: context.bodyLarge.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    _confirmMessage,
                    style: context.body.copyWith(
                      color: AppColors.textColor,
                      height: 1.55,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(false),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.textColor,
                            side: const BorderSide(
                              color: AppColors.boxBorderGrey,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: Text(
                            '취소',
                            style: context.body.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF7A00),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: Text(
                            '해지',
                            style: context.body.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
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
  Widget build(BuildContext context, WidgetRef ref) {
    final isDesktop = AppResponsiveLayout.isDesktop(context);
    final state = ref.watch(sellerWithdrawalViewModelProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAF7),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: isDesktop
                    ? const EdgeInsets.all(32)
                    : const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.arrow_back_rounded),
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerLeft,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          decoration: AppBoxStyles.borderBox.copyWith(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: EdgeInsets.all(isDesktop ? 28 : 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '판매자 권한 해지 신청',
                                style: context.title.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '본인 확인을 위해 계정 비밀번호를 한 번 더 입력해주세요.',
                                style: context.body.copyWith(
                                  color: AppColors.darkGrey,
                                  height: 1.45,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ReauthRequiredCard(
                                title: '비밀번호 재확인',
                                description:
                                    '판매자 권한 해지 신청은 민감한 작업이라 비밀번호 재확인이 필요합니다.',
                                buttonLabel: '판매자 권한 해지 신청',
                                onSuccess: () =>
                                    _handleReauthSuccess(context, ref),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (state.isSubmitting)
              Positioned.fill(
                child: ColoredBox(
                  color: Colors.black.withValues(alpha: 0.28),
                  child: const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
