import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moding_seller_web/feature/order/domain/entities/order_item_model.dart';

import '../enums/order_status_enum.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    @Default(0) int id,
    @Default('') String orderCode,
    @Default('') String buyerBusinessName,
    @Default('') String deliveryAddressRecipientName,
    @Default('') String deliveryAddressName,
    @Default('') String deliveryAddressPhone,
    @Default('') String deliveryAddressFull,
    @Default(0) int totalAmount,
    @Default(<OrderItemModel>[]) List<OrderItemModel> items,

    @JsonKey(unknownEnumValue: OrderStatus.ORDERED)
    @Default(OrderStatus.ORDERED)
    OrderStatus status,

    @Default(0) int claimId,

    @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)
    required DateTime createdAt,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

DateTime _fromJsonDate(String value) => DateTime.parse(value);

String _toJsonDate(DateTime date) => date.toIso8601String();
