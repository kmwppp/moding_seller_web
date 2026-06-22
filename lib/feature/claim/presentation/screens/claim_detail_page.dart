import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/constants/app_responsive_layout.dart';
import 'package:moding_president_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_president_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_president_web/core/presentation/widgets/modal/web_bottom_sheet.dart';
import 'package:moding_president_web/core/utils/app_enum.dart';
import 'package:moding_president_web/feature/claim/domain/enums/claim_enum.dart';
import 'package:moding_president_web/feature/claim/domain/enums/claim_status.dart';
import 'package:moding_president_web/feature/preparing_delivery/presentation/enums/delivery_execute_tab.dart';
import 'package:moding_president_web/feature/claim/presentation/providers/claim_detail/claim_detail_state.dart';
import 'package:moding_president_web/feature/claim/presentation/providers/claim_detail/claim_detail_viewmodel.dart';
import 'package:moding_president_web/feature/claim/presentation/screens/sections/claim_detail_delivery_check_section.dart';
import 'package:moding_president_web/feature/claim/presentation/screens/sections/claim_detail_delivery_section.dart';
import 'package:moding_president_web/feature/claim/presentation/screens/widgets/claim_approve.dart';
import 'package:moding_president_web/feature/claim/presentation/screens/widgets/claim_history_sheet.dart';
import 'package:moding_president_web/feature/claim/presentation/screens/widgets/claim_image_gallery.dart';
import 'package:moding_president_web/feature/claim/presentation/screens/widgets/claim_info_card.dart';
import 'package:moding_president_web/feature/claim/presentation/screens/widgets/claim_line.dart';
import 'package:moding_president_web/feature/claim/presentation/screens/widgets/claim_reject_reason.dart';
import 'package:moding_president_web/feature/claim/presentation/screens/widgets/claim_tracking_events_sheet.dart';
import 'package:moding_president_web/feature/notification/presentation/widgets/notification_bell_button.dart';

import '../../../../core/presentation/widgets/text_arrow_widget.dart';
import '../../../../core/theme/app_box_styles.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../dash_board/presentation/screens/widgets/custom_button.dart';
import '../providers/claim_main/claim_main_viewmodel.dart';

class ClaimDetailPage extends ConsumerStatefulWidget {
  const ClaimDetailPage({super.key, required this.claimId});

  final String claimId;

  @override
  ConsumerState<ClaimDetailPage> createState() => _ClaimDetailPageState();
}

class _ClaimDetailPageState extends ConsumerState<ClaimDetailPage> {
  bool _isSubmitting = false;

  void _setSubmitting(bool value) {
    if (!mounted) return;
    setState(() => _isSubmitting = value);
  }

  Future<void> _handleVerifyTracking(ClaimDetailViewModel notifier) async {
    _setSubmitting(true);

    final result = await notifier.verifyInvoice(widget.claimId);

    _setSubmitting(false);
    if (!mounted) {
      return;
    }

    if (result.success && (result.data?.isRecipientMismatch ?? false)) {
      final confirmed = await AppDialog.showConfirm(
        context,
        message: '송장번호의 수령지와 주문지의 수령지의 우편번호가 일치하지 않습니다. 그래도 보내시겠습니까?',
      );
      if (!mounted) {
        return;
      }
      if (confirmed) {
        notifier.completeTrackingValidation(
          result.message.isNotEmpty ? result.message : '송장번호를 확인하였습니다.',
        );
      }
      return;
    }

    if (result.success) {
      await AppDialog.showSuccess(context, result.message);
      return;
    }

    if (result.message.isNotEmpty) {
      await AppDialog.showError(context, result.message);
    }
  }

  bool _isReshipActionEnabled(ClaimDetailState state) {
    if (state.selectedDeliveryTab == DeliveryExecuteTab.courier) {
      return state.isTrackingValidated;
    }
    return true;
  }

  Future<bool> _showReshipConfirmDialog() async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 420),
            decoration: AppBoxStyles.borderBox.copyWith(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
            ),
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF4E8),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.local_shipping_outlined,
                    color: AppColors.pointColor,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '재배송 진행',
                  style: context.title.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Text(
                  '현재 선택한 배송 설정으로 상품을 다시 출고합니다. 재배송을 진행하시겠어요?',
                  style: context.body.copyWith(
                    color: AppColors.darkGrey,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FBF8),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFE2EBE2)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        size: 18,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '재배송 처리 후에는 클레임 상태가 다음 단계로 이동합니다.',
                          style: context.bodySmall.copyWith(
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(dialogContext).pop(false),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.darkGrey,
                          side: const BorderSide(
                            color: AppColors.boxBorderGrey,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          '취소',
                          style: context.body.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(dialogContext).pop(true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          '재배송 진행',
                          style: context.body.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final isWide = AppResponsiveLayout.isDesktop(context);
    final state = ref.watch(claimDetailViewModelProvider(widget.claimId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('클레임 상세'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Center(child: NotificationBellButton()),
          ),
        ],
      ),
      body: Stack(
        children: [
          !state.isLoading
              ? SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    isWide ? 24 : 16,
                    isWide ? 24 : 16,
                    isWide ? 24 : 16,
                    isWide ? 40 : 20,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 920),
                      child: Column(
                        children: [
                          _ClaimDetailHeroCard(claimId: widget.claimId),
                          const SizedBox(height: 16),
                          ClaimInfoCard(
                            title: '클레임 상태',
                            children: [
                              ClaimLine(
                                label: '상태',
                                value: state.model!.status.label,
                              ),
                              if ((state.model!.rejectReason ?? '')
                                  .trim()
                                  .isNotEmpty)
                                ClaimLine(
                                  label: '거절 사유',
                                  value: state.model!.rejectReason!.trim(),
                                ),
                              ClaimLine(
                                label: '날짜',
                                value: state
                                    .model!
                                    .createdAt
                                    .toDataAndTimeNoLineBreak,
                              ),
                              if (state.model!.status ==
                                  ClaimStatus.reship) ...[
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        WebBottomSheet.show(
                                          context: context,
                                          title: "재배송 추적 내역",
                                          child: ClaimTrackingEventsSheet(
                                            events: state
                                                .model!
                                                .reshipTrackingEvents,
                                          ),
                                        );
                                      },
                                      child: TextArrowWidget(text: "배송 추적 내역"),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                          ClaimInfoCard(
                            title: '주문 정보',
                            children: [
                              ClaimLine(
                                label: '주문번호',
                                value: state.model!.orderCode,
                              ),
                              ClaimLine(
                                label: '식당명',
                                value: state.model!.buyerBusinessName,
                              ),
                              ClaimLine(
                                label: '배송지',
                                value:
                                    "[${state.model!.zipCode}] ${state.model!.address} (${state.model?.addressDetail ?? ""})",
                              ),
                              ClaimLine(
                                label: '전화번호',
                                value: state.model!.phone ?? "",
                              ),
                              ClaimLine(
                                label: '배송 완료일',
                                value:
                                    state.model!.deliveredAt?.toDateOnly ?? "",
                              ),
                              ClaimLine(
                                label: '배송 요청 사항',
                                value: state.model!.deliveryRequest ?? "",
                              ),
                            ],
                          ),
                          ClaimInfoCard(
                            title: '상품 정보',
                            children: [
                              ClaimLine(
                                label: '상품명',
                                value: state.model!.items[0].productName,
                              ),
                              ClaimLine(
                                label: '옵션',
                                value: state.model!.items[0].optionName,
                              ),
                              ClaimLine(
                                label: '주문 수량',
                                value: state.model!.items[0].quantity
                                    .toString(),
                              ),
                            ],
                          ),
                          ClaimInfoCard(
                            title: '클레임 내용',
                            children: [
                              ClaimLine(
                                label: '유형',
                                value: state.model!.claimType.label,
                              ),
                              ClaimLine(
                                label: '사유',
                                value: state.model!.claimReason,
                              ),
                              ClaimLine(
                                label: '문제 수량',
                                value: state.model!.items[0].claimedQuantity
                                    .toString(),
                              ),

                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      WebBottomSheet.show(
                                        context: context,
                                        title: "클레임 히스토리",
                                        child: ClaimHistorySheet(
                                          histories:
                                              state.model!.statusHistories,
                                        ),
                                      );
                                    },
                                    child: TextArrowWidget(text: "클레임 히스토리"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ClaimInfoCard(
                            title: '증빙 사진',
                            children: [
                              ClaimImageGallery(
                                isWide: isWide,
                                claimId: widget.claimId,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          getBottomSection(
                            context,
                            state.model!.status,
                            ref,
                            widget.claimId,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : LoadingIndicator(),
          if (_isSubmitting)
            Positioned.fill(
              child: Container(
                color: Colors.black.withValues(alpha: 0.35),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }

  Widget getBottomSection(
    BuildContext context,
    ClaimStatus status,
    WidgetRef ref,
    String? claimId,
  ) {
    final state = ref.watch(claimDetailViewModelProvider(claimId));
    final notifier = ref.read(claimDetailViewModelProvider(claimId).notifier);
    switch (status) {
      case ClaimStatus.requested:
        return _ActionCard(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    WebBottomSheet.show(
                      context: context,
                      title: "거절 사유",
                      child: ClaimRejectReason(claimId: claimId),
                    );
                  },
                  child: CustomButton(
                    title: '거절',
                    boxColor: AppColors.darkGrey,
                    textColor: Colors.white,
                    paddingVertical: 8,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    WebBottomSheet.show(
                      context: context,
                      title: "처리 방식 선택",
                      child: ClaimApprove(claimId: claimId),
                    );
                  },
                  child: CustomButton(
                    title: '승인',
                    boxColor: AppColors.primary,
                    textColor: Colors.white,
                    paddingVertical: 8,
                  ),
                ),
              ),
            ],
          ),
        );
      case ClaimStatus.approved:
        return Column(
          children: [
            ClaimDetailDeliverySection(
              claimId: claimId,
              onVerifyTracking: () => _handleVerifyTracking(notifier),
            ),
            const SizedBox(height: 12),
            _ActionCard(
              child: GestureDetector(
                onTap: !_isReshipActionEnabled(state)
                    ? null
                    : () async {
                        final confirmed = await _showReshipConfirmDialog();
                        if (!confirmed) {
                          return;
                        }

                        final result = await notifier.patchClaimReship(
                          claimId!,
                        );
                        if (result.success) {
                          AppDialog.showSuccess(
                            context,
                            "재배송 처리를 완료하였습니다.",
                            onConfirm: () async {
                              await ref
                                  .read(claimMainViewModelProvider.notifier)
                                  .resetToWaiting(ClaimSearchStatus.processing);
                              context.pop();
                            },
                          );
                        } else {
                          AppDialog.showError(context, result.message);
                        }
                      },
                child: CustomButton(
                  title: '재배송',
                  boxColor: _isReshipActionEnabled(state)
                      ? AppColors.primary
                      : AppColors.darkGrey,
                  textColor: Colors.white,
                  paddingVertical: 8,
                ),
              ),
            ),
          ],
        );
      case ClaimStatus.reship:
        // 배송 정보가 보여야함.
        return Column(
          children: [
            ClaimDetailDeliveryCheckSection(
              reshipDeliveryMethod: state.model?.reshipDeliveryMethod,
              reshipCourierCode: state.model?.reshipCourierCode ?? "",
              reshipTrackingNumber: state.model?.reshipTrackingNumber ?? "",
            ),
            const SizedBox(height: 12),
            _ActionCard(
              child: GestureDetector(
                onTap: () async {
                  final result = await notifier.patchClaimReshipComplete(
                    claimId!,
                  );
                  if (result.success) {
                    AppDialog.showSuccess(
                      context,
                      "수령 완료 처리했습니다.",
                      onConfirm: () async {
                        await ref
                            .read(claimMainViewModelProvider.notifier)
                            .resetToWaiting(ClaimSearchStatus.completed);
                        context.pop();
                      },
                    );
                  } else {
                    AppDialog.showError(context, result.message);
                  }
                },
                child: CustomButton(
                  title: '재배송 수령 완료',
                  boxColor: AppColors.primary,
                  textColor: Colors.white,
                  paddingVertical: 8,
                ),
              ),
            ),
          ],
        );
      case ClaimStatus.rejected:
      case ClaimStatus.appealed:
      case ClaimStatus.completed:
        return GestureDetector(
          onTap: () {
            context.pop();
          },
          child: CustomButton(
            title: '확인',
            boxColor: AppColors.primary,
            textColor: Colors.white,
            paddingVertical: 8,
          ),
        );
    }
  }
}

class _ClaimDetailHeroCard extends ConsumerWidget {
  const _ClaimDetailHeroCard({required this.claimId});

  final String claimId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(claimDetailViewModelProvider(claimId));
    final model = state.model;

    return Container(
      width: double.infinity,
      decoration: AppBoxStyles.borderBox.copyWith(
        color: const Color(0xFFF8FBF8),
      ),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      child: model == null
          ? Text(
              '클레임 정보를 불러오는 중입니다.',
              style: context.body.copyWith(color: AppColors.darkGrey),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '클레임 상세',
                      style: context.title.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF4E8),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: const Color(0xFFFFE2BF)),
                      ),
                      child: Text(
                        model.status.label,
                        style: context.bodySmall.copyWith(
                          color: AppColors.pointColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF7EF),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        model.claimType.label,
                        style: context.bodySmall.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  model.claimCode,
                  style: context.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${model.items[0].productName} 클레임 접수 건입니다. 주문 정보와 처리 상태를 확인한 뒤 필요한 조치를 진행해 주세요.',
                  style: context.body.copyWith(color: AppColors.darkGrey),
                ),
              ],
            ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: AppBoxStyles.borderBox.copyWith(
        color: const Color(0xFFFCFDFC),
      ),
      padding: const EdgeInsets.all(14),
      child: child,
    );
  }
}
