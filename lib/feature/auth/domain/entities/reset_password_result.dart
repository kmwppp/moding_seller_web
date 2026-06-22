class ResetPasswordResult {
  const ResetPasswordResult({
    required this.success,
    required this.message,
    this.code,
    this.statusCode,
  });

  final bool success;
  final String message;
  final String? code;
  final int? statusCode;
}
