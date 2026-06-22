import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.paddingVertical = 3,
    required this.boxColor,
    required this.textColor,
  });

  final String title;
  final double paddingVertical;
  final Color boxColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: paddingVertical),
        decoration: BoxDecoration(color: boxColor),
        child: Text(title, style: context.body.copyWith(color: textColor)),
      ),
    );
  }
}
