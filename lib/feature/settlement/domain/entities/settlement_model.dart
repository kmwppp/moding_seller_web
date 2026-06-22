import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moding_president_web/feature/settlement/domain/entities/settlement_detail_model.dart';

import '../../presentation/models/settlement_item.dart';

part 'settlement_model.freezed.dart';
part 'settlement_model.g.dart';

@freezed
abstract class SettlementModel with _$SettlementModel {
  const factory SettlementModel({
    required int id,
    required String settlementCode,
    required num finalAmount,

    @JsonKey(unknownEnumValue: SettlementStatusType.hold)
    @Default(SettlementStatusType.hold)
    SettlementStatusType status,

    @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime? settledAt,

    /// UI 전용 필드
    @Default(false) bool isSelected,
    SettlementDetailModel? detail,
  }) = _SettlementModel;

  factory SettlementModel.fromJson(Map<String, dynamic> json) =>
      _$SettlementModelFromJson(json);
}

DateTime? _fromJsonDate(String? value) {
  if (value == null || value.isEmpty) return null;
  return DateTime.parse(value);
}

String? _toJsonDate(DateTime? date) {
  if (date == null) return null;
  return date.toIso8601String();
}
