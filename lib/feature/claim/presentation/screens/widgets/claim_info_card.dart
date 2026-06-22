import 'package:flutter/material.dart';

import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ClaimInfoCard extends StatelessWidget {
  const ClaimInfoCard({
    super.key,
    required this.title,
    required this.children,
    this.sectionColor = Colors.white,
  });

  final Color sectionColor;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: AppBoxStyles.borderBox.copyWith(
        borderRadius: BorderRadius.circular(12),
        color: sectionColor != Colors.white
            ? sectionColor.withValues(alpha: 0.4)
            : const Color(0xFFFCFDFC),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.bodyLarge.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }
}
