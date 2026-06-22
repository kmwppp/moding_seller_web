// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClaimModel _$ClaimModelFromJson(Map<String, dynamic> json) => _ClaimModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  orderId: (json['orderId'] as num?)?.toInt() ?? 0,
  claimCode: json['claimCode'] as String? ?? '',
  productName: json['productName'] as String? ?? '',
  claimType:
      $enumDecodeNullable(
        _$ClaimTypeEnumMap,
        json['claimType'],
        unknownValue: ClaimType.CONDITION,
      ) ??
      ClaimType.CONDITION,
  claimReason: json['claimReason'] as String? ?? '',
  status:
      $enumDecodeNullable(
        _$ClaimStatusEnumMap,
        json['status'],
        unknownValue: ClaimStatus.requested,
      ) ??
      ClaimStatus.requested,
  resolution: json['resolution'] as String? ?? '',
  createdAt: _fromJsonDate(json['createdAt'] as String),
);

Map<String, dynamic> _$ClaimModelToJson(_ClaimModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderId': instance.orderId,
      'claimCode': instance.claimCode,
      'productName': instance.productName,
      'claimType': _$ClaimTypeEnumMap[instance.claimType]!,
      'claimReason': instance.claimReason,
      'status': _$ClaimStatusEnumMap[instance.status]!,
      'resolution': instance.resolution,
      'createdAt': _toJsonDate(instance.createdAt),
    };

const _$ClaimTypeEnumMap = {
  ClaimType.QUANTITY: 'QUANTITY',
  ClaimType.CONDITION: 'CONDITION',
};

const _$ClaimStatusEnumMap = {
  ClaimStatus.requested: 'REQUESTED',
  ClaimStatus.approved: 'APPROVED',
  ClaimStatus.reship: 'RESHIP_SHIPPED',
  ClaimStatus.rejected: 'REJECTED',
  ClaimStatus.appealed: 'APPEALED',
  ClaimStatus.completed: 'COMPLETED',
};
