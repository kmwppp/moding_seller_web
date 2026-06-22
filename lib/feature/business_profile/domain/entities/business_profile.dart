class BusinessProfile {
  const BusinessProfile({
    required this.id,
    required this.businessName,
    required this.ownerName,
    required this.zipCode,
    required this.address,
    required this.addressDetail,
    required this.businessNumber,
    required this.businessPhone,
    required this.industry,
    required this.industryClass,
    required this.parentCategoryName,
    required this.businessCategoryName,
    required this.latestChangeRequestStatus,
    required this.createdAt,
  });

  final int id;
  final String? businessName;
  final String? ownerName;
  final String? zipCode;
  final String? address;
  final String? addressDetail;
  final String? businessNumber;
  final String? businessPhone;
  final String? industry;
  final String? industryClass;
  final String? parentCategoryName;
  final String? businessCategoryName;
  final String? latestChangeRequestStatus;
  final DateTime? createdAt;

  factory BusinessProfile.fromJson(Map<String, dynamic> json) {
    return BusinessProfile(
      id: (json['id'] as num?)?.toInt() ?? 0,
      businessName: json['businessName']?.toString(),
      ownerName: json['ownerName']?.toString(),
      zipCode: json['zipCode']?.toString(),
      address: json['address']?.toString(),
      addressDetail: json['addressDetail']?.toString(),
      businessNumber: json['businessNumber']?.toString(),
      businessPhone: json['businessPhone']?.toString(),
      industry: json['industry']?.toString(),
      industryClass: json['industryClass']?.toString(),
      parentCategoryName: json['parentCategoryName']?.toString(),
      businessCategoryName: json['businessCategoryName']?.toString(),
      latestChangeRequestStatus: json['latestChangeRequestStatus']?.toString(),
      createdAt: _parseDate(json['createdAt']),
    );
  }

  static DateTime? _parseDate(dynamic value) {
    if (value is! String || value.trim().isEmpty) {
      return null;
    }

    return DateTime.tryParse(value)?.toLocal();
  }
}
