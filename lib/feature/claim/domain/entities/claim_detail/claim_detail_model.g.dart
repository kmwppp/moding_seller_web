// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClaimDetailModel _$ClaimDetailModelFromJson(
  Map<String, dynamic> json,
) => _ClaimDetailModel(
  id: (json['id'] as num).toInt(),
  claimCode: json['claimCode'] as String,
  orderId: (json['orderId'] as num).toInt(),
  orderCode: json['orderCode'] as String,
  buyerBusinessName: json['buyerBusinessName'] as String,
  claimType: $enumDecode(_$ClaimTypeEnumMap, json['claimType']),
  claimReason: json['claimReason'] as String,
  status: $enumDecode(_$ClaimStatusEnumMap, json['status']),
  resolution: $enumDecodeNullable(_$ClaimResolutionEnumMap, json['resolution']),
  deliveredAt: _fromJsonDateNullable(json['deliveredAt'] as String?),
  rejectReason: json['rejectReason'] as String?,
  appealReason: json['appealReason'] as String?,
  appealDeadlineAt: _fromJsonDateNullable(json['appealDeadlineAt'] as String?),
  reshipDeliveryMethod: $enumDecodeNullable(
    _$DeliveryMethodEnumMap,
    json['reshipDeliveryMethod'],
  ),
  reshipCourierCode: json['reshipCourierCode'] as String?,
  reshipTrackingNumber: json['reshipTrackingNumber'] as String?,
  productDeliveryMethods: (json['productDeliveryMethods'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$DeliveryMethodEnumMap, e))
      .toList(),
  reshipShippedAt: _fromJsonDateNullable(json['reshipShippedAt'] as String?),
  recipientName: json['recipientName'] as String?,
  zipCode: json['zipCode'] as String?,
  address: json['address'] as String?,
  addressDetail: json['addressDetail'] as String?,
  phone: json['phone'] as String?,
  deliveryRequest: json['deliveryRequest'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => ClaimItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  photos:
      (json['photoUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  statusHistories:
      (json['statusHistories'] as List<dynamic>?)
          ?.map(
            (e) => ClaimStatusHistoryModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  reshipTrackingEvents:
      (json['reshipTrackingEvents'] as List<dynamic>?)
          ?.map(
            (e) => ClaimTrackingEventModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  createdAt: _fromJsonDate(json['createdAt'] as String),
  updatedAt: _fromJsonDate(json['updatedAt'] as String),
);

Map<String, dynamic> _$ClaimDetailModelToJson(_ClaimDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'claimCode': instance.claimCode,
      'orderId': instance.orderId,
      'orderCode': instance.orderCode,
      'buyerBusinessName': instance.buyerBusinessName,
      'claimType': _$ClaimTypeEnumMap[instance.claimType]!,
      'claimReason': instance.claimReason,
      'status': _$ClaimStatusEnumMap[instance.status]!,
      'resolution': _$ClaimResolutionEnumMap[instance.resolution],
      'deliveredAt': _toJsonDateNullable(instance.deliveredAt),
      'rejectReason': instance.rejectReason,
      'appealReason': instance.appealReason,
      'appealDeadlineAt': _toJsonDateNullable(instance.appealDeadlineAt),
      'reshipDeliveryMethod':
          _$DeliveryMethodEnumMap[instance.reshipDeliveryMethod],
      'reshipCourierCode': instance.reshipCourierCode,
      'reshipTrackingNumber': instance.reshipTrackingNumber,
      'productDeliveryMethods': instance.productDeliveryMethods
          ?.map((e) => _$DeliveryMethodEnumMap[e]!)
          .toList(),
      'reshipShippedAt': _toJsonDateNullable(instance.reshipShippedAt),
      'recipientName': instance.recipientName,
      'zipCode': instance.zipCode,
      'address': instance.address,
      'addressDetail': instance.addressDetail,
      'phone': instance.phone,
      'deliveryRequest': instance.deliveryRequest,
      'items': instance.items,
      'photoUrls': instance.photos,
      'statusHistories': instance.statusHistories,
      'reshipTrackingEvents': instance.reshipTrackingEvents,
      'createdAt': _toJsonDate(instance.createdAt),
      'updatedAt': _toJsonDate(instance.updatedAt),
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

const _$ClaimResolutionEnumMap = {
  ClaimResolution.refund: 'REFUND',
  ClaimResolution.reship: 'RESHIP',
};

const _$DeliveryMethodEnumMap = {
  DeliveryMethod.COURIER: 'COURIER',
  DeliveryMethod.DIRECT: 'DIRECT',
};

_ClaimItemModel _$ClaimItemModelFromJson(Map<String, dynamic> json) =>
    _ClaimItemModel(
      id: (json['id'] as num).toInt(),
      orderItemId: (json['orderItemId'] as num).toInt(),
      productName: json['productName'] as String,
      optionName: json['optionName'] as String,
      unitPrice: (json['unitPrice'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      claimedQuantity: (json['claimedQuantity'] as num).toInt(),
      refundAmount: (json['refundAmount'] as num).toInt(),
    );

Map<String, dynamic> _$ClaimItemModelToJson(_ClaimItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderItemId': instance.orderItemId,
      'productName': instance.productName,
      'optionName': instance.optionName,
      'unitPrice': instance.unitPrice,
      'quantity': instance.quantity,
      'claimedQuantity': instance.claimedQuantity,
      'refundAmount': instance.refundAmount,
    };

_ClaimStatusHistoryModel _$ClaimStatusHistoryModelFromJson(
  Map<String, dynamic> json,
) => _ClaimStatusHistoryModel(
  id: (json['id'] as num).toInt(),
  status: json['status'] as String,
  memo: json['memo'] as String,
  createdAt: _fromJsonDate(json['createdAt'] as String),
);

Map<String, dynamic> _$ClaimStatusHistoryModelToJson(
  _ClaimStatusHistoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'memo': instance.memo,
  'createdAt': _toJsonDate(instance.createdAt),
};

_ClaimTrackingEventModel _$ClaimTrackingEventModelFromJson(
  Map<String, dynamic> json,
) => _ClaimTrackingEventModel(
  timeString: json['timeString'] as String,
  where: json['where'] as String,
  kind: json['kind'] as String,
  level: (json['level'] as num).toInt(),
);

Map<String, dynamic> _$ClaimTrackingEventModelToJson(
  _ClaimTrackingEventModel instance,
) => <String, dynamic>{
  'timeString': instance.timeString,
  'where': instance.where,
  'kind': instance.kind,
  'level': instance.level,
};
