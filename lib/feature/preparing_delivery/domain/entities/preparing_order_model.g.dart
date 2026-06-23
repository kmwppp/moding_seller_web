// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preparing_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PreparingOrderModel _$PreparingOrderModelFromJson(
  Map<String, dynamic> json,
) => _PreparingOrderModel(
  id: (json['id'] as num).toInt(),
  orderCode: json['orderCode'] as String,
  buyerBusinessProfileId: (json['buyerBusinessProfileId'] as num).toInt(),
  buyerBusinessName: json['buyerBusinessName'] as String,
  sellerProfileId: (json['sellerProfileId'] as num).toInt(),
  sellerBusinessName: json['sellerBusinessName'] as String,
  addressName: json['addressName'] as String,
  recipientName: json['recipientName'] as String,
  zipCode: json['zipCode'] as String,
  address: json['address'] as String,
  addressDetail: json['addressDetail'] as String?,
  phone: json['phone'] as String,
  status: json['status'] as String,
  totalAmount: (json['totalAmount'] as num).toInt(),
  deliveryFee: (json['deliveryFee'] as num).toInt(),
  deliveryMethod: $enumDecodeNullable(
    _$DeliveryMethodEnumMap,
    json['deliveryMethod'],
  ),
  productDeliveryMethods: (json['productDeliveryMethods'] as List<dynamic>)
      .map((e) => $enumDecode(_$DeliveryMethodEnumMap, e))
      .toList(),
  deliveryRequest: json['deliveryRequest'] as String?,
  rejectionReason: json['rejectionReason'] as String?,
  rejectionReasonDetail: json['rejectionReasonDetail'] as String?,
  items: (json['items'] as List<dynamic>)
      .map((e) => PreparingOrderItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  delivery: json['delivery'] == null
      ? null
      : PreparingDeliveryModel.fromJson(
          json['delivery'] as Map<String, dynamic>,
        ),
  payment: json['payment'] == null
      ? null
      : PreparingPaymentModel.fromJson(json['payment'] as Map<String, dynamic>),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isVariableWeight: json['isVariableWeight'] as bool,
  sample: json['sample'] as bool? ?? false,
  isSample: json['isSample'] as bool? ?? false,
);

Map<String, dynamic> _$PreparingOrderModelToJson(
  _PreparingOrderModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'orderCode': instance.orderCode,
  'buyerBusinessProfileId': instance.buyerBusinessProfileId,
  'buyerBusinessName': instance.buyerBusinessName,
  'sellerProfileId': instance.sellerProfileId,
  'sellerBusinessName': instance.sellerBusinessName,
  'addressName': instance.addressName,
  'recipientName': instance.recipientName,
  'zipCode': instance.zipCode,
  'address': instance.address,
  'addressDetail': instance.addressDetail,
  'phone': instance.phone,
  'status': instance.status,
  'totalAmount': instance.totalAmount,
  'deliveryFee': instance.deliveryFee,
  'deliveryMethod': _$DeliveryMethodEnumMap[instance.deliveryMethod],
  'productDeliveryMethods': instance.productDeliveryMethods
      .map((e) => _$DeliveryMethodEnumMap[e]!)
      .toList(),
  'deliveryRequest': instance.deliveryRequest,
  'rejectionReason': instance.rejectionReason,
  'rejectionReasonDetail': instance.rejectionReasonDetail,
  'items': instance.items,
  'delivery': instance.delivery,
  'payment': instance.payment,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isVariableWeight': instance.isVariableWeight,
  'sample': instance.sample,
  'isSample': instance.isSample,
};

const _$DeliveryMethodEnumMap = {
  DeliveryMethod.COURIER: 'COURIER',
  DeliveryMethod.DIRECT: 'DIRECT',
};

_PreparingOrderItemModel _$PreparingOrderItemModelFromJson(
  Map<String, dynamic> json,
) => _PreparingOrderItemModel(
  id: (json['id'] as num).toInt(),
  productId: (json['productId'] as num).toInt(),
  productName: json['productName'] as String,
  productOptionId: (json['productOptionId'] as num?)?.toInt(),
  optionName: json['optionName'] as String?,
  unitPrice: (json['unitPrice'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
  totalPrice: (json['totalPrice'] as num).toInt(),
  orderedCapacity: (json['orderedCapacity'] as num?)?.toDouble(),
  orderedCapacityUnit: json['orderedCapacityUnit'] as String?,
  actualCapacity: (json['actualCapacity'] as num?)?.toDouble(),
  weightRefundAmount: (json['weightRefundAmount'] as num?)?.toDouble(),
  isTaxable: json['isTaxable'] as bool,
);

Map<String, dynamic> _$PreparingOrderItemModelToJson(
  _PreparingOrderItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'productName': instance.productName,
  'productOptionId': instance.productOptionId,
  'optionName': instance.optionName,
  'unitPrice': instance.unitPrice,
  'quantity': instance.quantity,
  'totalPrice': instance.totalPrice,
  'orderedCapacity': instance.orderedCapacity,
  'orderedCapacityUnit': instance.orderedCapacityUnit,
  'actualCapacity': instance.actualCapacity,
  'weightRefundAmount': instance.weightRefundAmount,
  'isTaxable': instance.isTaxable,
};

_PreparingDeliveryModel _$PreparingDeliveryModelFromJson(
  Map<String, dynamic> json,
) => _PreparingDeliveryModel(
  status:
      $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
      OrderStatus.CONFIRMED,
  courierCode: json['courierCode'] as String? ?? '',
  courierName: json['courierName'] as String? ?? '',
  trackingNumber: json['trackingNumber'] as String? ?? '',
  shippedAt: json['shippedAt'] == null
      ? null
      : DateTime.parse(json['shippedAt'] as String),
  deliveredAt: json['deliveredAt'] == null
      ? null
      : DateTime.parse(json['deliveredAt'] as String),
);

Map<String, dynamic> _$PreparingDeliveryModelToJson(
  _PreparingDeliveryModel instance,
) => <String, dynamic>{
  'status': _$OrderStatusEnumMap[instance.status],
  'courierCode': instance.courierCode,
  'courierName': instance.courierName,
  'trackingNumber': instance.trackingNumber,
  'shippedAt': instance.shippedAt?.toIso8601String(),
  'deliveredAt': instance.deliveredAt?.toIso8601String(),
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

_PreparingPaymentModel _$PreparingPaymentModelFromJson(
  Map<String, dynamic> json,
) => _PreparingPaymentModel(
  paymentCode: json['paymentCode'] as String? ?? '',
  paymentMethod: json['paymentMethod'] as String? ?? '',
  status: json['status'] as String? ?? '',
  paidAt: json['paidAt'] == null
      ? null
      : DateTime.parse(json['paidAt'] as String),
  cancelledAmount: json['cancelledAmount'] as num? ?? 0,
  netAmount: json['netAmount'] as num? ?? 0,
  receiptUrl: json['receiptUrl'] as String?,
  approvalNumber: json['approvalNumber'] as String?,
  vbankNumber: json['vbankNumber'] as String?,
  vbankName: json['vbankName'] as String?,
  vbankExpDate: json['vbankExpDate'] == null
      ? null
      : DateTime.parse(json['vbankExpDate'] as String),
  vbankHolder: json['vbankHolder'] as String?,
);

Map<String, dynamic> _$PreparingPaymentModelToJson(
  _PreparingPaymentModel instance,
) => <String, dynamic>{
  'paymentCode': instance.paymentCode,
  'paymentMethod': instance.paymentMethod,
  'status': instance.status,
  'paidAt': instance.paidAt?.toIso8601String(),
  'cancelledAmount': instance.cancelledAmount,
  'netAmount': instance.netAmount,
  'receiptUrl': instance.receiptUrl,
  'approvalNumber': instance.approvalNumber,
  'vbankNumber': instance.vbankNumber,
  'vbankName': instance.vbankName,
  'vbankExpDate': instance.vbankExpDate?.toIso8601String(),
  'vbankHolder': instance.vbankHolder,
};
