import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/network/entities/response_model.dart';
import 'package:moding_seller_web/core/services/token_storage.dart';
import 'package:moding_seller_web/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:moding_seller_web/feature/auth/domain/entities/auth_session.dart';
import 'package:moding_seller_web/feature/auth/domain/repositories/auth_repository.dart';
import 'package:moding_seller_web/feature/auth/presentation/providers/login_state.dart';

final loginViewModelProvider = NotifierProvider<LoginViewModel, LoginState>(
  LoginViewModel.new,
);

class LoginViewModel extends Notifier<LoginState> {
  late final AuthRepository _authRepository;
  late final TokenStorage _tokenStorage;

  @override
  LoginState build() {
    _authRepository = ref.read(authRepositoryProvider);
    _tokenStorage = ref.read(tokenStorageProvider);
    return LoginState.initial();
  }

  Future<LoginResult> login({
    required String loginId,
    required String password,
  }) async {
    if (loginId.trim().isEmpty || password.trim().isEmpty) {
      return const LoginResult.failure('아이디와 비밀번호를 입력해주세요.');
    }

    state = state.copyWith(isSubmitting: true);

    try {
      final session = await _authRepository.login(
        loginId: loginId.trim(),
        password: password,
      );

      return await _completeLogin(session);
    } on DioException catch (e) {
      return LoginResult.failure(_resolveErrorMessage(e, '로그인에 실패했습니다.'));
    } catch (_) {
      return const LoginResult.failure('로그인에 실패했습니다. 다시 시도해주세요.');
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }

  Future<LoginResult> loginWithWebViewToken(String token) async {
    if (state.isWebViewSigningIn) {
      return const LoginResult.failure('');
    }

    if (token.trim().isEmpty) {
      return const LoginResult.failure('유효하지 않은 웹뷰 토큰입니다.');
    }

    state = state.copyWith(isWebViewSigningIn: true);

    try {
      final session = await _authRepository.exchangeWebViewToken(token.trim());
      return await _completeLogin(session);
    } on DioException catch (e) {
      return LoginResult.failure(_resolveErrorMessage(e, '웹뷰 로그인에 실패했습니다.'));
    } catch (_) {
      return const LoginResult.failure('웹뷰 로그인에 실패했습니다.');
    } finally {
      state = state.copyWith(isWebViewSigningIn: false);
    }
  }

  Future<LoginResult> _completeLogin(AuthSession session) async {
    if (!session.isSeller) {
      await _tokenStorage.deleteAll();
      return const LoginResult.failure('판매자가 아닙니다.');
    }

    if (session.accessToken.isEmpty || session.refreshToken.isEmpty) {
      return const LoginResult.failure('토큰 정보가 올바르지 않습니다.');
    }

    await _tokenStorage.saveTokens(
      accessToken: session.accessToken,
      refreshToken: session.refreshToken,
      role: session.role,
    );

    return LoginResult.success(
      identityVerificationRequired: session.identityVerificationRequired,
    );
  }

  String _resolveErrorMessage(DioException exception, String fallback) {
    final data = exception.response?.data;
    if (data is Map<String, dynamic>) {
      try {
        final response = ResponseModel.fromJson(data);
        if (response.message.isNotEmpty) {
          return response.message;
        }
      } catch (_) {}
    }

    if (exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.receiveTimeout ||
        exception.type == DioExceptionType.sendTimeout) {
      return '서버 응답이 지연되고 있습니다. 잠시 후 다시 시도해주세요.';
    }

    if (exception.type == DioExceptionType.connectionError) {
      return '서버에 연결하지 못했습니다. 네트워크 또는 CORS 설정을 확인해주세요.';
    }

    return fallback;
  }
}

class LoginResult {
  const LoginResult._({
    required this.isSuccess,
    required this.identityVerificationRequired,
    this.message,
  });

  const LoginResult.success({bool identityVerificationRequired = false})
    : this._(
        isSuccess: true,
        identityVerificationRequired: identityVerificationRequired,
      );

  const LoginResult.failure(String message)
    : this._(
        isSuccess: false,
        identityVerificationRequired: false,
        message: message,
      );

  final bool isSuccess;
  final bool identityVerificationRequired;
  final String? message;
}
