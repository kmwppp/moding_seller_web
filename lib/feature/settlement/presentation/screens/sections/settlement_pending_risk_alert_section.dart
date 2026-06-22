import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/theme/app_text_styles.dart';

class SettlementPendingRiskAlertSection extends StatelessWidget {
  const SettlementPendingRiskAlertSection({
    super.key,
    required this.holdCount,
    required this.holdTotalText,
    required this.onTap,
  });

  final int holdCount;
  final String holdTotalText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (holdCount <= 0) return const SizedBox.shrink();

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: AppBoxStyles.borderBox.copyWith(
          color: Colors.red.withOpacity(0.2),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: AppColors.pointColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  '정산 보류 $holdCount건 (총 $holdTotalText)',
                  style: context.body.copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              '확인이 필요합니다.',
              style: context.bodySmall.copyWith(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
