import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class SettlementDetailKeyValueRow extends StatelessWidget {
  const SettlementDetailKeyValueRow({
    super.key,
    required this.label,
    required this.valueText,
    this.isBoldValue = false,
  });

  final String label;
  final String valueText;
  final bool isBoldValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: isBoldValue
                  ? context.body.copyWith(color: AppColors.darkGrey)
                  : context.bodySmall.copyWith(color: AppColors.darkGrey),
            ),
          ),
          Expanded(
            child: Text(
              valueText,
              style: isBoldValue
                  ? context.body.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    )
                  : context.bodySmall.copyWith(color: AppColors.darkGrey),
            ),
          ),
        ],
      ),
    );
  }
}
