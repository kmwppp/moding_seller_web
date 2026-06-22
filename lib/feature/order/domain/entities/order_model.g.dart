// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  orderCode: json['orderCode'] as String? ?? '',
  buyerBusinessName: json['buyerBusinessName'] as String? ?? '',
  deliveryAddressRecipientName:
      json['deliveryAddressRecipientName'] as String? ?? '',
  deliveryAddressName: json['deliveryAddressName'] as String? ?? '',
  deliveryAddressPhone: json['deliveryAddressPhone'] as String? ?? '',
  deliveryAddressFull: json['deliveryAddressFull'] as String? ?? '',
  totalAmount: (json['totalAmount'] as num?)?.toInt() ?? 0,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <OrderItemModel>[],
  status:
      $enumDecodeNullable(
        _$OrderStatusEnumMap,
        json['status'],
        unknownValue: OrderStatus.ORDERED,
      ) ??
      OrderStatus.ORDERED,
  claimId: (json['claimId'] as num?)?.toInt() ?? 0,
  createdAt: _fromJsonDate(json['createdAt'] as String),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderCode': instance.orderCode,
      'buyerBusinessName': instance.buyerBusinessName,
      'deliveryAddressRecipientName': instance.deliveryAddressRecipientName,
      'deliveryAddressName': instance.deliveryAddressName,
      'deliveryAddressPhone': instance.deliveryAddressPhone,
      'deliveryAddressFull': instance.deliveryAddressFull,
      'totalAmount': instance.totalAmount,
      'items': instance.items,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'claimId': instance.claimId,
      'createdAt': _toJsonDate(instance.createdAt),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.ORDERED: 'ORDERED',
  OrderStatus.CONFIRMED: 'CONFIRMED',
  OrderStatus.REJECTED: 'REJECTED',
  OrderStatus.SHIPPED: 'SHIPPED',
  OrderStatus.DELIVERED: 'DELIVERED',
  OrderStatus.PURCHASE_CONFIRMED: 'PURCHASE_CONFIRMED',
  OrderStatus.CLAIM_IN_PROGRESS: 'CLAIM_IN_PROGRESS',
  OrderStatus.SETTLEMENT_COMPLETED: 'SETTLEMENT_COMPLETED',
  OrderStatus.CANCELLED: 'CANCELLED',
};
