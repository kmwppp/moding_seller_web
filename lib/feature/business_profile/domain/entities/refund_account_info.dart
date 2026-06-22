class RefundAccountInfo {
  const RefundAccountInfo({
    required this.bankCode,
    required this.bankName,
    required this.accountNumber,
    required this.accountHolder,
  });

  final String? bankCode;
  final String? bankName;
  final String? accountNumber;
  final String? accountHolder;

  factory RefundAccountInfo.fromJson(Map<String, dynamic> json) {
    return RefundAccountInfo(
      bankCode: json['bankCode']?.toString(),
      bankName: json['bankName']?.toString(),
      accountNumber: json['accountNumber']?.toString(),
      accountHolder: json['accountHolder']?.toString(),
    );
  }
}
