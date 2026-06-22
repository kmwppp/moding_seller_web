import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_president_web/feature/auth/presentation/widgets/auth_center_card.dart';
import 'package:moding_president_web/feature/auth/presentation/widgets/auth_info_notice.dart';
import 'package:moding_president_web/feature/auth/presentation/widgets/auth_page_header.dart';
import 'package:moding_president_web/feature/auth/presentation/widgets/auth_page_shell.dart';

class NiceAuthCallbackPage extends StatefulWidget {
  const NiceAuthCallbackPage({
    super.key,
    required this.flow,
    required this.keyValue,
    required this.name,
    required this.phone,
  });

  final String flow;
  final String keyValue;
  final String name;
  final String phone;

  @override
  State<NiceAuthCallbackPage> createState() => _NiceAuthCallbackPageState();
}

class _NiceAuthCallbackPageState extends State<NiceAuthCallbackPage> {
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _handleCallback());
  }

  void _handleCallback() {
    if (_navigated || !mounted) {
      return;
    }
    _navigated = true;

    final flow = widget.flow.trim().replaceAll('-', '_');
    final key = widget.keyValue.trim();
    final name = Uri.encodeComponent(widget.name.trim());
    final phone = Uri.encodeComponent(widget.phone.trim());

    if (key.isEmpty) {
      return;
    }

    if (flow == 'find-id') {
      context.go('/find-id?key=$key&name=$name&phone=$phone');
      return;
    }

    if (flow == 'reset_password') {
      context.go('/reset-password?key=$key&name=$name&phone=$phone');
      return;
    }

    if (flow == 'identity_verify' || flow == 'identity') {
      context.go(
        '/reset-password?mode=identityVerify&key=$key&name=$name&phone=$phone',
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasKey = widget.keyValue.trim().isNotEmpty;
    final flow = widget.flow.trim().replaceAll('-', '_');
    final isKnownFlow =
        flow == 'find-id' ||
        flow == 'reset_password' ||
        flow == 'identity_verify' ||
        flow == 'identity';

    return AuthPageShell(
      child: AuthCenterCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AuthPageHeader(
              title: '본인인증 확인',
              description: '인증 결과를 확인한 뒤 다음 화면으로 이동하고 있습니다.',
            ),
            const SizedBox(height: 24),
            AuthInfoNotice(
              message: hasKey && isKnownFlow
                  ? '본인인증이 완료되어 다음 단계로 이동합니다.'
                  : '본인인증 결과를 확인하지 못했습니다. 다시 시도해주세요.',
            ),
            const SizedBox(height: 28),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              alignment: Alignment.center,
              child: hasKey && isKnownFlow
                  ? const CircularProgressIndicator()
                  : const Icon(
                      Icons.error_outline,
                      size: 32,
                      color: Colors.redAccent,
                    ),
            ),
            const SizedBox(height: 12),
            if (!hasKey || !isKnownFlow)
              TextButton(
                onPressed: () => context.go('/login'),
                child: const Text('로그인으로 돌아가기'),
              ),
          ],
        ),
      ),
    );
  }
}
