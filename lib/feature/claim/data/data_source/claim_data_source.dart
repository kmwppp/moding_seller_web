import 'package:dio/dio.dart';
import 'package:moding_president_web/core/constants/app_http_urls.dart';
import 'package:moding_president_web/core/network/dio_client.dart';
import 'package:moding_president_web/feature/claim/presentation/models/approve_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'claim_data_source.g.dart';

@riverpod
ClaimDataSource claimDataSource(Ref ref) {
  return ClaimDataSource(ref.watch(dioProvider));
}

class ClaimDataSource {
  final Dio _dio;

  ClaimDataSource(this._dio);

  Future<Map<String, dynamic>> getClaimList(
    List<String> status, {
    String? fromDate,
    String? toDate,
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dio.get(
      AppHttpUrls.getMyClaimList(
        status,
        fromDate: fromDate,
        toDate: toDate,
        page: page,
        size: size,
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getClaimSummary() async {
    final response = await _dio.get(AppHttpUrls.getMyClaimSummary);
    return response.data;
  }

  Future<Map<String, dynamic>> getClaimDetail(String claimId) async {
    final response = await _dio.get(AppHttpUrls.getMyClaimDetail(claimId));
    return response.data;
  }

  Future<Map<String, dynamic>> patchClaimReject(
    String claimId,
    String rejectReason,
  ) async {
    final response = await _dio.patch(
      AppHttpUrls.patchClaimReject(claimId),
      data: {"rejectReason": rejectReason},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> patchClaimApprove(
    String claimId,
    ApproveType approve,
  ) async {
    final response = await _dio.patch(
      AppHttpUrls.patchClaimApprove(claimId),
      data: {"resolution": approve.toServer},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> patchClaimReship(
    String claimId,
    String? deliveryMethod,
    String? courierCode,
    String? trackingNumber,
  ) async {
    final response = await _dio.patch(
      AppHttpUrls.patchClaimReship(claimId),
      data: {
        "deliveryMethod": deliveryMethod,
        "courierCode": courierCode,
        "trackingNumber": trackingNumber,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> patchClaimReshipHanjin(
    String claimId,
    String svcCatCd,
    String boxType,
    String payType,
  ) async {
    final response = await _dio.patch(
      AppHttpUrls.patchClaimReshipHanjin(claimId),
      data: {
        "svcCatCd": svcCatCd,
        "boxType": boxType,
        "payType": payType,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postClaimTrackingValidation(
    String claimId,
    String courierCode,
    String trackingNumber,
  ) async {
    final response = await _dio.post(
      AppHttpUrls.postClaimTrackingValidation(claimId),
      data: {
        "courierCode": courierCode,
        "trackingNumber": trackingNumber,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> patchClaimReshipComplete(String claimId) async {
    final response = await _dio.patch(
      AppHttpUrls.patchClaimReshipComplete(claimId),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getCarriers() async {
    final response = await _dio.get(AppHttpUrls.getCarriers());
    return response.data;
  }
}
