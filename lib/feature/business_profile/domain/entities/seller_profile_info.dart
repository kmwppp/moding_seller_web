import 'package:moding_president_web/feature/business_profile/domain/entities/seller_profile_document.dart';

class SellerProfileInfo {
  const SellerProfileInfo({
    required this.id,
    required this.taxType,
    required this.bankCode,
    required this.bankName,
    required this.bankAccountNumber,
    required this.bankAccountHolder,
    required this.approvalStatus,
    required this.approvedAt,
    required this.productLimit,
    required this.hanjinContractNo,
    required this.createdAt,
    required this.documents,
  });

  final int id;
  final String? taxType;
  final String? bankCode;
  final String? bankName;
  final String? bankAccountNumber;
  final String? bankAccountHolder;
  final String? approvalStatus;
  final DateTime? approvedAt;
  final int? productLimit;
  final String? hanjinContractNo;
  final DateTime? createdAt;
  final List<SellerProfileDocument> documents;

  factory SellerProfileInfo.fromJson(Map<String, dynamic> json) {
    return SellerProfileInfo(
      id: (json['id'] as num?)?.toInt() ?? 0,
      taxType: json['taxType']?.toString(),
      bankCode: json['bankCode']?.toString(),
      bankName: json['bankName']?.toString(),
      bankAccountNumber: json['bankAccountNumber']?.toString(),
      bankAccountHolder: json['bankAccountHolder']?.toString(),
      approvalStatus: json['approvalStatus']?.toString(),
      approvedAt: _parseDate(json['approvedAt']),
      productLimit: (json['productLimit'] as num?)?.toInt(),
      hanjinContractNo: json['hanjinContractNo']?.toString(),
      createdAt: _parseDate(json['createdAt']),
      documents: ((json['documents'] as List?) ?? const [])
          .whereType<Map>()
          .map(
            (item) => SellerProfileDocument.fromJson(
              Map<String, dynamic>.from(item),
            ),
          )
          .toList(),
    );
  }

  SellerProfileInfo copyWith({
    String? hanjinContractNo,
    List<SellerProfileDocument>? documents,
  }) {
    return SellerProfileInfo(
      id: id,
      taxType: taxType,
      bankCode: bankCode,
      bankName: bankName,
      bankAccountNumber: bankAccountNumber,
      bankAccountHolder: bankAccountHolder,
      approvalStatus: approvalStatus,
      approvedAt: approvedAt,
      productLimit: productLimit,
      hanjinContractNo: hanjinContractNo ?? this.hanjinContractNo,
      createdAt: createdAt,
      documents: documents ?? this.documents,
    );
  }

  static DateTime? _parseDate(dynamic value) {
    if (value is! String || value.trim().isEmpty) {
      return null;
    }

    return DateTime.tryParse(value)?.toLocal();
  }
}
