import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../theme/app_text_styles.dart';

class WebBottomSheet {
  /// 공통 바텀시트 호출 함수
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    bool isScrollControlled = true,
    bool showDragHandle = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: isScrollControlled,
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Container(
              height: 50,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.pointColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Text(
                title,
                style: context.bodyLarge.copyWith(color: Colors.white),
              ),
            ),
          ],
          // 실제 전달받은 위젯이 들어가는 곳
          child,
        ],
      ),
    );
  }
}
