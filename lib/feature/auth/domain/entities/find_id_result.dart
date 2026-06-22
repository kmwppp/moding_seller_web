class FindIdResult {
  const FindIdResult({
    required this.success,
    required this.message,
    this.loginId,
  });

  final bool success;
  final String message;
  final String? loginId;
}
