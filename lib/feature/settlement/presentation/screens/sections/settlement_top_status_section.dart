import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../models/settlement_item.dart';

class SettlementTopStatusSection extends StatelessWidget {
  const SettlementTopStatusSection({
    super.key,
    required this.selectedStatus,
    required this.onSelectStatus,
    required this.scheduledTotalText,
    required this.holdTotalText,
    required this.completedTotalText,
  });

  final SettlementStatusType selectedStatus;
  final ValueChanged<SettlementStatusType> onSelectStatus;
  final String scheduledTotalText;
  final String holdTotalText;
  final String completedTotalText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatusButton(
            status: SettlementStatusType.pending,
            selectedStatus: selectedStatus,
            title: '정산예정',
            amountText: scheduledTotalText,
            onTap: () => onSelectStatus(SettlementStatusType.pending),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatusButton(
            status: SettlementStatusType.hold,
            selectedStatus: selectedStatus,
            title: '정산보류',
            amountText: holdTotalText,
            onTap: () => onSelectStatus(SettlementStatusType.hold),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatusButton(
            status: SettlementStatusType.confirmed,
            selectedStatus: selectedStatus,
            title: '정산완료',
            amountText: completedTotalText,
            onTap: () => onSelectStatus(SettlementStatusType.confirmed),
          ),
        ),
      ],
    );
  }
}

class _StatusButton extends StatelessWidget {
  const _StatusButton({
    required this.status,
    required this.selectedStatus,
    required this.title,
    required this.amountText,
    required this.onTap,
  });

  final SettlementStatusType status;
  final SettlementStatusType selectedStatus;
  final String title;
  final String amountText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = status == selectedStatus;
    final activeColor = _activeColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 74,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? activeColor : AppColors.darkGrey,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.body.copyWith(
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : AppColors.darkGrey,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              amountText,
              style: context.body.copyWith(
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : _activeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color get _activeColor {
    switch (status) {
      case SettlementStatusType.pending:
        return AppColors.pointColor;
      case SettlementStatusType.confirmed:
        return AppColors.primary;
      case SettlementStatusType.hold:
      case SettlementStatusType.cancelled:
        return Colors.red;
    }
  }
}
