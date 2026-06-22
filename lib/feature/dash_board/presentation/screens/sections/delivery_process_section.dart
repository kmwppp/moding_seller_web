import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/dash_board/presentation/providers/dash_board_viewmodel.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_box_styles.dart';

class DeliveryProcessSection extends ConsumerWidget {
  const DeliveryProcessSection({super.key});

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
                    AppStrings.deliveryProgress,
                    style: context.bodyLarge.copyWith(
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
                    '실시간 현황',
                    style: context.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '현재 배송 중인 주문 수를 빠르게 확인할 수 있어요.',
              style: context.body.copyWith(color: AppColors.darkGrey),
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5ECE5)),
              ),
              child: Row(
                children: [
                  Text(
                    AppStrings.inDelivery,
                    style: context.body.copyWith(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${state.dashboardInfo?.data.operationStats.shippingCount}${AppStrings.thing}',
                    style: context.bodyLarge.copyWith(
                      color: AppColors.pointColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
