import 'package:moding_president_web/feature/business_profile/domain/entities/seller_profile_edit_file.dart';

class SellerProfileUpdateRequest {
  const SellerProfileUpdateRequest({
    required this.taxType,
    required this.bankCode,
    required this.bankAccountNumber,
    required this.bankAccountHolder,
    this.bankbook,
    this.businessPermits = const [],
    this.mailOrderSalesReports = const [],
    this.haccpCertificates = const [],
    this.otherFiles = const [],
  });

  final String taxType;
  final String bankCode;
  final String bankAccountNumber;
  final String bankAccountHolder;
  final SellerProfileEditFile? bankbook;
  final List<SellerProfileEditFile> businessPermits;
  final List<SellerProfileEditFile> mailOrderSalesReports;
  final List<SellerProfileEditFile> haccpCertificates;
  final List<SellerProfileEditFile> otherFiles;
}
