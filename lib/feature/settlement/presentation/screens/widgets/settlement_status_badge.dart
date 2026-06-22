import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../models/settlement_item.dart';

class SettlementStatusBadge extends StatelessWidget {
  const SettlementStatusBadge({super.key, required this.status});

  final SettlementStatusType status;

  @override
  Widget build(BuildContext context) {
    final activeColor = _activeColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: activeColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status.label,
        style: context.caption.copyWith(
          color: activeColor,
          fontWeight: FontWeight.w700,
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
        return Colors.red;
      case SettlementStatusType.cancelled:
        return Colors.red;
    }
  }
}
