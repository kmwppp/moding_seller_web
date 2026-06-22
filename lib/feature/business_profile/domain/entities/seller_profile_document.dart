class SellerProfileDocument {
  const SellerProfileDocument({
    required this.documentType,
    required this.documentTypeLabel,
    required this.fileUrl,
    required this.createdAt,
  });

  final String documentType;
  final String documentTypeLabel;
  final String fileUrl;
  final DateTime? createdAt;

  factory SellerProfileDocument.fromJson(Map<String, dynamic> json) {
    return SellerProfileDocument(
      documentType: json['documentType']?.toString() ?? '',
      documentTypeLabel: json['documentTypeLabel']?.toString() ?? '',
      fileUrl: json['fileUrl']?.toString() ?? '',
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
