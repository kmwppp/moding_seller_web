import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/dash_board/presentation/providers/dash_board_viewmodel.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_box_styles.dart';
import '../widgets/now_order_item.dart';

class NowOrderSection extends ConsumerWidget {
  const NowOrderSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashBoardViewModelProvider);
    return Container(
      decoration: AppBoxStyles.borderBox.copyWith(
        color: const Color(0xFFFCFDFC),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    AppStrings.ordersToProcessNow,
                    style: context.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
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
                    '즉시 확인',
                    style: context.bodySmall.copyWith(
                      color: AppColors.pointColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              '지금 바로 대응이 필요한 주문 현황만 모아서 보여드려요.',
              style: context.body.copyWith(color: AppColors.darkGrey),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: NowOrderItem(
                    label: AppStrings.waitingForApproval,
                    value:
                        '${state.dashboardInfo?.data.actionRequired.approvalPendingCount}',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: NowOrderItem(
                    label: AppStrings.waitingForDelivery,
                    value:
                        '${state.dashboardInfo?.data.actionRequired.readyToShipCount}',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: NowOrderItem(
                    label: AppStrings.deliveryDelay,
                    value:
                        '${state.dashboardInfo?.data.actionRequired.shippingDelayedCount}',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
