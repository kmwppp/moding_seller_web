import 'package:moding_president_web/core/network/entities/response_model.dart';
import 'package:moding_president_web/feature/claim/domain/entities/claim_detail/claim_detail_model.dart';
import 'package:moding_president_web/feature/claim/domain/entities/claim_list_page_result.dart';
import 'package:moding_president_web/feature/claim/domain/entities/claim_summary_model.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/entities/tracking_validation_result.dart';

import '../../../preparing_delivery/domain/entities/carrier_model.dart';
import '../../presentation/models/approve_type.dart';

abstract class ClaimRepository {
  Future<ClaimListPageResult> getMyClaimList(
    List<String> status, {
    String? fromDate,
    String? toDate,
    int page = 0,
    int size = 20,
  });

  Future<ClaimSummaryModel> getMyClaimSummary();

  Future<ClaimDetailModel> getMyClaimDetail(String claimId);

  Future<ResponseModel> patchClaimReject(String claimId, String rejectReason);

  Future<ResponseModel> patchClaimApprove(String claimId, ApproveType approve);

  Future<ResponseModel> patchClaimReship(
    String claimId,
    String? deliveryMethod,
    String? courierCode,
    String? trackingNumber,
  );

  Future<ResponseModel> patchClaimReshipHanjin(
    String claimId,
    String svcCatCd,
    String boxType,
    String payType,
  );

  Future<TrackingValidationResult> postClaimTrackingValidation(
    String claimId,
    String courierCode,
    String trackingNumber,
  );

  Future<List<CarrierModel>> getCarrierList();

  Future<ResponseModel> patchClaimReshipComplete(String claimId);
}
