class AuthSession {
  const AuthSession({
    required this.accessToken,
    required this.refreshToken,
    required this.role,
    required this.identityVerificationRequired,
  });

  final String accessToken;
  final String refreshToken;
  final String role;
  final bool identityVerificationRequired;

  bool get isSeller => role.toUpperCase() == 'SELLER';
}
