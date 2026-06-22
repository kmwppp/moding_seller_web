// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OperationStats _$OperationStatsFromJson(
  Map<String, dynamic> json,
) => _OperationStats(
  thisMonthSales: (json['thisMonthSales'] as num).toInt(),
  confirmedSettlementAmount: (json['confirmedSettlementAmount'] as num).toInt(),
  scheduledSettlementAmount: (json['scheduledSettlementAmount'] as num).toInt(),
  readyToShipCount: (json['readyToShipCount'] as num).toInt(),
  shippingCount: (json['shippingCount'] as num).toInt(),
);

Map<String, dynamic> _$OperationStatsToJson(_OperationStats instance) =>
    <String, dynamic>{
      'thisMonthSales': instance.thisMonthSales,
      'confirmedSettlementAmount': instance.confirmedSettlementAmount,
      'scheduledSettlementAmount': instance.scheduledSettlementAmount,
      'readyToShipCount': instance.readyToShipCount,
      'shippingCount': instance.shippingCount,
    };
