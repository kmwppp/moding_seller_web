import 'package:flutter/material.dart';
import 'package:moding_seller_web/feature/auth/presentation/widgets/auth_page_shell.dart';
import 'package:moding_seller_web/feature/auth/presentation/widgets/auth_result_card.dart';

class FindIdResultPage extends StatelessWidget {
  const FindIdResultPage({super.key, required this.loginId});

  final String loginId;

  @override
  Widget build(BuildContext context) {
    return AuthPageShell(
      child: AuthResultCard(
        title: '아이디 확인',
        description: '본인인증 정보로 확인된 판매자 계정입니다.',
        resultLabel: '확인된 아이디',
        resultValue: loginId,
        primaryButtonText: '로그인하러 가기',
      ),
    );
  }
}
