class IdentityVerificationStartResult {
  const IdentityVerificationStartResult({
    required this.success,
    required this.message,
    this.authUrl,
  });

  final bool success;
  final String message;
  final String? authUrl;
}
