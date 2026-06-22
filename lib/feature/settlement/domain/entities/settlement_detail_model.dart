import 'package:freezed_annotation/freezed_annotation.dart';

import '../../presentation/models/settlement_item.dart';

part 'settlement_detail_model.freezed.dart';
part 'settlement_detail_model.g.dart';

@freezed
abstract class SettlementDetailModel with _$SettlementDetailModel {
  const factory SettlementDetailModel({
    @JsonKey(includeToJson: false) @Default(true) bool isDetailLoading,
    required int id,
    required String settlementCode,
    required int orderId,
    int? claimId,

    int? productAmount,
    int? discountAmount,
    int? deliveryFee,
    int? totalPaidAmount,

    int? claimDeductAmount,
    int? totalAdjustmentAmount,
    int? actualBaseAmount,

    double? commissionRatePercent,
    int? commissionAmount,

    int? finalAmount,
    required SettlementStatusType status,

    @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime? settledAt,

    PayoutStatusType? payoutStatus,

    @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime? paidOutAt,
  }) = _SettlementDetailModel;

  factory SettlementDetailModel.fromJson(Map<String, dynamic> json) =>
      _$SettlementDetailModelFromJson(json);
}

DateTime? _fromJsonDate(String? value) {
  if (value == null || value.isEmpty) return null;
  return DateTime.parse(value);
}

String? _toJsonDate(DateTime? date) {
  if (date == null) return null;
  return date.toIso8601String();
}
