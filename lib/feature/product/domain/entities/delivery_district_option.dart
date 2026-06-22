class DeliveryDistrictOption {
  const DeliveryDistrictOption({
    required this.code,
    required this.province,
    required this.name,
  });

  final String code;
  final String province;
  final String name;

  factory DeliveryDistrictOption.fromJson(Map<String, dynamic> json) {
    return DeliveryDistrictOption(
      code: json['code']?.toString() ?? '',
      province: json['province']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
    );
  }

  String get displayLabel {
    final trimmedProvince = province.trim();
    final trimmedName = name.trim();

    if (trimmedProvince.isEmpty && trimmedName.isEmpty) {
      return '-';
    }

    if (trimmedProvince.isEmpty) {
      return trimmedName;
    }

    if (trimmedName.isEmpty) {
      return trimmedProvince;
    }

    return '$trimmedProvince $trimmedName';
  }
}
