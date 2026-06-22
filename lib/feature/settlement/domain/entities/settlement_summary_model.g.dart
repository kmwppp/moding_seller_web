// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settlement_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettlementSummaryModel _$SettlementSummaryModelFromJson(
  Map<String, dynamic> json,
) => _SettlementSummaryModel(
  pendingAmount: (json['pendingAmount'] as num).toInt(),
  confirmedAmount: (json['confirmedAmount'] as num).toInt(),
  onHoldAmount: (json['onHoldAmount'] as num).toInt(),
  onHoldCount: (json['onHoldCount'] as num).toInt(),
  nextSettledAt: DateTime.parse(json['nextSettledAt'] as String),
  nextSettlementCount: (json['nextSettlementCount'] as num).toInt(),
  nextSettlementAmount: (json['nextSettlementAmount'] as num).toInt(),
);

Map<String, dynamic> _$SettlementSummaryModelToJson(
  _SettlementSummaryModel instance,
) => <String, dynamic>{
  'pendingAmount': instance.pendingAmount,
  'confirmedAmount': instance.confirmedAmount,
  'onHoldAmount': instance.onHoldAmount,
  'onHoldCount': instance.onHoldCount,
  'nextSettledAt': instance.nextSettledAt.toIso8601String(),
  'nextSettlementCount': instance.nextSettlementCount,
  'nextSettlementAmount': instance.nextSettlementAmount,
};
