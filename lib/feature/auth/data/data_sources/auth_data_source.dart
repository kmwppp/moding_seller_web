import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/constants/app_http_urls.dart';
import 'package:moding_seller_web/core/network/dio_client.dart';

final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSource(ref.watch(dioProvider));
});

class AuthDataSource {
  AuthDataSource(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> login({
    required String loginId,
    required String password,
  }) async {
    final response = await _dio.post(
      AppHttpUrls.postLogin,
      data: {'loginId': loginId, 'password': password},
      options: Options(extra: {'skipAuth': true}),
    );

    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> exchangeWebViewToken(String token) async {
    final response = await _dio.post(
      AppHttpUrls.postWebViewTokenExchange,
      data: {'token': token},
      options: Options(extra: {'skipAuth': true}),
    );

    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> startIdentityVerification(String purpose) async {
    try {
      final response = await _dio.post(
        AppHttpUrls.postIdentityVerification,
        data: {'purpose': purpose},
        options: Options(extra: {'skipAuth': true}),
      );
      return Map<String, dynamic>.from(response.data as Map);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      if (responseData is Map<String, dynamic>) {
        return Map<String, dynamic>.from(responseData);
      }
      return {'success': false, 'message': '본인인증을 시작하지 못했습니다.'};
    }
  }

  Future<Map<String, dynamic>> findId(String identityVerificationKey) async {
    try {
      final response = await _dio.post(
        AppHttpUrls.postFindId,
        data: {'identityVerificationKey': identityVerificationKey},
        options: Options(extra: {'skipAuth': true}),
      );
      return Map<String, dynamic>.from(response.data as Map);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      if (responseData is Map<String, dynamic>) {
        return Map<String, dynamic>.from(responseData);
      }
      return {'success': false, 'message': '알 수 없는 오류가 발생했습니다.'};
    }
  }

  Future<Map<String, dynamic>> resetPassword({
    required String loginId,
    required String identityVerificationKey,
    required String newPassword,
  }) async {
    try {
      final response = await _dio.patch(
        AppHttpUrls.patchFindPassword,
        data: {
          'loginId': loginId,
          'identityVerificationKey': identityVerificationKey,
          'newPassword': newPassword,
        },
        options: Options(extra: {'skipAuth': true}),
      );
      return {
        ...(response.data as Map<String, dynamic>),
        'statusCode': response.statusCode,
      };
    } on DioException catch (e) {
      final responseData = e.response?.data;
      if (responseData is Map<String, dynamic>) {
        return {...responseData, 'statusCode': e.response?.statusCode};
      }
      return {
        'success': false,
        'message': '알 수 없는 오류가 발생했습니다.',
        'statusCode': e.response?.statusCode,
      };
    }
  }

  Future<Map<String, dynamic>> verifyIdentityAndResetPassword({
    required String identityVerificationKey,
    required String newPassword,
  }) async {
    try {
      final response = await _dio.post(
        AppHttpUrls.postIdentityVerify,
        data: {
          'identityVerificationKey': identityVerificationKey,
          'newPassword': newPassword,
        },
      );
      return {
        ...(response.data as Map<String, dynamic>),
        'statusCode': response.statusCode,
      };
    } on DioException catch (e) {
      final responseData = e.response?.data;
      if (responseData is Map<String, dynamic>) {
        return {...responseData, 'statusCode': e.response?.statusCode};
      }
      return {
        'success': false,
        'message': '알 수 없는 오류가 발생했습니다.',
        'statusCode': e.response?.statusCode,
      };
    }
  }
}
