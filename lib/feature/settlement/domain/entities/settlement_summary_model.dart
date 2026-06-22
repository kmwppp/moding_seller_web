import 'package:freezed_annotation/freezed_annotation.dart';

part 'settlement_summary_model.freezed.dart';
part 'settlement_summary_model.g.dart';

@freezed
abstract class SettlementSummaryModel with _$SettlementSummaryModel {
  const factory SettlementSummaryModel({
    required int pendingAmount,
    required int confirmedAmount,
    required int onHoldAmount,
    required int onHoldCount,
    required DateTime nextSettledAt,
    required int nextSettlementCount,
    required int nextSettlementAmount,
  }) = _SettlementSummaryModel;

  factory SettlementSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$SettlementSummaryModelFromJson(json);
}
