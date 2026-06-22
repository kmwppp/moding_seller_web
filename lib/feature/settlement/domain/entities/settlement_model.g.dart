// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settlement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettlementModel _$SettlementModelFromJson(Map<String, dynamic> json) =>
    _SettlementModel(
      id: (json['id'] as num).toInt(),
      settlementCode: json['settlementCode'] as String,
      finalAmount: json['finalAmount'] as num,
      status:
          $enumDecodeNullable(
            _$SettlementStatusTypeEnumMap,
            json['status'],
            unknownValue: SettlementStatusType.hold,
          ) ??
          SettlementStatusType.hold,
      settledAt: _fromJsonDate(json['settledAt'] as String?),
      isSelected: json['isSelected'] as bool? ?? false,
      detail: json['detail'] == null
          ? null
          : SettlementDetailModel.fromJson(
              json['detail'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SettlementModelToJson(_SettlementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'settlementCode': instance.settlementCode,
      'finalAmount': instance.finalAmount,
      'status': _$SettlementStatusTypeEnumMap[instance.status]!,
      'settledAt': _toJsonDate(instance.settledAt),
      'isSelected': instance.isSelected,
      'detail': instance.detail,
    };

const _$SettlementStatusTypeEnumMap = {
  SettlementStatusType.pending: 'PENDING',
  SettlementStatusType.hold: 'ON_HOLD',
  SettlementStatusType.confirmed: 'CONFIRMED',
  SettlementStatusType.cancelled: 'CANCELLED',
};
