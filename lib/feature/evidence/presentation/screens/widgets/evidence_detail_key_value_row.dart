import 'package:flutter/material.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';

class EvidenceDetailKeyValueRow extends StatelessWidget {
  const EvidenceDetailKeyValueRow({
    super.key,
    required this.label,
    required this.value,
    this.labelWidth = 140,
  });

  final String label;
  final String value;
  final double labelWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: labelWidth,
            child: Text(
              label,
              style: context.body.copyWith(color: AppColors.darkGrey),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: context.body.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
