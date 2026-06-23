import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_seller_web/core/routing/seller_entry_target.dart';
import 'package:moding_seller_web/core/services/token_storage.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:moding_seller_web/feature/main/presentation/providers/main_viewmodel.dart';
import 'package:moding_seller_web/feature/auth/presentation/providers/login_viewmodel.dart';
import 'package:moding_seller_web/feature/auth/presentation/widgets/login_form_card.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _webViewLoginRequested = false;
  bool _isCheckingSession = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrapLogin());
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _bootstrapLogin() async {
    final tokenStorage = ref.read(tokenStorageProvider);
    final routeUri = GoRouterState.of(context).uri;
    final forceLogin = routeUri.queryParameters['forceLogin']?.trim() == '1';

    if (forceLogin) {
      await tokenStorage.deleteAll();

      if (!mounted) {
        return;
      }

      setState(() {
        _isCheckingSession = false;
      });
      return;
    }

    final accessToken = await tokenStorage.getAccessToken();
    final role = await tokenStorage.getRole();

    if (!mounted) {
      return;
    }

    final entryTarget = SellerEntryTarget.fromUri(Uri.base);

    if ((accessToken?.isNotEmpty ?? false) && role?.toUpperCase() == 'SELLER') {
      _navigateToEntryTarget(entryTarget);
      return;
    }

    if (role != null && role.toUpperCase() != 'SELLER') {
      await tokenStorage.deleteAll();
    }

    await _tryWebViewLogin();
    if (!mounted || _webViewLoginRequested) {
      return;
    }

    setState(() {
      _isCheckingSession = false;
    });
  }

  Future<void> _tryWebViewLogin() async {
    if (_webViewLoginRequested) {
      return;
    }

    final token = Uri.base.queryParameters['webViewToken'];
    if (token == null || token.trim().isEmpty) {
      _webViewLoginRequested = false;
      return;
    }

    _webViewLoginRequested = true;
    final result = await ref
        .read(loginViewModelProvider.notifier)
        .loginWithWebViewToken(token);

    if (!mounted) {
      return;
    }

    await _handleLoginResult(result);

    if (!result.isSuccess) {
      setState(() {
        _isCheckingSession = false;
      });
    }
  }

  Future<void> _submitLogin() async {
    FocusScope.of(context).unfocus();

    final result = await ref
        .read(loginViewModelProvider.notifier)
        .login(loginId: _idController.text, password: _passwordController.text);

    if (!mounted) {
      return;
    }

    await _handleLoginResult(result);
  }

  Future<void> _handleLoginResult(LoginResult result) async {
    if (result.isSuccess) {
      if (result.identityVerificationRequired) {
        await _startIdentityVerificationGate();
        return;
      }
      _navigateToEntryTarget(SellerEntryTarget.fromUri(Uri.base));
      return;
    }

    final message = result.message;
    if (message == null || message.isEmpty) {
      return;
    }

    AppDialog.showError(context, message);
  }

  Future<void> _startIdentityVerificationGate() async {
    final confirmed = await _showIdentityVerificationRequiredDialog();

    if (!mounted || !confirmed) {
      return;
    }

    final startResult = await ref
        .read(authRepositoryProvider)
        .startIdentityVerification('WEB_IDENTITY_VERIFY');

    if (!mounted) {
      return;
    }

    final authUrl = startResult.authUrl?.trim() ?? '';
    if (!startResult.success || authUrl.isEmpty) {
      await AppDialog.showError(
        context,
        startResult.message.isNotEmpty
            ? startResult.message
            : '본인인증을 시작하지 못했습니다.',
      );
      return;
    }

    final uri = Uri.tryParse(authUrl);
    if (uri == null) {
      await AppDialog.showError(context, '본인인증 주소가 올바르지 않습니다.');
      return;
    }

    html.window.sessionStorage['pendingIdentityVerifyMode'] = '1';
    html.window.location.replace(uri.toString());
  }

  Future<bool> _showIdentityVerificationRequiredDialog() async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEFF8EF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.verified_user_outlined,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    '본인인증이 필요합니다',
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '초기 판매자 계정은 첫 로그인 시에 본인인증이 필요합니다.',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: const Color(0xFF6B7169),
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 48,
                    child: FilledButton(
                      onPressed: () => Navigator.pop(dialogContext, true),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('본인인증'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    return result ?? false;
  }

  void _navigateToEntryTarget(SellerEntryTarget entryTarget) {
    final mainVm = ref.read(mainViewModelProvider.notifier);

    if (entryTarget.mainMenu != null) {
      mainVm.selectMenu(entryTarget.mainMenu!);
    } else {
      mainVm.resetToDashboard();
    }

    context.replace(entryTarget.location);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginViewModelProvider);
    final showBlockingOverlay = _isCheckingSession || state.isWebViewSigningIn;
    final overlayMessage = state.isWebViewSigningIn
        ? '웹뷰 로그인 처리 중입니다.'
        : '로그인 상태를 확인하고 있습니다.';

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF6FAF4), Color(0xFFFFFFFF)],
          ),
        ),
        child: Stack(
          children: [
            if (!_isCheckingSession)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: LoginFormCard(
                    idController: _idController,
                    passwordController: _passwordController,
                    isLoading: state.isSubmitting || state.isWebViewSigningIn,
                    onLoginTap: _submitLogin,
                    onFindIdTap: () => context.push('/find-id'),
                    onFindPasswordTap: () => context.push('/reset-password'),
                  ),
                ),
              ),
            if (showBlockingOverlay)
              Container(
                color: const Color(0x66000000),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(color: AppColors.primary),
                      const SizedBox(height: 16),
                      Text(overlayMessage, style: AppTextStyles.bodyLarge),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
