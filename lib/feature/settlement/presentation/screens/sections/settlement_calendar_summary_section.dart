import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/theme/app_text_styles.dart';

class SettlementCalendarSummarySection extends StatelessWidget {
  const SettlementCalendarSummarySection({
    super.key,
    required this.nextSettlementDateText,
    required this.nextSettlementCountText,
    required this.scheduledAmountText,
  });

  final String nextSettlementDateText;
  final String nextSettlementCountText;
  final String scheduledAmountText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: AppBoxStyles.borderBox,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '다음 정산 예정일: $nextSettlementDateText ($nextSettlementCountText)',
            style: context.body.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            '예정 금액: $scheduledAmountText',
            style: context.body.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
