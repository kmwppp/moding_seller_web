import 'package:flutter/material.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';

class BusinessProfileInfoRow extends StatelessWidget {
  const BusinessProfileInfoRow({
    super.key,
    required this.title,
    required this.content,
    this.isLast = false,
  });

  final String title;
  final String content;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: Color(0xFFE9EDE9))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: context.bodySmall.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Text(content, style: context.body.copyWith(height: 1.45)),
          ),
        ],
      ),
    );
  }
}
