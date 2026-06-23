import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/feature/auth/data/data_sources/auth_data_source.dart';
import 'package:moding_seller_web/feature/auth/domain/entities/auth_session.dart';
import 'package:moding_seller_web/feature/auth/domain/entities/find_id_result.dart';
import 'package:moding_seller_web/feature/auth/domain/entities/identity_verification_start_result.dart';
import 'package:moding_seller_web/feature/auth/domain/entities/reset_password_result.dart';
import 'package:moding_seller_web/feature/auth/domain/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(authDataSourceProvider));
});

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._dataSource);

  final AuthDataSource _dataSource;

  @override
  Future<AuthSession> login({
    required String loginId,
    required String password,
  }) async {
    final response = await _dataSource.login(
      loginId: loginId,
      password: password,
    );

    return _mapSession(response);
  }

  @override
  Future<AuthSession> exchangeWebViewToken(String token) async {
    final response = await _dataSource.exchangeWebViewToken(token);
    return _mapSession(response);
  }

  @override
  Future<IdentityVerificationStartResult> startIdentityVerification(
    String purpose,
  ) async {
    final response = await _dataSource.startIdentityVerification(purpose);
    final data = response['data'];
    final dataMap = data is Map<String, dynamic> ? data : null;

    return IdentityVerificationStartResult(
      success: (response['success'] as bool?) ?? false,
      message: response['message']?.toString() ?? '',
      authUrl: dataMap?['authUrl']?.toString(),
    );
  }

  @override
  Future<FindIdResult> findId(String identityVerificationKey) async {
    final response = await _dataSource.findId(identityVerificationKey);
    final data = response['data'];
    final dataMap = data is Map<String, dynamic> ? data : null;

    return FindIdResult(
      success: (response['success'] as bool?) ?? false,
      message: response['message']?.toString() ?? '',
      loginId: dataMap?['loginId']?.toString(),
    );
  }

  @override
  Future<ResetPasswordResult> resetPassword({
    required String loginId,
    required String identityVerificationKey,
    required String newPassword,
  }) async {
    final response = await _dataSource.resetPassword(
      loginId: loginId,
      identityVerificationKey: identityVerificationKey,
      newPassword: newPassword,
    );

    return ResetPasswordResult(
      success: (response['success'] as bool?) ?? false,
      message: response['message']?.toString() ?? '',
      code: response['code']?.toString(),
      statusCode: (response['statusCode'] as num?)?.toInt(),
    );
  }

  @override
  Future<AuthSession> verifyIdentityAndResetPassword({
    required String identityVerificationKey,
    required String newPassword,
  }) async {
    final response = await _dataSource.verifyIdentityAndResetPassword(
      identityVerificationKey: identityVerificationKey,
      newPassword: newPassword,
    );

    final code = response['code']?.toString();
    final message = response['message']?.toString() ?? '비밀번호 재설정에 실패했습니다.';

    if ((response['success'] as bool?) != true) {
      throw AuthRepositoryException(message, code: code);
    }

    final session = _mapSession(response);
    final isValidCompletedSession =
        session.isSeller &&
        session.accessToken.isNotEmpty &&
        session.refreshToken.isNotEmpty &&
        !session.identityVerificationRequired;

    if (!isValidCompletedSession) {
      throw AuthRepositoryException(
        message.isNotEmpty ? message : '비밀번호 재설정에 실패했습니다.',
        code: code,
      );
    }

    return session;
  }

  AuthSession _mapSession(Map<String, dynamic> response) {
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );

    return AuthSession(
      accessToken: data['accessToken']?.toString() ?? '',
      refreshToken: data['refreshToken']?.toString() ?? '',
      role: data['role']?.toString() ?? '',
      identityVerificationRequired:
          (data['identityVerificationRequired'] as bool?) ?? false,
    );
  }
}

class AuthRepositoryException implements Exception {
  const AuthRepositoryException(this.message, {this.code});

  final String message;
  final String? code;
}
