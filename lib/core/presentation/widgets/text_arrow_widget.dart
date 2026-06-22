import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../theme/app_text_styles.dart';

class TextArrowWidget extends StatelessWidget {
  const TextArrowWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: context.bodySmall.copyWith(color: AppColors.darkGrey),
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          size: 12,
          color: AppColors.darkGrey,
        ),
      ],
    );
  }
}
