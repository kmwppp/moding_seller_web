// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settlement_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettlementDetailModel _$SettlementDetailModelFromJson(
  Map<String, dynamic> json,
) => _SettlementDetailModel(
  isDetailLoading: json['isDetailLoading'] as bool? ?? true,
  id: (json['id'] as num).toInt(),
  settlementCode: json['settlementCode'] as String,
  orderId: (json['orderId'] as num).toInt(),
  claimId: (json['claimId'] as num?)?.toInt(),
  productAmount: (json['productAmount'] as num?)?.toInt(),
  discountAmount: (json['discountAmount'] as num?)?.toInt(),
  deliveryFee: (json['deliveryFee'] as num?)?.toInt(),
  totalPaidAmount: (json['totalPaidAmount'] as num?)?.toInt(),
  claimDeductAmount: (json['claimDeductAmount'] as num?)?.toInt(),
  totalAdjustmentAmount: (json['totalAdjustmentAmount'] as num?)?.toInt(),
  actualBaseAmount: (json['actualBaseAmount'] as num?)?.toInt(),
  commissionRatePercent: (json['commissionRatePercent'] as num?)?.toDouble(),
  commissionAmount: (json['commissionAmount'] as num?)?.toInt(),
  finalAmount: (json['finalAmount'] as num?)?.toInt(),
  status: $enumDecode(_$SettlementStatusTypeEnumMap, json['status']),
  settledAt: _fromJsonDate(json['settledAt'] as String?),
  payoutStatus: $enumDecodeNullable(
    _$PayoutStatusTypeEnumMap,
    json['payoutStatus'],
  ),
  paidOutAt: _fromJsonDate(json['paidOutAt'] as String?),
);

Map<String, dynamic> _$SettlementDetailModelToJson(
  _SettlementDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'settlementCode': instance.settlementCode,
  'orderId': instance.orderId,
  'claimId': instance.claimId,
  'productAmount': instance.productAmount,
  'discountAmount': instance.discountAmount,
  'deliveryFee': instance.deliveryFee,
  'totalPaidAmount': instance.totalPaidAmount,
  'claimDeductAmount': instance.claimDeductAmount,
  'totalAdjustmentAmount': instance.totalAdjustmentAmount,
  'actualBaseAmount': instance.actualBaseAmount,
  'commissionRatePercent': instance.commissionRatePercent,
  'commissionAmount': instance.commissionAmount,
  'finalAmount': instance.finalAmount,
  'status': _$SettlementStatusTypeEnumMap[instance.status]!,
  'settledAt': _toJsonDate(instance.settledAt),
  'payoutStatus': _$PayoutStatusTypeEnumMap[instance.payoutStatus],
  'paidOutAt': _toJsonDate(instance.paidOutAt),
};

const _$SettlementStatusTypeEnumMap = {
  SettlementStatusType.pending: 'PENDING',
  SettlementStatusType.hold: 'ON_HOLD',
  SettlementStatusType.confirmed: 'CONFIRMED',
  SettlementStatusType.cancelled: 'CANCELLED',
};

const _$PayoutStatusTypeEnumMap = {
  PayoutStatusType.requested: 'REQUESTED',
  PayoutStatusType.inProgress: 'IN_PROGRESS',
  PayoutStatusType.completed: 'COMPLETED',
  PayoutStatusType.failed: 'FAILED',
  PayoutStatusType.canceled: 'CANCELED',
};
