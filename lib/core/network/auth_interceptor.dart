import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

import '../routing/app_navigator_key.dart';
import '../services/token_storage.dart';
import '../services/web_bridge.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final TokenStorage _tokenStorage;

  AuthInterceptor(this._dio, this._tokenStorage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra['skipAuth'] == true) {
      return handler.next(options);
    }

    final accessToken = await _tokenStorage.getAccessToken();
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // 토큰 재발행 로직이 필요 없을 때
    if (err.requestOptions.extra["skipAuth"] == true) {
      return handler.next(err);
    }
    // 401 Forbidden 에러 감지
    // 1. 401 에러(인증 만료)인지 확인
    if (err.response?.statusCode == 401) {
      // 무한 루프 방지: 재발급 요청 자체가 401이 나면 중단
      if (err.requestOptions.path.contains('/api/v1/auth/refresh')) {
        return handler.next(err);
      }

      try {
        final storedRefreshToken = await _tokenStorage.getRefreshToken();
        if (storedRefreshToken == null || storedRefreshToken.isEmpty) {
          await _logoutAndMoveToLogin();
          return handler.next(err);
        }

        final refreshResponse = await _dio.post(
          '/api/v1/auth/refresh',
          options: Options(
            headers: {'Refresh-Token': storedRefreshToken},
            extra: {'skipAuth': true},
          ),
        );

        if (refreshResponse.statusCode == 200) {
          final responseData = Map<String, dynamic>.from(
            refreshResponse.data as Map,
          );
          final data = Map<String, dynamic>.from(
            (responseData['data'] as Map?) ?? <String, dynamic>{},
          );
          final newAccessToken = data['accessToken']?.toString() ?? '';
          final newRefreshToken =
              data['refreshToken']?.toString() ?? storedRefreshToken;
          final role = data['role']?.toString() ?? '';

          if (newAccessToken.isEmpty) {
            await _logoutAndMoveToLogin();
            return handler.next(err);
          }

          await _tokenStorage.saveTokens(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken,
            role: role,
          );

          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newAccessToken';

          final retryResponse = await _dio.fetch(options);

          return handler.resolve(retryResponse);
        }
        await _logoutAndMoveToLogin();
      } catch (_) {
        await _logoutAndMoveToLogin();
        return handler.next(err);
      }
    }

    if (err.response?.statusCode == 403 &&
        err.requestOptions.extra['requiresReauth'] == true) {
      await _tokenStorage.deleteReauthKey();
      return handler.next(err);
    }

    return handler.next(err);
  }

  Future<void> _logoutAndMoveToLogin() async {
    await _tokenStorage.deleteAll();

    if (isAppWebView) {
      sendGoMain();
      return;
    }

    final context = appNavigatorKey.currentContext;
    if (context == null || !context.mounted) {
      return;
    }

    context.go('/login?forceLogin=1');
  }
}
