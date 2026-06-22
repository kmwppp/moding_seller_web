// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {

 int get id; String get orderCode; String get buyerBusinessName; String get deliveryAddressRecipientName; String get deliveryAddressName; String get deliveryAddressPhone; String get deliveryAddressFull; int get totalAmount; List<OrderItemModel> get items;@JsonKey(unknownEnumValue: OrderStatus.ORDERED) OrderStatus get status; int get claimId;@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime get createdAt;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderCode, orderCode) || other.orderCode == orderCode)&&(identical(other.buyerBusinessName, buyerBusinessName) || other.buyerBusinessName == buyerBusinessName)&&(identical(other.deliveryAddressRecipientName, deliveryAddressRecipientName) || other.deliveryAddressRecipientName == deliveryAddressRecipientName)&&(identical(other.deliveryAddressName, deliveryAddressName) || other.deliveryAddressName == deliveryAddressName)&&(identical(other.deliveryAddressPhone, deliveryAddressPhone) || other.deliveryAddressPhone == deliveryAddressPhone)&&(identical(other.deliveryAddressFull, deliveryAddressFull) || other.deliveryAddressFull == deliveryAddressFull)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.status, status) || other.status == status)&&(identical(other.claimId, claimId) || other.claimId == claimId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderCode,buyerBusinessName,deliveryAddressRecipientName,deliveryAddressName,deliveryAddressPhone,deliveryAddressFull,totalAmount,const DeepCollectionEquality().hash(items),status,claimId,createdAt);

@override
String toString() {
  return 'OrderModel(id: $id, orderCode: $orderCode, buyerBusinessName: $buyerBusinessName, deliveryAddressRecipientName: $deliveryAddressRecipientName, deliveryAddressName: $deliveryAddressName, deliveryAddressPhone: $deliveryAddressPhone, deliveryAddressFull: $deliveryAddressFull, totalAmount: $totalAmount, items: $items, status: $status, claimId: $claimId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 int id, String orderCode, String buyerBusinessName, String deliveryAddressRecipientName, String deliveryAddressName, String deliveryAddressPhone, String deliveryAddressFull, int totalAmount, List<OrderItemModel> items,@JsonKey(unknownEnumValue: OrderStatus.ORDERED) OrderStatus status, int claimId,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime createdAt
});




}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderCode = null,Object? buyerBusinessName = null,Object? deliveryAddressRecipientName = null,Object? deliveryAddressName = null,Object? deliveryAddressPhone = null,Object? deliveryAddressFull = null,Object? totalAmount = null,Object? items = null,Object? status = null,Object? claimId = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,buyerBusinessName: null == buyerBusinessName ? _self.buyerBusinessName : buyerBusinessName // ignore: cast_nullable_to_non_nullable
as String,deliveryAddressRecipientName: null == deliveryAddressRecipientName ? _self.deliveryAddressRecipientName : deliveryAddressRecipientName // ignore: cast_nullable_to_non_nullable
as String,deliveryAddressName: null == deliveryAddressName ? _self.deliveryAddressName : deliveryAddressName // ignore: cast_nullable_to_non_nullable
as String,deliveryAddressPhone: null == deliveryAddressPhone ? _self.deliveryAddressPhone : deliveryAddressPhone // ignore: cast_nullable_to_non_nullable
as String,deliveryAddressFull: null == deliveryAddressFull ? _self.deliveryAddressFull : deliveryAddressFull // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,claimId: null == claimId ? _self.claimId : claimId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String orderCode,  String buyerBusinessName,  String deliveryAddressRecipientName,  String deliveryAddressName,  String deliveryAddressPhone,  String deliveryAddressFull,  int totalAmount,  List<OrderItemModel> items, @JsonKey(unknownEnumValue: OrderStatus.ORDERED)  OrderStatus status,  int claimId, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.orderCode,_that.buyerBusinessName,_that.deliveryAddressRecipientName,_that.deliveryAddressName,_that.deliveryAddressPhone,_that.deliveryAddressFull,_that.totalAmount,_that.items,_that.status,_that.claimId,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String orderCode,  String buyerBusinessName,  String deliveryAddressRecipientName,  String deliveryAddressName,  String deliveryAddressPhone,  String deliveryAddressFull,  int totalAmount,  List<OrderItemModel> items, @JsonKey(unknownEnumValue: OrderStatus.ORDERED)  OrderStatus status,  int claimId, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.id,_that.orderCode,_that.buyerBusinessName,_that.deliveryAddressRecipientName,_that.deliveryAddressName,_that.deliveryAddressPhone,_that.deliveryAddressFull,_that.totalAmount,_that.items,_that.status,_that.claimId,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String orderCode,  String buyerBusinessName,  String deliveryAddressRecipientName,  String deliveryAddressName,  String deliveryAddressPhone,  String deliveryAddressFull,  int totalAmount,  List<OrderItemModel> items, @JsonKey(unknownEnumValue: OrderStatus.ORDERED)  OrderStatus status,  int claimId, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.orderCode,_that.buyerBusinessName,_that.deliveryAddressRecipientName,_that.deliveryAddressName,_that.deliveryAddressPhone,_that.deliveryAddressFull,_that.totalAmount,_that.items,_that.status,_that.claimId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel implements OrderModel {
  const _OrderModel({this.id = 0, this.orderCode = '', this.buyerBusinessName = '', this.deliveryAddressRecipientName = '', this.deliveryAddressName = '', this.deliveryAddressPhone = '', this.deliveryAddressFull = '', this.totalAmount = 0, final  List<OrderItemModel> items = const <OrderItemModel>[], @JsonKey(unknownEnumValue: OrderStatus.ORDERED) this.status = OrderStatus.ORDERED, this.claimId = 0, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) required this.createdAt}): _items = items;
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  String orderCode;
@override@JsonKey() final  String buyerBusinessName;
@override@JsonKey() final  String deliveryAddressRecipientName;
@override@JsonKey() final  String deliveryAddressName;
@override@JsonKey() final  String deliveryAddressPhone;
@override@JsonKey() final  String deliveryAddressFull;
@override@JsonKey() final  int totalAmount;
 final  List<OrderItemModel> _items;
@override@JsonKey() List<OrderItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(unknownEnumValue: OrderStatus.ORDERED) final  OrderStatus status;
@override@JsonKey() final  int claimId;
@override@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) final  DateTime createdAt;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderCode, orderCode) || other.orderCode == orderCode)&&(identical(other.buyerBusinessName, buyerBusinessName) || other.buyerBusinessName == buyerBusinessName)&&(identical(other.deliveryAddressRecipientName, deliveryAddressRecipientName) || other.deliveryAddressRecipientName == deliveryAddressRecipientName)&&(identical(other.deliveryAddressName, deliveryAddressName) || other.deliveryAddressName == deliveryAddressName)&&(identical(other.deliveryAddressPhone, deliveryAddressPhone) || other.deliveryAddressPhone == deliveryAddressPhone)&&(identical(other.deliveryAddressFull, deliveryAddressFull) || other.deliveryAddressFull == deliveryAddressFull)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.status, status) || other.status == status)&&(identical(other.claimId, claimId) || other.claimId == claimId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderCode,buyerBusinessName,deliveryAddressRecipientName,deliveryAddressName,deliveryAddressPhone,deliveryAddressFull,totalAmount,const DeepCollectionEquality().hash(_items),status,claimId,createdAt);

@override
String toString() {
  return 'OrderModel(id: $id, orderCode: $orderCode, buyerBusinessName: $buyerBusinessName, deliveryAddressRecipientName: $deliveryAddressRecipientName, deliveryAddressName: $deliveryAddressName, deliveryAddressPhone: $deliveryAddressPhone, deliveryAddressFull: $deliveryAddressFull, totalAmount: $totalAmount, items: $items, status: $status, claimId: $claimId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String orderCode, String buyerBusinessName, String deliveryAddressRecipientName, String deliveryAddressName, String deliveryAddressPhone, String deliveryAddressFull, int totalAmount, List<OrderItemModel> items,@JsonKey(unknownEnumValue: OrderStatus.ORDERED) OrderStatus status, int claimId,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime createdAt
});




}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderCode = null,Object? buyerBusinessName = null,Object? deliveryAddressRecipientName = null,Object? deliveryAddressName = null,Object? deliveryAddressPhone = null,Object? deliveryAddressFull = null,Object? totalAmount = null,Object? items = null,Object? status = null,Object? claimId = null,Object? createdAt = null,}) {
  return _then(_OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,buyerBusinessName: null == buyerBusinessName ? _self.buyerBusinessName : buyerBusinessName // ignore: cast_nullable_to_non_nullable
as String,deliveryAddressRecipientName: null == deliveryAddressRecipientName ? _self.deliveryAddressRecipientName : deliveryAddressRecipientName // ignore: cast_nullable_to_non_nullable
as String,deliveryAddressName: null == deliveryAddressName ? _self.deliveryAddressName : deliveryAddressName // ignore: cast_nullable_to_non_nullable
as String,deliveryAddressPhone: null == deliveryAddressPhone ? _self.deliveryAddressPhone : deliveryAddressPhone // ignore: cast_nullable_to_non_nullable
as String,deliveryAddressFull: null == deliveryAddressFull ? _self.deliveryAddressFull : deliveryAddressFull // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,claimId: null == claimId ? _self.claimId : claimId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
