import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../order/domain/enums/order_status_enum.dart';
import '../enums/delivery_method.dart';

part 'preparing_order_model.freezed.dart';
part 'preparing_order_model.g.dart';

@freezed
abstract class PreparingOrderModel with _$PreparingOrderModel {
  const factory PreparingOrderModel({
    required int id,
    required String orderCode,
    required int buyerBusinessProfileId,
    required String buyerBusinessName,
    required int sellerProfileId,
    required String sellerBusinessName,
    required String addressName,
    required String recipientName,
    required String zipCode,
    required String address,
    String? addressDetail,
    required String phone,
    required String status,
    required int totalAmount,
    required int deliveryFee,
    required DeliveryMethod? deliveryMethod,
    required List<DeliveryMethod> productDeliveryMethods,

    String? deliveryRequest,
    String? rejectionReason,
    String? rejectionReasonDetail,

    required List<PreparingOrderItemModel> items,
    PreparingDeliveryModel? delivery,
    PreparingPaymentModel? payment,

    required DateTime createdAt,
    required DateTime updatedAt,

    required bool isVariableWeight,

    @Default(false) bool sample,
    @Default(false) bool isSample,
  }) = _PreparingOrderModel;

  factory PreparingOrderModel.fromJson(Map<String, dynamic> json) =>
      _$PreparingOrderModelFromJson(json);
}

DeliveryMethod deliveryMethodFromJson(String value) =>
    DeliveryMethod.values.firstWhere((e) => e.name == value);

String deliveryMethodToJson(DeliveryMethod method) => method.name;

@freezed
abstract class PreparingOrderItemModel with _$PreparingOrderItemModel {
  const factory PreparingOrderItemModel({
    required int id,
    required int productId,
    required String productName,

    int? productOptionId,
    String? optionName,

    required int unitPrice,
    required int quantity,
    required int totalPrice,

    double? orderedCapacity,
    String? orderedCapacityUnit,
    double? actualCapacity,
    double? weightRefundAmount,

    required bool isTaxable,
  }) = _PreparingOrderItemModel;

  factory PreparingOrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$PreparingOrderItemModelFromJson(json);
}

@freezed
abstract class PreparingDeliveryModel with _$PreparingDeliveryModel {
  const factory PreparingDeliveryModel({
    @Default(OrderStatus.CONFIRMED) OrderStatus? status,
    @Default('') String courierCode,
    @Default('') String courierName,
    @Default('') String trackingNumber,
    DateTime? shippedAt,
    DateTime? deliveredAt,
  }) = _PreparingDeliveryModel;

  factory PreparingDeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$PreparingDeliveryModelFromJson(json);
}

@freezed
abstract class PreparingPaymentModel with _$PreparingPaymentModel {
  const factory PreparingPaymentModel({
    @Default('') String paymentCode,
    @Default('') String paymentMethod,
    @Default('') String status,
    DateTime? paidAt,
    @Default(0) num cancelledAmount,
    @Default(0) num netAmount,
    String? receiptUrl,
    String? approvalNumber,
    String? vbankNumber,
    String? vbankName,
    DateTime? vbankExpDate,
    String? vbankHolder,
  }) = _PreparingPaymentModel;

  factory PreparingPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PreparingPaymentModelFromJson(json);
}
