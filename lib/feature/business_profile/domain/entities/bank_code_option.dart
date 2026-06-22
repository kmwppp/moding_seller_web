class BankCodeOption {
  const BankCodeOption({required this.value, required this.label, this.path});

  final String value;
  final String label;
  final String? path;

  factory BankCodeOption.fromJson(Map<String, dynamic> json) {
    return BankCodeOption(
      value: json['value']?.toString() ?? '',
      label: json['label']?.toString() ?? '',
      path: json['path']?.toString(),
    );
  }
}
