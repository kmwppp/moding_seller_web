import 'package:flutter/material.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/dash_board/presentation/screens/widgets/custom_button.dart';

import '../../../constants/app_colors.dart';

class ResultDialog extends StatelessWidget {
  final String message;
  final bool isSuccess;
  final VoidCallback? onConfirm;

  const ResultDialog({
    super.key,
    required this.message,
    required this.isSuccess,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        width: 230,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// 아이콘
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: isSuccess
                    ? Colors.green.withOpacity(0.1)
                    : Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSuccess ? Icons.check : Icons.close,
                size: 32,
                color: isSuccess ? Colors.green : Colors.red,
              ),
            ),

            const SizedBox(height: 16),

            /// 타이틀
            // Text(
            //   isSuccess ? "성공" : "실패",
            //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            const SizedBox(height: 12),

            /// 메시지
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            /// 버튼
            SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // 다이얼로그 닫기
                  onConfirm?.call(); // 👈 외부 함수 실행
                },
                child: CustomButton(
                  title: "확인",
                  paddingVertical: 6,
                  boxColor: isSuccess
                      ? AppColors.primary
                      : AppColors.pointColor,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
