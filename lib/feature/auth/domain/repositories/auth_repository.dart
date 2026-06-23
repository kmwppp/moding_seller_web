import 'package:moding_seller_web/feature/auth/domain/entities/auth_session.dart';
import 'package:moding_seller_web/feature/auth/domain/entities/find_id_result.dart';
import 'package:moding_seller_web/feature/auth/domain/entities/identity_verification_start_result.dart';
import 'package:moding_seller_web/feature/auth/domain/entities/reset_password_result.dart';

abstract class AuthRepository {
  Future<AuthSession> login({
    required String loginId,
    required String password,
  });

  Future<AuthSession> exchangeWebViewToken(String token);

  Future<IdentityVerificationStartResult> startIdentityVerification(
    String purpose,
  );

  Future<FindIdResult> findId(String identityVerificationKey);

  Future<ResetPasswordResult> resetPassword({
    required String loginId,
    required String identityVerificationKey,
    required String newPassword,
  });

  Future<AuthSession> verifyIdentityAndResetPassword({
    required String identityVerificationKey,
    required String newPassword,
  });
}
