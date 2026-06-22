import 'package:flutter/material.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';

class LoginAuxiliaryActions extends StatelessWidget {
  const LoginAuxiliaryActions({
    super.key,
    required this.onFindIdTap,
    required this.onFindPasswordTap,
  });

  final VoidCallback onFindIdTap;
  final VoidCallback onFindPasswordTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onFindIdTap,
          child: const Text('아이디 찾기', style: AppTextStyles.bodyMedium),
        ),
        Container(
          width: 1,
          height: 14,
          color: AppColors.mediumGrey,
          margin: const EdgeInsets.symmetric(horizontal: 4),
        ),
        TextButton(
          onPressed: onFindPasswordTap,
          child: const Text('비밀번호 찾기', style: AppTextStyles.bodyMedium),
        ),
      ],
    );
  }
}
