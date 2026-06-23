import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/constants/app_http_urls.dart';
import 'package:moding_seller_web/core/network/dio_client.dart';
import 'package:moding_seller_web/feature/business_profile/domain/entities/seller_profile_update_request.dart';
import 'dart:typed_data';

final businessProfileDataSourceProvider = Provider<BusinessProfileDataSource>((
  ref,
) {
  return BusinessProfileDataSource(ref.watch(dioProvider));
});

class BusinessProfileDataSource {
  BusinessProfileDataSource(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> getMyBusinessProfile(String reauthKey) async {
    final response = await _dio.get(
      AppHttpUrls.getMyBusinessProfileInfo,
      options: Options(
        headers: {'x-reauth-key': reauthKey},
        extra: {'requiresReauth': true},
      ),
    );
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> getMyUserInfo() async {
    final response = await _dio.get(AppHttpUrls.getMyUserInfo);
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> getMySellerProfileInfo(String reauthKey) async {
    final response = await _dio.get(
      AppHttpUrls.getMySellerProfileInfo,
      options: Options(
        headers: {'x-reauth-key': reauthKey},
        extra: {'requiresReauth': true},
      ),
    );
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> getMyRefundAccountInfo(String reauthKey) async {
    final response = await _dio.get(
      AppHttpUrls.getMyRefundAccountInfo,
      options: Options(
        headers: {'x-reauth-key': reauthKey},
        extra: {'requiresReauth': true},
      ),
    );
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> getBankCodeOptions() async {
    final response = await _dio.get(AppHttpUrls.getMetaBankCodes);
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Uint8List> downloadDocumentBytes(String fileUrl) async {
    final response = await _dio.get<List<int>>(
      fileUrl,
      options: Options(responseType: ResponseType.bytes),
    );

    final data = response.data ?? const <int>[];
    return Uint8List.fromList(data);
  }

  Future<Map<String, dynamic>> updateMySellerProfile({
    required String reauthKey,
    required SellerProfileUpdateRequest request,
  }) async {
    final formData = FormData();

    formData.fields.addAll([
      MapEntry('taxType', request.taxType),
      MapEntry('bankCode', request.bankCode),
      MapEntry('bankAccountNumber', request.bankAccountNumber),
      MapEntry('bankAccountHolder', request.bankAccountHolder),
    ]);

    if (request.bankbook != null) {
      formData.files.add(
        MapEntry(
          'bankbook',
          MultipartFile.fromBytes(
            request.bankbook!.bytes,
            filename: request.bankbook!.fileName,
          ),
        ),
      );
    }

    for (final file in request.businessPermits) {
      formData.files.add(
        MapEntry(
          'businessPermit',
          MultipartFile.fromBytes(file.bytes, filename: file.fileName),
        ),
      );
    }

    for (final file in request.mailOrderSalesReports) {
      formData.files.add(
        MapEntry(
          'mailOrderSalesReport',
          MultipartFile.fromBytes(file.bytes, filename: file.fileName),
        ),
      );
    }

    for (final file in request.haccpCertificates) {
      formData.files.add(
        MapEntry(
          'haccpCertificate',
          MultipartFile.fromBytes(file.bytes, filename: file.fileName),
        ),
      );
    }

    for (final file in request.otherFiles) {
      formData.files.add(
        MapEntry(
          'otherFiles',
          MultipartFile.fromBytes(file.bytes, filename: file.fileName),
        ),
      );
    }

    final response = await _dio.put(
      AppHttpUrls.putMySellerProfileInfo,
      data: formData,
      options: Options(
        headers: {'x-reauth-key': reauthKey},
        extra: {'requiresReauth': true},
      ),
    );

    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<void> updateMyHanjinContract(String contractNo) async {
    await _dio.patch(
      AppHttpUrls.patchMyHanjinContract,
      data: {'contractNo': contractNo},
    );
  }

  Future<Map<String, dynamic>> withdrawFromSelling(String reauthKey) async {
    final response = await _dio.delete(
      AppHttpUrls.deleteMySellerProfileInfo,
      options: Options(
        headers: {'x-reauth-key': reauthKey},
        extra: {'requiresReauth': true},
      ),
    );
    return Map<String, dynamic>.from(response.data as Map);
  }
}
