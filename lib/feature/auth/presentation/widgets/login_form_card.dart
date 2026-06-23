import 'package:flutter/material.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/auth/presentation/widgets/login_auxiliary_actions.dart';
import 'package:moding_seller_web/feature/auth/presentation/widgets/login_text_field.dart';

class LoginFormCard extends StatelessWidget {
  const LoginFormCard({
    super.key,
    required this.idController,
    required this.passwordController,
    required this.isLoading,
    required this.onLoginTap,
    required this.onFindIdTap,
    required this.onFindPasswordTap,
  });

  final TextEditingController idController;
  final TextEditingController passwordController;
  final bool isLoading;
  final VoidCallback onLoginTap;
  final VoidCallback onFindIdTap;
  final VoidCallback onFindPasswordTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 420),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.mediumGrey),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 30,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '판매자 로그인',
            textAlign: TextAlign.center,
            style: AppTextStyles.displayLarge,
          ),
          const SizedBox(height: 8),
          Text(
            '판매자 계정으로 로그인해주세요.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.hintTextColor,
            ),
          ),
          const SizedBox(height: 28),
          LoginTextField(
            controller: idController,
            hintText: '아이디',
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12),
          LoginTextField(
            controller: passwordController,
            hintText: '비밀번호',
            obscureText: true,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => onLoginTap(),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 48,
            child: FilledButton(
              onPressed: isLoading ? null : onLoginTap,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.4,
                        color: Colors.white,
                      ),
                    )
                  : const Text('로그인'),
            ),
          ),
          const SizedBox(height: 20),
          LoginAuxiliaryActions(
            onFindIdTap: onFindIdTap,
            onFindPasswordTap: onFindPasswordTap,
          ),
        ],
      ),
    );
  }
}
