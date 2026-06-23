import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config/app_config.dart';
import '../services/token_storage.dart';
import 'auth_interceptor.dart';

part 'dio_client.g.dart';

@riverpod
Dio dio(Ref ref) {
  final tokenStorage = ref.read(tokenStorageProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  // 인터셉터 추가
  dio.interceptors.addAll([
    LogInterceptor(requestBody: true, responseBody: true), // 디버깅용 로그
    AuthInterceptor(dio, tokenStorage), // 위에서 만든 403 처리 인터셉터
  ]);

  return dio;
}
