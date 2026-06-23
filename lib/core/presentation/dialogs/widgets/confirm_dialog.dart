import 'package:flutter/material.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';

import '../../../constants/app_colors.dart';

class ConfirmDialog extends StatelessWidget {
  final String message;
  final VoidCallback? onConfirm;

  const ConfirmDialog({super.key, required this.message, this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        width: 300,
        height: 150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(child: Text(message, style: context.bodyLarge)),
            ),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        color: AppColors.darkGrey,
                        height: 40,
                        child: Text(
                          "취소",
                          style: context.body.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context, true);
                      onConfirm?.call();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        color: AppColors.primary,
                        height: 40,
                        child: Text(
                          "확인",
                          style: context.body.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
