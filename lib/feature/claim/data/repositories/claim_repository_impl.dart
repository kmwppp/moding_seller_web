import 'package:moding_president_web/core/network/entities/response_model.dart';
import 'package:moding_president_web/feature/claim/data/data_source/claim_data_source.dart';
import 'package:moding_president_web/feature/claim/domain/entities/claim_detail/claim_detail_model.dart';
import 'package:moding_president_web/feature/claim/domain/entities/claim_list_page_result.dart';
import 'package:moding_president_web/feature/claim/domain/entities/claim_model.dart';
import 'package:moding_president_web/feature/claim/domain/entities/claim_summary_model.dart';
import 'package:moding_president_web/feature/claim/domain/repositories/claim_repository.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/entities/tracking_validation_result.dart';
import 'package:moding_president_web/feature/claim/presentation/models/approve_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../preparing_delivery/domain/entities/carrier_model.dart';

part 'claim_repository_impl.g.dart';

@riverpod
ClaimRepository claimRepository(Ref ref) {
  final dataSource = ref.watch(claimDataSourceProvider);
  return ClaimRepositoryImpl(dataSource);
}

class ClaimRepositoryImpl implements ClaimRepository {
  final ClaimDataSource _dataSource;

  ClaimRepositoryImpl(this._dataSource);

  /// ----------------------------------------
  /// 내 수신 클레임 목록 조회
  /// ----------------------------------------
  @override
  Future<ClaimListPageResult> getMyClaimList(
    List<String> status, {
    String? fromDate,
    String? toDate,
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dataSource.getClaimList(
      status,
      fromDate: fromDate,
      toDate: toDate,
      page: page,
      size: size,
    );
    final data = Map<String, dynamic>.from(response['data'] as Map);
    final content = (data['content'] as List?) ?? const [];
    final claimList = content.map((item) {
      return ClaimModel.fromJson(item);
    }).toList();

    return ClaimListPageResult(
      items: claimList,
      page: (data['number'] as num?)?.toInt() ?? page,
      size: (data['size'] as num?)?.toInt() ?? size,
      totalPages: (data['totalPages'] as num?)?.toInt() ?? 0,
      totalElements:
          (data['totalElements'] as num?)?.toInt() ?? claimList.length,
    );
  }

  @override
  Future<ClaimDetailModel> getMyClaimDetail(String claimId) async {
    final response = await _dataSource.getClaimDetail(claimId);
    final data = ClaimDetailModel.fromJson(response['data']);
    return data;
  }

  @override
  Future<ClaimSummaryModel> getMyClaimSummary() async {
    final response = await _dataSource.getClaimSummary();
    final data = ClaimSummaryModel.fromJson(response['data']);
    return data;
  }

  @override
  Future<ResponseModel> patchClaimReject(
    String claimId,
    String rejectReason,
  ) async {
    final response = await _dataSource.patchClaimReject(claimId, rejectReason);
    return ResponseModel.fromJson(response);
  }

  @override
  Future<ResponseModel> patchClaimApprove(
    String claimId,
    ApproveType approve,
  ) async {
    final response = await _dataSource.patchClaimApprove(claimId, approve);
    return ResponseModel.fromJson(response);
  }

  @override
  Future<ResponseModel> patchClaimReship(
    String claimId,
    String? deliveryMethod,
    String? courierCode,
    String? trackingNumber,
  ) async {
    final response = await _dataSource.patchClaimReship(
      claimId,
      deliveryMethod,
      courierCode,
      trackingNumber,
    );
    return ResponseModel.fromJson(response);
  }

  @override
  Future<ResponseModel> patchClaimReshipHanjin(
    String claimId,
    String svcCatCd,
    String boxType,
    String payType,
  ) async {
    final response = await _dataSource.patchClaimReshipHanjin(
      claimId,
      svcCatCd,
      boxType,
      payType,
    );
    return ResponseModel.fromJson(response);
  }

  @override
  Future<TrackingValidationResult> postClaimTrackingValidation(
    String claimId,
    String courierCode,
    String trackingNumber,
  ) async {
    final response = await _dataSource.postClaimTrackingValidation(
      claimId,
      courierCode,
      trackingNumber,
    );
    return TrackingValidationResult.fromJson(response);
  }

  @override
  Future<ResponseModel> patchClaimReshipComplete(String claimId) async {
    final response = await _dataSource.patchClaimReshipComplete(claimId);
    return ResponseModel.fromJson(response);
  }

  @override
  Future<List<CarrierModel>> getCarrierList() async {
    final response = await _dataSource.getCarriers();
    final data = response['data'] as List;

    return data
        .map((e) => CarrierModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
