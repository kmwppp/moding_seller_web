import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/feature/business_profile/data/data_sources/business_profile_data_source.dart';
import 'package:moding_president_web/feature/business_profile/domain/entities/bank_code_option.dart';
import 'package:moding_president_web/feature/business_profile/domain/entities/business_profile.dart';
import 'package:moding_president_web/feature/business_profile/domain/entities/my_account_info.dart';
import 'package:moding_president_web/feature/business_profile/domain/entities/refund_account_info.dart';
import 'package:moding_president_web/feature/business_profile/domain/entities/seller_profile_document.dart';
import 'package:moding_president_web/feature/business_profile/domain/entities/seller_profile_edit_file.dart';
import 'package:moding_president_web/feature/business_profile/domain/entities/seller_profile_info.dart';
import 'package:moding_president_web/feature/business_profile/domain/entities/seller_profile_update_request.dart';

final businessProfileRepositoryProvider = Provider<BusinessProfileRepository>((
  ref,
) {
  return BusinessProfileRepository(
    ref.watch(businessProfileDataSourceProvider),
  );
});

class BusinessProfileRepository {
  BusinessProfileRepository(this._dataSource);

  final BusinessProfileDataSource _dataSource;

  Future<BusinessProfile> getMyBusinessProfile(String reauthKey) async {
    final response = await _dataSource.getMyBusinessProfile(reauthKey);
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );
    return BusinessProfile.fromJson(data);
  }

  Future<MyAccountInfo> getMyUserInfo() async {
    final response = await _dataSource.getMyUserInfo();
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );
    return MyAccountInfo.fromJson(data);
  }

  Future<SellerProfileInfo> getMySellerProfileInfo(String reauthKey) async {
    final response = await _dataSource.getMySellerProfileInfo(reauthKey);
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );
    return SellerProfileInfo.fromJson(data);
  }

  Future<RefundAccountInfo> getMyRefundAccountInfo(String reauthKey) async {
    final response = await _dataSource.getMyRefundAccountInfo(reauthKey);
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );
    return RefundAccountInfo.fromJson(data);
  }

  Future<List<BankCodeOption>> getBankCodeOptions() async {
    final response = await _dataSource.getBankCodeOptions();
    final data = (response['data'] as List? ?? const [])
        .whereType<Map>()
        .map((item) => BankCodeOption.fromJson(Map<String, dynamic>.from(item)))
        .toList();
    return data;
  }

  Future<void> updateMySellerProfile({
    required String reauthKey,
    required SellerProfileUpdateRequest request,
  }) async {
    await _dataSource.updateMySellerProfile(
      reauthKey: reauthKey,
      request: request,
    );
  }

  Future<void> updateMyHanjinContract(String contractNo) {
    return _dataSource.updateMyHanjinContract(contractNo);
  }

  Future<SellerProfileEditFile?> downloadDocumentFile(
    SellerProfileDocument document, {
    int index = 0,
  }) async {
    final trimmedUrl = document.fileUrl.trim();
    if (trimmedUrl.isEmpty) {
      return null;
    }

    final bytes = await _dataSource.downloadDocumentBytes(trimmedUrl);
    final uri = Uri.tryParse(trimmedUrl);
    final fileNameFromUrl = uri?.pathSegments.isNotEmpty == true
        ? uri!.pathSegments.last
        : '';
    final fallback = '${document.documentType.toLowerCase()}_${index + 1}';

    return SellerProfileEditFile(
      fileName: fileNameFromUrl.isNotEmpty ? fileNameFromUrl : fallback,
      bytes: bytes,
    );
  }
}
