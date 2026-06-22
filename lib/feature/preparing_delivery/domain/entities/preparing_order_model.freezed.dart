// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preparing_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreparingOrderModel {

 int get id; String get orderCode; int get buyerProfileId; String get buyerBusinessName; int get sellerProfileId; String get sellerBusinessName; String get addressName; String get recipientName; String get zipCode; String get address; String? get addressDetail; String get phone; String get status; int get totalAmount; int get deliveryFee; DeliveryMethod? get deliveryMethod; List<DeliveryMethod> get productDeliveryMethods; String? get deliveryRequest; String? get rejectionReason; String? get rejectionReasonDetail; List<PreparingOrderItemModel> get items; PreparingDeliveryModel? get delivery; PreparingPaymentModel? get payment; DateTime get createdAt; DateTime get updatedAt; bool get isVariableWeight; bool get sample; bool get isSample;
/// Create a copy of PreparingOrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreparingOrderModelCopyWith<PreparingOrderModel> get copyWith => _$PreparingOrderModelCopyWithImpl<PreparingOrderModel>(this as PreparingOrderModel, _$identity);

  /// Serializes this PreparingOrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparingOrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderCode, orderCode) || other.orderCode == orderCode)&&(identical(other.buyerProfileId, buyerProfileId) || other.buyerProfileId == buyerProfileId)&&(identical(other.buyerBusinessName, buyerBusinessName) || other.buyerBusinessName == buyerBusinessName)&&(identical(other.sellerProfileId, sellerProfileId) || other.sellerProfileId == sellerProfileId)&&(identical(other.sellerBusinessName, sellerBusinessName) || other.sellerBusinessName == sellerBusinessName)&&(identical(other.addressName, addressName) || other.addressName == addressName)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressDetail, addressDetail) || other.addressDetail == addressDetail)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&const DeepCollectionEquality().equals(other.productDeliveryMethods, productDeliveryMethods)&&(identical(other.deliveryRequest, deliveryRequest) || other.deliveryRequest == deliveryRequest)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.rejectionReasonDetail, rejectionReasonDetail) || other.rejectionReasonDetail == rejectionReasonDetail)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isVariableWeight, isVariableWeight) || other.isVariableWeight == isVariableWeight)&&(identical(other.sample, sample) || other.sample == sample)&&(identical(other.isSample, isSample) || other.isSample == isSample));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orderCode,buyerProfileId,buyerBusinessName,sellerProfileId,sellerBusinessName,addressName,recipientName,zipCode,address,addressDetail,phone,status,totalAmount,deliveryFee,deliveryMethod,const DeepCollectionEquality().hash(productDeliveryMethods),deliveryRequest,rejectionReason,rejectionReasonDetail,const DeepCollectionEquality().hash(items),delivery,payment,createdAt,updatedAt,isVariableWeight,sample,isSample]);

@override
String toString() {
  return 'PreparingOrderModel(id: $id, orderCode: $orderCode, buyerProfileId: $buyerProfileId, buyerBusinessName: $buyerBusinessName, sellerProfileId: $sellerProfileId, sellerBusinessName: $sellerBusinessName, addressName: $addressName, recipientName: $recipientName, zipCode: $zipCode, address: $address, addressDetail: $addressDetail, phone: $phone, status: $status, totalAmount: $totalAmount, deliveryFee: $deliveryFee, deliveryMethod: $deliveryMethod, productDeliveryMethods: $productDeliveryMethods, deliveryRequest: $deliveryRequest, rejectionReason: $rejectionReason, rejectionReasonDetail: $rejectionReasonDetail, items: $items, delivery: $delivery, payment: $payment, createdAt: $createdAt, updatedAt: $updatedAt, isVariableWeight: $isVariableWeight, sample: $sample, isSample: $isSample)';
}


}

/// @nodoc
abstract mixin class $PreparingOrderModelCopyWith<$Res>  {
  factory $PreparingOrderModelCopyWith(PreparingOrderModel value, $Res Function(PreparingOrderModel) _then) = _$PreparingOrderModelCopyWithImpl;
@useResult
$Res call({
 int id, String orderCode, int buyerProfileId, String buyerBusinessName, int sellerProfileId, String sellerBusinessName, String addressName, String recipientName, String zipCode, String address, String? addressDetail, String phone, String status, int totalAmount, int deliveryFee, DeliveryMethod? deliveryMethod, List<DeliveryMethod> productDeliveryMethods, String? deliveryRequest, String? rejectionReason, String? rejectionReasonDetail, List<PreparingOrderItemModel> items, PreparingDeliveryModel? delivery, PreparingPaymentModel? payment, DateTime createdAt, DateTime updatedAt, bool isVariableWeight, bool sample, bool isSample
});


$PreparingDeliveryModelCopyWith<$Res>? get delivery;$PreparingPaymentModelCopyWith<$Res>? get payment;

}
/// @nodoc
class _$PreparingOrderModelCopyWithImpl<$Res>
    implements $PreparingOrderModelCopyWith<$Res> {
  _$PreparingOrderModelCopyWithImpl(this._self, this._then);

  final PreparingOrderModel _self;
  final $Res Function(PreparingOrderModel) _then;

/// Create a copy of PreparingOrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderCode = null,Object? buyerProfileId = null,Object? buyerBusinessName = null,Object? sellerProfileId = null,Object? sellerBusinessName = null,Object? addressName = null,Object? recipientName = null,Object? zipCode = null,Object? address = null,Object? addressDetail = freezed,Object? phone = null,Object? status = null,Object? totalAmount = null,Object? deliveryFee = null,Object? deliveryMethod = freezed,Object? productDeliveryMethods = null,Object? deliveryRequest = freezed,Object? rejectionReason = freezed,Object? rejectionReasonDetail = freezed,Object? items = null,Object? delivery = freezed,Object? payment = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isVariableWeight = null,Object? sample = null,Object? isSample = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,buyerProfileId: null == buyerProfileId ? _self.buyerProfileId : buyerProfileId // ignore: cast_nullable_to_non_nullable
as int,buyerBusinessName: null == buyerBusinessName ? _self.buyerBusinessName : buyerBusinessName // ignore: cast_nullable_to_non_nullable
as String,sellerProfileId: null == sellerProfileId ? _self.sellerProfileId : sellerProfileId // ignore: cast_nullable_to_non_nullable
as int,sellerBusinessName: null == sellerBusinessName ? _self.sellerBusinessName : sellerBusinessName // ignore: cast_nullable_to_non_nullable
as String,addressName: null == addressName ? _self.addressName : addressName // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,zipCode: null == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,addressDetail: freezed == addressDetail ? _self.addressDetail : addressDetail // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as int,deliveryMethod: freezed == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as DeliveryMethod?,productDeliveryMethods: null == productDeliveryMethods ? _self.productDeliveryMethods : productDeliveryMethods // ignore: cast_nullable_to_non_nullable
as List<DeliveryMethod>,deliveryRequest: freezed == deliveryRequest ? _self.deliveryRequest : deliveryRequest // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,rejectionReasonDetail: freezed == rejectionReasonDetail ? _self.rejectionReasonDetail : rejectionReasonDetail // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PreparingOrderItemModel>,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as PreparingDeliveryModel?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PreparingPaymentModel?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isVariableWeight: null == isVariableWeight ? _self.isVariableWeight : isVariableWeight // ignore: cast_nullable_to_non_nullable
as bool,sample: null == sample ? _self.sample : sample // ignore: cast_nullable_to_non_nullable
as bool,isSample: null == isSample ? _self.isSample : isSample // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PreparingOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreparingDeliveryModelCopyWith<$Res>? get delivery {
    if (_self.delivery == null) {
    return null;
  }

  return $PreparingDeliveryModelCopyWith<$Res>(_self.delivery!, (value) {
    return _then(_self.copyWith(delivery: value));
  });
}/// Create a copy of PreparingOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreparingPaymentModelCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PreparingPaymentModelCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// Adds pattern-matching-related methods to [PreparingOrderModel].
extension PreparingOrderModelPatterns on PreparingOrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreparingOrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreparingOrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreparingOrderModel value)  $default,){
final _that = this;
switch (_that) {
case _PreparingOrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreparingOrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _PreparingOrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String orderCode,  int buyerProfileId,  String buyerBusinessName,  int sellerProfileId,  String sellerBusinessName,  String addressName,  String recipientName,  String zipCode,  String address,  String? addressDetail,  String phone,  String status,  int totalAmount,  int deliveryFee,  DeliveryMethod? deliveryMethod,  List<DeliveryMethod> productDeliveryMethods,  String? deliveryRequest,  String? rejectionReason,  String? rejectionReasonDetail,  List<PreparingOrderItemModel> items,  PreparingDeliveryModel? delivery,  PreparingPaymentModel? payment,  DateTime createdAt,  DateTime updatedAt,  bool isVariableWeight,  bool sample,  bool isSample)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreparingOrderModel() when $default != null:
return $default(_that.id,_that.orderCode,_that.buyerProfileId,_that.buyerBusinessName,_that.sellerProfileId,_that.sellerBusinessName,_that.addressName,_that.recipientName,_that.zipCode,_that.address,_that.addressDetail,_that.phone,_that.status,_that.totalAmount,_that.deliveryFee,_that.deliveryMethod,_that.productDeliveryMethods,_that.deliveryRequest,_that.rejectionReason,_that.rejectionReasonDetail,_that.items,_that.delivery,_that.payment,_that.createdAt,_that.updatedAt,_that.isVariableWeight,_that.sample,_that.isSample);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String orderCode,  int buyerProfileId,  String buyerBusinessName,  int sellerProfileId,  String sellerBusinessName,  String addressName,  String recipientName,  String zipCode,  String address,  String? addressDetail,  String phone,  String status,  int totalAmount,  int deliveryFee,  DeliveryMethod? deliveryMethod,  List<DeliveryMethod> productDeliveryMethods,  String? deliveryRequest,  String? rejectionReason,  String? rejectionReasonDetail,  List<PreparingOrderItemModel> items,  PreparingDeliveryModel? delivery,  PreparingPaymentModel? payment,  DateTime createdAt,  DateTime updatedAt,  bool isVariableWeight,  bool sample,  bool isSample)  $default,) {final _that = this;
switch (_that) {
case _PreparingOrderModel():
return $default(_that.id,_that.orderCode,_that.buyerProfileId,_that.buyerBusinessName,_that.sellerProfileId,_that.sellerBusinessName,_that.addressName,_that.recipientName,_that.zipCode,_that.address,_that.addressDetail,_that.phone,_that.status,_that.totalAmount,_that.deliveryFee,_that.deliveryMethod,_that.productDeliveryMethods,_that.deliveryRequest,_that.rejectionReason,_that.rejectionReasonDetail,_that.items,_that.delivery,_that.payment,_that.createdAt,_that.updatedAt,_that.isVariableWeight,_that.sample,_that.isSample);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String orderCode,  int buyerProfileId,  String buyerBusinessName,  int sellerProfileId,  String sellerBusinessName,  String addressName,  String recipientName,  String zipCode,  String address,  String? addressDetail,  String phone,  String status,  int totalAmount,  int deliveryFee,  DeliveryMethod? deliveryMethod,  List<DeliveryMethod> productDeliveryMethods,  String? deliveryRequest,  String? rejectionReason,  String? rejectionReasonDetail,  List<PreparingOrderItemModel> items,  PreparingDeliveryModel? delivery,  PreparingPaymentModel? payment,  DateTime createdAt,  DateTime updatedAt,  bool isVariableWeight,  bool sample,  bool isSample)?  $default,) {final _that = this;
switch (_that) {
case _PreparingOrderModel() when $default != null:
return $default(_that.id,_that.orderCode,_that.buyerProfileId,_that.buyerBusinessName,_that.sellerProfileId,_that.sellerBusinessName,_that.addressName,_that.recipientName,_that.zipCode,_that.address,_that.addressDetail,_that.phone,_that.status,_that.totalAmount,_that.deliveryFee,_that.deliveryMethod,_that.productDeliveryMethods,_that.deliveryRequest,_that.rejectionReason,_that.rejectionReasonDetail,_that.items,_that.delivery,_that.payment,_that.createdAt,_that.updatedAt,_that.isVariableWeight,_that.sample,_that.isSample);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreparingOrderModel implements PreparingOrderModel {
  const _PreparingOrderModel({required this.id, required this.orderCode, required this.buyerProfileId, required this.buyerBusinessName, required this.sellerProfileId, required this.sellerBusinessName, required this.addressName, required this.recipientName, required this.zipCode, required this.address, this.addressDetail, required this.phone, required this.status, required this.totalAmount, required this.deliveryFee, required this.deliveryMethod, required final  List<DeliveryMethod> productDeliveryMethods, this.deliveryRequest, this.rejectionReason, this.rejectionReasonDetail, required final  List<PreparingOrderItemModel> items, this.delivery, this.payment, required this.createdAt, required this.updatedAt, required this.isVariableWeight, this.sample = false, this.isSample = false}): _productDeliveryMethods = productDeliveryMethods,_items = items;
  factory _PreparingOrderModel.fromJson(Map<String, dynamic> json) => _$PreparingOrderModelFromJson(json);

@override final  int id;
@override final  String orderCode;
@override final  int buyerProfileId;
@override final  String buyerBusinessName;
@override final  int sellerProfileId;
@override final  String sellerBusinessName;
@override final  String addressName;
@override final  String recipientName;
@override final  String zipCode;
@override final  String address;
@override final  String? addressDetail;
@override final  String phone;
@override final  String status;
@override final  int totalAmount;
@override final  int deliveryFee;
@override final  DeliveryMethod? deliveryMethod;
 final  List<DeliveryMethod> _productDeliveryMethods;
@override List<DeliveryMethod> get productDeliveryMethods {
  if (_productDeliveryMethods is EqualUnmodifiableListView) return _productDeliveryMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productDeliveryMethods);
}

@override final  String? deliveryRequest;
@override final  String? rejectionReason;
@override final  String? rejectionReasonDetail;
 final  List<PreparingOrderItemModel> _items;
@override List<PreparingOrderItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  PreparingDeliveryModel? delivery;
@override final  PreparingPaymentModel? payment;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  bool isVariableWeight;
@override@JsonKey() final  bool sample;
@override@JsonKey() final  bool isSample;

/// Create a copy of PreparingOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparingOrderModelCopyWith<_PreparingOrderModel> get copyWith => __$PreparingOrderModelCopyWithImpl<_PreparingOrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreparingOrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparingOrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderCode, orderCode) || other.orderCode == orderCode)&&(identical(other.buyerProfileId, buyerProfileId) || other.buyerProfileId == buyerProfileId)&&(identical(other.buyerBusinessName, buyerBusinessName) || other.buyerBusinessName == buyerBusinessName)&&(identical(other.sellerProfileId, sellerProfileId) || other.sellerProfileId == sellerProfileId)&&(identical(other.sellerBusinessName, sellerBusinessName) || other.sellerBusinessName == sellerBusinessName)&&(identical(other.addressName, addressName) || other.addressName == addressName)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressDetail, addressDetail) || other.addressDetail == addressDetail)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&const DeepCollectionEquality().equals(other._productDeliveryMethods, _productDeliveryMethods)&&(identical(other.deliveryRequest, deliveryRequest) || other.deliveryRequest == deliveryRequest)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.rejectionReasonDetail, rejectionReasonDetail) || other.rejectionReasonDetail == rejectionReasonDetail)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isVariableWeight, isVariableWeight) || other.isVariableWeight == isVariableWeight)&&(identical(other.sample, sample) || other.sample == sample)&&(identical(other.isSample, isSample) || other.isSample == isSample));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,orderCode,buyerProfileId,buyerBusinessName,sellerProfileId,sellerBusinessName,addressName,recipientName,zipCode,address,addressDetail,phone,status,totalAmount,deliveryFee,deliveryMethod,const DeepCollectionEquality().hash(_productDeliveryMethods),deliveryRequest,rejectionReason,rejectionReasonDetail,const DeepCollectionEquality().hash(_items),delivery,payment,createdAt,updatedAt,isVariableWeight,sample,isSample]);

@override
String toString() {
  return 'PreparingOrderModel(id: $id, orderCode: $orderCode, buyerProfileId: $buyerProfileId, buyerBusinessName: $buyerBusinessName, sellerProfileId: $sellerProfileId, sellerBusinessName: $sellerBusinessName, addressName: $addressName, recipientName: $recipientName, zipCode: $zipCode, address: $address, addressDetail: $addressDetail, phone: $phone, status: $status, totalAmount: $totalAmount, deliveryFee: $deliveryFee, deliveryMethod: $deliveryMethod, productDeliveryMethods: $productDeliveryMethods, deliveryRequest: $deliveryRequest, rejectionReason: $rejectionReason, rejectionReasonDetail: $rejectionReasonDetail, items: $items, delivery: $delivery, payment: $payment, createdAt: $createdAt, updatedAt: $updatedAt, isVariableWeight: $isVariableWeight, sample: $sample, isSample: $isSample)';
}


}

/// @nodoc
abstract mixin class _$PreparingOrderModelCopyWith<$Res> implements $PreparingOrderModelCopyWith<$Res> {
  factory _$PreparingOrderModelCopyWith(_PreparingOrderModel value, $Res Function(_PreparingOrderModel) _then) = __$PreparingOrderModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String orderCode, int buyerProfileId, String buyerBusinessName, int sellerProfileId, String sellerBusinessName, String addressName, String recipientName, String zipCode, String address, String? addressDetail, String phone, String status, int totalAmount, int deliveryFee, DeliveryMethod? deliveryMethod, List<DeliveryMethod> productDeliveryMethods, String? deliveryRequest, String? rejectionReason, String? rejectionReasonDetail, List<PreparingOrderItemModel> items, PreparingDeliveryModel? delivery, PreparingPaymentModel? payment, DateTime createdAt, DateTime updatedAt, bool isVariableWeight, bool sample, bool isSample
});


@override $PreparingDeliveryModelCopyWith<$Res>? get delivery;@override $PreparingPaymentModelCopyWith<$Res>? get payment;

}
/// @nodoc
class __$PreparingOrderModelCopyWithImpl<$Res>
    implements _$PreparingOrderModelCopyWith<$Res> {
  __$PreparingOrderModelCopyWithImpl(this._self, this._then);

  final _PreparingOrderModel _self;
  final $Res Function(_PreparingOrderModel) _then;

/// Create a copy of PreparingOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderCode = null,Object? buyerProfileId = null,Object? buyerBusinessName = null,Object? sellerProfileId = null,Object? sellerBusinessName = null,Object? addressName = null,Object? recipientName = null,Object? zipCode = null,Object? address = null,Object? addressDetail = freezed,Object? phone = null,Object? status = null,Object? totalAmount = null,Object? deliveryFee = null,Object? deliveryMethod = freezed,Object? productDeliveryMethods = null,Object? deliveryRequest = freezed,Object? rejectionReason = freezed,Object? rejectionReasonDetail = freezed,Object? items = null,Object? delivery = freezed,Object? payment = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isVariableWeight = null,Object? sample = null,Object? isSample = null,}) {
  return _then(_PreparingOrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,buyerProfileId: null == buyerProfileId ? _self.buyerProfileId : buyerProfileId // ignore: cast_nullable_to_non_nullable
as int,buyerBusinessName: null == buyerBusinessName ? _self.buyerBusinessName : buyerBusinessName // ignore: cast_nullable_to_non_nullable
as String,sellerProfileId: null == sellerProfileId ? _self.sellerProfileId : sellerProfileId // ignore: cast_nullable_to_non_nullable
as int,sellerBusinessName: null == sellerBusinessName ? _self.sellerBusinessName : sellerBusinessName // ignore: cast_nullable_to_non_nullable
as String,addressName: null == addressName ? _self.addressName : addressName // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,zipCode: null == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,addressDetail: freezed == addressDetail ? _self.addressDetail : addressDetail // ignore: cast_nullable_to_non_nullable
as String?,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as int,deliveryMethod: freezed == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as DeliveryMethod?,productDeliveryMethods: null == productDeliveryMethods ? _self._productDeliveryMethods : productDeliveryMethods // ignore: cast_nullable_to_non_nullable
as List<DeliveryMethod>,deliveryRequest: freezed == deliveryRequest ? _self.deliveryRequest : deliveryRequest // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,rejectionReasonDetail: freezed == rejectionReasonDetail ? _self.rejectionReasonDetail : rejectionReasonDetail // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PreparingOrderItemModel>,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as PreparingDeliveryModel?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PreparingPaymentModel?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isVariableWeight: null == isVariableWeight ? _self.isVariableWeight : isVariableWeight // ignore: cast_nullable_to_non_nullable
as bool,sample: null == sample ? _self.sample : sample // ignore: cast_nullable_to_non_nullable
as bool,isSample: null == isSample ? _self.isSample : isSample // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PreparingOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreparingDeliveryModelCopyWith<$Res>? get delivery {
    if (_self.delivery == null) {
    return null;
  }

  return $PreparingDeliveryModelCopyWith<$Res>(_self.delivery!, (value) {
    return _then(_self.copyWith(delivery: value));
  });
}/// Create a copy of PreparingOrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreparingPaymentModelCopyWith<$Res>? get payment {
    if (_self.payment == null) {
    return null;
  }

  return $PreparingPaymentModelCopyWith<$Res>(_self.payment!, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// @nodoc
mixin _$PreparingOrderItemModel {

 int get id; int get productId; String get productName; int? get productOptionId; String? get optionName; int get unitPrice; int get quantity; int get totalPrice; double? get orderedCapacity; String? get orderedCapacityUnit; double? get actualCapacity; double? get weightRefundAmount; bool get isTaxable;
/// Create a copy of PreparingOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreparingOrderItemModelCopyWith<PreparingOrderItemModel> get copyWith => _$PreparingOrderItemModelCopyWithImpl<PreparingOrderItemModel>(this as PreparingOrderItemModel, _$identity);

  /// Serializes this PreparingOrderItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparingOrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productOptionId, productOptionId) || other.productOptionId == productOptionId)&&(identical(other.optionName, optionName) || other.optionName == optionName)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.orderedCapacity, orderedCapacity) || other.orderedCapacity == orderedCapacity)&&(identical(other.orderedCapacityUnit, orderedCapacityUnit) || other.orderedCapacityUnit == orderedCapacityUnit)&&(identical(other.actualCapacity, actualCapacity) || other.actualCapacity == actualCapacity)&&(identical(other.weightRefundAmount, weightRefundAmount) || other.weightRefundAmount == weightRefundAmount)&&(identical(other.isTaxable, isTaxable) || other.isTaxable == isTaxable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,productOptionId,optionName,unitPrice,quantity,totalPrice,orderedCapacity,orderedCapacityUnit,actualCapacity,weightRefundAmount,isTaxable);

@override
String toString() {
  return 'PreparingOrderItemModel(id: $id, productId: $productId, productName: $productName, productOptionId: $productOptionId, optionName: $optionName, unitPrice: $unitPrice, quantity: $quantity, totalPrice: $totalPrice, orderedCapacity: $orderedCapacity, orderedCapacityUnit: $orderedCapacityUnit, actualCapacity: $actualCapacity, weightRefundAmount: $weightRefundAmount, isTaxable: $isTaxable)';
}


}

/// @nodoc
abstract mixin class $PreparingOrderItemModelCopyWith<$Res>  {
  factory $PreparingOrderItemModelCopyWith(PreparingOrderItemModel value, $Res Function(PreparingOrderItemModel) _then) = _$PreparingOrderItemModelCopyWithImpl;
@useResult
$Res call({
 int id, int productId, String productName, int? productOptionId, String? optionName, int unitPrice, int quantity, int totalPrice, double? orderedCapacity, String? orderedCapacityUnit, double? actualCapacity, double? weightRefundAmount, bool isTaxable
});




}
/// @nodoc
class _$PreparingOrderItemModelCopyWithImpl<$Res>
    implements $PreparingOrderItemModelCopyWith<$Res> {
  _$PreparingOrderItemModelCopyWithImpl(this._self, this._then);

  final PreparingOrderItemModel _self;
  final $Res Function(PreparingOrderItemModel) _then;

/// Create a copy of PreparingOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? productOptionId = freezed,Object? optionName = freezed,Object? unitPrice = null,Object? quantity = null,Object? totalPrice = null,Object? orderedCapacity = freezed,Object? orderedCapacityUnit = freezed,Object? actualCapacity = freezed,Object? weightRefundAmount = freezed,Object? isTaxable = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productOptionId: freezed == productOptionId ? _self.productOptionId : productOptionId // ignore: cast_nullable_to_non_nullable
as int?,optionName: freezed == optionName ? _self.optionName : optionName // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,orderedCapacity: freezed == orderedCapacity ? _self.orderedCapacity : orderedCapacity // ignore: cast_nullable_to_non_nullable
as double?,orderedCapacityUnit: freezed == orderedCapacityUnit ? _self.orderedCapacityUnit : orderedCapacityUnit // ignore: cast_nullable_to_non_nullable
as String?,actualCapacity: freezed == actualCapacity ? _self.actualCapacity : actualCapacity // ignore: cast_nullable_to_non_nullable
as double?,weightRefundAmount: freezed == weightRefundAmount ? _self.weightRefundAmount : weightRefundAmount // ignore: cast_nullable_to_non_nullable
as double?,isTaxable: null == isTaxable ? _self.isTaxable : isTaxable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PreparingOrderItemModel].
extension PreparingOrderItemModelPatterns on PreparingOrderItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreparingOrderItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreparingOrderItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreparingOrderItemModel value)  $default,){
final _that = this;
switch (_that) {
case _PreparingOrderItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreparingOrderItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _PreparingOrderItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int productId,  String productName,  int? productOptionId,  String? optionName,  int unitPrice,  int quantity,  int totalPrice,  double? orderedCapacity,  String? orderedCapacityUnit,  double? actualCapacity,  double? weightRefundAmount,  bool isTaxable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreparingOrderItemModel() when $default != null:
return $default(_that.id,_that.productId,_that.productName,_that.productOptionId,_that.optionName,_that.unitPrice,_that.quantity,_that.totalPrice,_that.orderedCapacity,_that.orderedCapacityUnit,_that.actualCapacity,_that.weightRefundAmount,_that.isTaxable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int productId,  String productName,  int? productOptionId,  String? optionName,  int unitPrice,  int quantity,  int totalPrice,  double? orderedCapacity,  String? orderedCapacityUnit,  double? actualCapacity,  double? weightRefundAmount,  bool isTaxable)  $default,) {final _that = this;
switch (_that) {
case _PreparingOrderItemModel():
return $default(_that.id,_that.productId,_that.productName,_that.productOptionId,_that.optionName,_that.unitPrice,_that.quantity,_that.totalPrice,_that.orderedCapacity,_that.orderedCapacityUnit,_that.actualCapacity,_that.weightRefundAmount,_that.isTaxable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int productId,  String productName,  int? productOptionId,  String? optionName,  int unitPrice,  int quantity,  int totalPrice,  double? orderedCapacity,  String? orderedCapacityUnit,  double? actualCapacity,  double? weightRefundAmount,  bool isTaxable)?  $default,) {final _that = this;
switch (_that) {
case _PreparingOrderItemModel() when $default != null:
return $default(_that.id,_that.productId,_that.productName,_that.productOptionId,_that.optionName,_that.unitPrice,_that.quantity,_that.totalPrice,_that.orderedCapacity,_that.orderedCapacityUnit,_that.actualCapacity,_that.weightRefundAmount,_that.isTaxable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreparingOrderItemModel implements PreparingOrderItemModel {
  const _PreparingOrderItemModel({required this.id, required this.productId, required this.productName, this.productOptionId, this.optionName, required this.unitPrice, required this.quantity, required this.totalPrice, this.orderedCapacity, this.orderedCapacityUnit, this.actualCapacity, this.weightRefundAmount, required this.isTaxable});
  factory _PreparingOrderItemModel.fromJson(Map<String, dynamic> json) => _$PreparingOrderItemModelFromJson(json);

@override final  int id;
@override final  int productId;
@override final  String productName;
@override final  int? productOptionId;
@override final  String? optionName;
@override final  int unitPrice;
@override final  int quantity;
@override final  int totalPrice;
@override final  double? orderedCapacity;
@override final  String? orderedCapacityUnit;
@override final  double? actualCapacity;
@override final  double? weightRefundAmount;
@override final  bool isTaxable;

/// Create a copy of PreparingOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparingOrderItemModelCopyWith<_PreparingOrderItemModel> get copyWith => __$PreparingOrderItemModelCopyWithImpl<_PreparingOrderItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreparingOrderItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparingOrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.productOptionId, productOptionId) || other.productOptionId == productOptionId)&&(identical(other.optionName, optionName) || other.optionName == optionName)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.orderedCapacity, orderedCapacity) || other.orderedCapacity == orderedCapacity)&&(identical(other.orderedCapacityUnit, orderedCapacityUnit) || other.orderedCapacityUnit == orderedCapacityUnit)&&(identical(other.actualCapacity, actualCapacity) || other.actualCapacity == actualCapacity)&&(identical(other.weightRefundAmount, weightRefundAmount) || other.weightRefundAmount == weightRefundAmount)&&(identical(other.isTaxable, isTaxable) || other.isTaxable == isTaxable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,productOptionId,optionName,unitPrice,quantity,totalPrice,orderedCapacity,orderedCapacityUnit,actualCapacity,weightRefundAmount,isTaxable);

@override
String toString() {
  return 'PreparingOrderItemModel(id: $id, productId: $productId, productName: $productName, productOptionId: $productOptionId, optionName: $optionName, unitPrice: $unitPrice, quantity: $quantity, totalPrice: $totalPrice, orderedCapacity: $orderedCapacity, orderedCapacityUnit: $orderedCapacityUnit, actualCapacity: $actualCapacity, weightRefundAmount: $weightRefundAmount, isTaxable: $isTaxable)';
}


}

/// @nodoc
abstract mixin class _$PreparingOrderItemModelCopyWith<$Res> implements $PreparingOrderItemModelCopyWith<$Res> {
  factory _$PreparingOrderItemModelCopyWith(_PreparingOrderItemModel value, $Res Function(_PreparingOrderItemModel) _then) = __$PreparingOrderItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int productId, String productName, int? productOptionId, String? optionName, int unitPrice, int quantity, int totalPrice, double? orderedCapacity, String? orderedCapacityUnit, double? actualCapacity, double? weightRefundAmount, bool isTaxable
});




}
/// @nodoc
class __$PreparingOrderItemModelCopyWithImpl<$Res>
    implements _$PreparingOrderItemModelCopyWith<$Res> {
  __$PreparingOrderItemModelCopyWithImpl(this._self, this._then);

  final _PreparingOrderItemModel _self;
  final $Res Function(_PreparingOrderItemModel) _then;

/// Create a copy of PreparingOrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? productOptionId = freezed,Object? optionName = freezed,Object? unitPrice = null,Object? quantity = null,Object? totalPrice = null,Object? orderedCapacity = freezed,Object? orderedCapacityUnit = freezed,Object? actualCapacity = freezed,Object? weightRefundAmount = freezed,Object? isTaxable = null,}) {
  return _then(_PreparingOrderItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,productOptionId: freezed == productOptionId ? _self.productOptionId : productOptionId // ignore: cast_nullable_to_non_nullable
as int?,optionName: freezed == optionName ? _self.optionName : optionName // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,orderedCapacity: freezed == orderedCapacity ? _self.orderedCapacity : orderedCapacity // ignore: cast_nullable_to_non_nullable
as double?,orderedCapacityUnit: freezed == orderedCapacityUnit ? _self.orderedCapacityUnit : orderedCapacityUnit // ignore: cast_nullable_to_non_nullable
as String?,actualCapacity: freezed == actualCapacity ? _self.actualCapacity : actualCapacity // ignore: cast_nullable_to_non_nullable
as double?,weightRefundAmount: freezed == weightRefundAmount ? _self.weightRefundAmount : weightRefundAmount // ignore: cast_nullable_to_non_nullable
as double?,isTaxable: null == isTaxable ? _self.isTaxable : isTaxable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PreparingDeliveryModel {

 OrderStatus? get status; String get courierCode; String get courierName; String get trackingNumber; DateTime? get shippedAt; DateTime? get deliveredAt;
/// Create a copy of PreparingDeliveryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreparingDeliveryModelCopyWith<PreparingDeliveryModel> get copyWith => _$PreparingDeliveryModelCopyWithImpl<PreparingDeliveryModel>(this as PreparingDeliveryModel, _$identity);

  /// Serializes this PreparingDeliveryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparingDeliveryModel&&(identical(other.status, status) || other.status == status)&&(identical(other.courierCode, courierCode) || other.courierCode == courierCode)&&(identical(other.courierName, courierName) || other.courierName == courierName)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.shippedAt, shippedAt) || other.shippedAt == shippedAt)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,courierCode,courierName,trackingNumber,shippedAt,deliveredAt);

@override
String toString() {
  return 'PreparingDeliveryModel(status: $status, courierCode: $courierCode, courierName: $courierName, trackingNumber: $trackingNumber, shippedAt: $shippedAt, deliveredAt: $deliveredAt)';
}


}

/// @nodoc
abstract mixin class $PreparingDeliveryModelCopyWith<$Res>  {
  factory $PreparingDeliveryModelCopyWith(PreparingDeliveryModel value, $Res Function(PreparingDeliveryModel) _then) = _$PreparingDeliveryModelCopyWithImpl;
@useResult
$Res call({
 OrderStatus? status, String courierCode, String courierName, String trackingNumber, DateTime? shippedAt, DateTime? deliveredAt
});




}
/// @nodoc
class _$PreparingDeliveryModelCopyWithImpl<$Res>
    implements $PreparingDeliveryModelCopyWith<$Res> {
  _$PreparingDeliveryModelCopyWithImpl(this._self, this._then);

  final PreparingDeliveryModel _self;
  final $Res Function(PreparingDeliveryModel) _then;

/// Create a copy of PreparingDeliveryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? courierCode = null,Object? courierName = null,Object? trackingNumber = null,Object? shippedAt = freezed,Object? deliveredAt = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus?,courierCode: null == courierCode ? _self.courierCode : courierCode // ignore: cast_nullable_to_non_nullable
as String,courierName: null == courierName ? _self.courierName : courierName // ignore: cast_nullable_to_non_nullable
as String,trackingNumber: null == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String,shippedAt: freezed == shippedAt ? _self.shippedAt : shippedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PreparingDeliveryModel].
extension PreparingDeliveryModelPatterns on PreparingDeliveryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreparingDeliveryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreparingDeliveryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreparingDeliveryModel value)  $default,){
final _that = this;
switch (_that) {
case _PreparingDeliveryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreparingDeliveryModel value)?  $default,){
final _that = this;
switch (_that) {
case _PreparingDeliveryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderStatus? status,  String courierCode,  String courierName,  String trackingNumber,  DateTime? shippedAt,  DateTime? deliveredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreparingDeliveryModel() when $default != null:
return $default(_that.status,_that.courierCode,_that.courierName,_that.trackingNumber,_that.shippedAt,_that.deliveredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderStatus? status,  String courierCode,  String courierName,  String trackingNumber,  DateTime? shippedAt,  DateTime? deliveredAt)  $default,) {final _that = this;
switch (_that) {
case _PreparingDeliveryModel():
return $default(_that.status,_that.courierCode,_that.courierName,_that.trackingNumber,_that.shippedAt,_that.deliveredAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderStatus? status,  String courierCode,  String courierName,  String trackingNumber,  DateTime? shippedAt,  DateTime? deliveredAt)?  $default,) {final _that = this;
switch (_that) {
case _PreparingDeliveryModel() when $default != null:
return $default(_that.status,_that.courierCode,_that.courierName,_that.trackingNumber,_that.shippedAt,_that.deliveredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreparingDeliveryModel implements PreparingDeliveryModel {
  const _PreparingDeliveryModel({this.status = OrderStatus.CONFIRMED, this.courierCode = '', this.courierName = '', this.trackingNumber = '', this.shippedAt, this.deliveredAt});
  factory _PreparingDeliveryModel.fromJson(Map<String, dynamic> json) => _$PreparingDeliveryModelFromJson(json);

@override@JsonKey() final  OrderStatus? status;
@override@JsonKey() final  String courierCode;
@override@JsonKey() final  String courierName;
@override@JsonKey() final  String trackingNumber;
@override final  DateTime? shippedAt;
@override final  DateTime? deliveredAt;

/// Create a copy of PreparingDeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparingDeliveryModelCopyWith<_PreparingDeliveryModel> get copyWith => __$PreparingDeliveryModelCopyWithImpl<_PreparingDeliveryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreparingDeliveryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparingDeliveryModel&&(identical(other.status, status) || other.status == status)&&(identical(other.courierCode, courierCode) || other.courierCode == courierCode)&&(identical(other.courierName, courierName) || other.courierName == courierName)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.shippedAt, shippedAt) || other.shippedAt == shippedAt)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,courierCode,courierName,trackingNumber,shippedAt,deliveredAt);

@override
String toString() {
  return 'PreparingDeliveryModel(status: $status, courierCode: $courierCode, courierName: $courierName, trackingNumber: $trackingNumber, shippedAt: $shippedAt, deliveredAt: $deliveredAt)';
}


}

/// @nodoc
abstract mixin class _$PreparingDeliveryModelCopyWith<$Res> implements $PreparingDeliveryModelCopyWith<$Res> {
  factory _$PreparingDeliveryModelCopyWith(_PreparingDeliveryModel value, $Res Function(_PreparingDeliveryModel) _then) = __$PreparingDeliveryModelCopyWithImpl;
@override @useResult
$Res call({
 OrderStatus? status, String courierCode, String courierName, String trackingNumber, DateTime? shippedAt, DateTime? deliveredAt
});




}
/// @nodoc
class __$PreparingDeliveryModelCopyWithImpl<$Res>
    implements _$PreparingDeliveryModelCopyWith<$Res> {
  __$PreparingDeliveryModelCopyWithImpl(this._self, this._then);

  final _PreparingDeliveryModel _self;
  final $Res Function(_PreparingDeliveryModel) _then;

/// Create a copy of PreparingDeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? courierCode = null,Object? courierName = null,Object? trackingNumber = null,Object? shippedAt = freezed,Object? deliveredAt = freezed,}) {
  return _then(_PreparingDeliveryModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus?,courierCode: null == courierCode ? _self.courierCode : courierCode // ignore: cast_nullable_to_non_nullable
as String,courierName: null == courierName ? _self.courierName : courierName // ignore: cast_nullable_to_non_nullable
as String,trackingNumber: null == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String,shippedAt: freezed == shippedAt ? _self.shippedAt : shippedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$PreparingPaymentModel {

 String get paymentCode; String get paymentMethod; String get status; DateTime? get paidAt; num get cancelledAmount; num get netAmount; String? get receiptUrl; String? get approvalNumber; String? get vbankNumber; String? get vbankName; DateTime? get vbankExpDate; String? get vbankHolder;
/// Create a copy of PreparingPaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreparingPaymentModelCopyWith<PreparingPaymentModel> get copyWith => _$PreparingPaymentModelCopyWithImpl<PreparingPaymentModel>(this as PreparingPaymentModel, _$identity);

  /// Serializes this PreparingPaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreparingPaymentModel&&(identical(other.paymentCode, paymentCode) || other.paymentCode == paymentCode)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.cancelledAmount, cancelledAmount) || other.cancelledAmount == cancelledAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount)&&(identical(other.receiptUrl, receiptUrl) || other.receiptUrl == receiptUrl)&&(identical(other.approvalNumber, approvalNumber) || other.approvalNumber == approvalNumber)&&(identical(other.vbankNumber, vbankNumber) || other.vbankNumber == vbankNumber)&&(identical(other.vbankName, vbankName) || other.vbankName == vbankName)&&(identical(other.vbankExpDate, vbankExpDate) || other.vbankExpDate == vbankExpDate)&&(identical(other.vbankHolder, vbankHolder) || other.vbankHolder == vbankHolder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentCode,paymentMethod,status,paidAt,cancelledAmount,netAmount,receiptUrl,approvalNumber,vbankNumber,vbankName,vbankExpDate,vbankHolder);

@override
String toString() {
  return 'PreparingPaymentModel(paymentCode: $paymentCode, paymentMethod: $paymentMethod, status: $status, paidAt: $paidAt, cancelledAmount: $cancelledAmount, netAmount: $netAmount, receiptUrl: $receiptUrl, approvalNumber: $approvalNumber, vbankNumber: $vbankNumber, vbankName: $vbankName, vbankExpDate: $vbankExpDate, vbankHolder: $vbankHolder)';
}


}

/// @nodoc
abstract mixin class $PreparingPaymentModelCopyWith<$Res>  {
  factory $PreparingPaymentModelCopyWith(PreparingPaymentModel value, $Res Function(PreparingPaymentModel) _then) = _$PreparingPaymentModelCopyWithImpl;
@useResult
$Res call({
 String paymentCode, String paymentMethod, String status, DateTime? paidAt, num cancelledAmount, num netAmount, String? receiptUrl, String? approvalNumber, String? vbankNumber, String? vbankName, DateTime? vbankExpDate, String? vbankHolder
});




}
/// @nodoc
class _$PreparingPaymentModelCopyWithImpl<$Res>
    implements $PreparingPaymentModelCopyWith<$Res> {
  _$PreparingPaymentModelCopyWithImpl(this._self, this._then);

  final PreparingPaymentModel _self;
  final $Res Function(PreparingPaymentModel) _then;

/// Create a copy of PreparingPaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentCode = null,Object? paymentMethod = null,Object? status = null,Object? paidAt = freezed,Object? cancelledAmount = null,Object? netAmount = null,Object? receiptUrl = freezed,Object? approvalNumber = freezed,Object? vbankNumber = freezed,Object? vbankName = freezed,Object? vbankExpDate = freezed,Object? vbankHolder = freezed,}) {
  return _then(_self.copyWith(
paymentCode: null == paymentCode ? _self.paymentCode : paymentCode // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAmount: null == cancelledAmount ? _self.cancelledAmount : cancelledAmount // ignore: cast_nullable_to_non_nullable
as num,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as num,receiptUrl: freezed == receiptUrl ? _self.receiptUrl : receiptUrl // ignore: cast_nullable_to_non_nullable
as String?,approvalNumber: freezed == approvalNumber ? _self.approvalNumber : approvalNumber // ignore: cast_nullable_to_non_nullable
as String?,vbankNumber: freezed == vbankNumber ? _self.vbankNumber : vbankNumber // ignore: cast_nullable_to_non_nullable
as String?,vbankName: freezed == vbankName ? _self.vbankName : vbankName // ignore: cast_nullable_to_non_nullable
as String?,vbankExpDate: freezed == vbankExpDate ? _self.vbankExpDate : vbankExpDate // ignore: cast_nullable_to_non_nullable
as DateTime?,vbankHolder: freezed == vbankHolder ? _self.vbankHolder : vbankHolder // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PreparingPaymentModel].
extension PreparingPaymentModelPatterns on PreparingPaymentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreparingPaymentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreparingPaymentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreparingPaymentModel value)  $default,){
final _that = this;
switch (_that) {
case _PreparingPaymentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreparingPaymentModel value)?  $default,){
final _that = this;
switch (_that) {
case _PreparingPaymentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String paymentCode,  String paymentMethod,  String status,  DateTime? paidAt,  num cancelledAmount,  num netAmount,  String? receiptUrl,  String? approvalNumber,  String? vbankNumber,  String? vbankName,  DateTime? vbankExpDate,  String? vbankHolder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreparingPaymentModel() when $default != null:
return $default(_that.paymentCode,_that.paymentMethod,_that.status,_that.paidAt,_that.cancelledAmount,_that.netAmount,_that.receiptUrl,_that.approvalNumber,_that.vbankNumber,_that.vbankName,_that.vbankExpDate,_that.vbankHolder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String paymentCode,  String paymentMethod,  String status,  DateTime? paidAt,  num cancelledAmount,  num netAmount,  String? receiptUrl,  String? approvalNumber,  String? vbankNumber,  String? vbankName,  DateTime? vbankExpDate,  String? vbankHolder)  $default,) {final _that = this;
switch (_that) {
case _PreparingPaymentModel():
return $default(_that.paymentCode,_that.paymentMethod,_that.status,_that.paidAt,_that.cancelledAmount,_that.netAmount,_that.receiptUrl,_that.approvalNumber,_that.vbankNumber,_that.vbankName,_that.vbankExpDate,_that.vbankHolder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String paymentCode,  String paymentMethod,  String status,  DateTime? paidAt,  num cancelledAmount,  num netAmount,  String? receiptUrl,  String? approvalNumber,  String? vbankNumber,  String? vbankName,  DateTime? vbankExpDate,  String? vbankHolder)?  $default,) {final _that = this;
switch (_that) {
case _PreparingPaymentModel() when $default != null:
return $default(_that.paymentCode,_that.paymentMethod,_that.status,_that.paidAt,_that.cancelledAmount,_that.netAmount,_that.receiptUrl,_that.approvalNumber,_that.vbankNumber,_that.vbankName,_that.vbankExpDate,_that.vbankHolder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreparingPaymentModel implements PreparingPaymentModel {
  const _PreparingPaymentModel({this.paymentCode = '', this.paymentMethod = '', this.status = '', this.paidAt, this.cancelledAmount = 0, this.netAmount = 0, this.receiptUrl, this.approvalNumber, this.vbankNumber, this.vbankName, this.vbankExpDate, this.vbankHolder});
  factory _PreparingPaymentModel.fromJson(Map<String, dynamic> json) => _$PreparingPaymentModelFromJson(json);

@override@JsonKey() final  String paymentCode;
@override@JsonKey() final  String paymentMethod;
@override@JsonKey() final  String status;
@override final  DateTime? paidAt;
@override@JsonKey() final  num cancelledAmount;
@override@JsonKey() final  num netAmount;
@override final  String? receiptUrl;
@override final  String? approvalNumber;
@override final  String? vbankNumber;
@override final  String? vbankName;
@override final  DateTime? vbankExpDate;
@override final  String? vbankHolder;

/// Create a copy of PreparingPaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparingPaymentModelCopyWith<_PreparingPaymentModel> get copyWith => __$PreparingPaymentModelCopyWithImpl<_PreparingPaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreparingPaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreparingPaymentModel&&(identical(other.paymentCode, paymentCode) || other.paymentCode == paymentCode)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.status, status) || other.status == status)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.cancelledAmount, cancelledAmount) || other.cancelledAmount == cancelledAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount)&&(identical(other.receiptUrl, receiptUrl) || other.receiptUrl == receiptUrl)&&(identical(other.approvalNumber, approvalNumber) || other.approvalNumber == approvalNumber)&&(identical(other.vbankNumber, vbankNumber) || other.vbankNumber == vbankNumber)&&(identical(other.vbankName, vbankName) || other.vbankName == vbankName)&&(identical(other.vbankExpDate, vbankExpDate) || other.vbankExpDate == vbankExpDate)&&(identical(other.vbankHolder, vbankHolder) || other.vbankHolder == vbankHolder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentCode,paymentMethod,status,paidAt,cancelledAmount,netAmount,receiptUrl,approvalNumber,vbankNumber,vbankName,vbankExpDate,vbankHolder);

@override
String toString() {
  return 'PreparingPaymentModel(paymentCode: $paymentCode, paymentMethod: $paymentMethod, status: $status, paidAt: $paidAt, cancelledAmount: $cancelledAmount, netAmount: $netAmount, receiptUrl: $receiptUrl, approvalNumber: $approvalNumber, vbankNumber: $vbankNumber, vbankName: $vbankName, vbankExpDate: $vbankExpDate, vbankHolder: $vbankHolder)';
}


}

/// @nodoc
abstract mixin class _$PreparingPaymentModelCopyWith<$Res> implements $PreparingPaymentModelCopyWith<$Res> {
  factory _$PreparingPaymentModelCopyWith(_PreparingPaymentModel value, $Res Function(_PreparingPaymentModel) _then) = __$PreparingPaymentModelCopyWithImpl;
@override @useResult
$Res call({
 String paymentCode, String paymentMethod, String status, DateTime? paidAt, num cancelledAmount, num netAmount, String? receiptUrl, String? approvalNumber, String? vbankNumber, String? vbankName, DateTime? vbankExpDate, String? vbankHolder
});




}
/// @nodoc
class __$PreparingPaymentModelCopyWithImpl<$Res>
    implements _$PreparingPaymentModelCopyWith<$Res> {
  __$PreparingPaymentModelCopyWithImpl(this._self, this._then);

  final _PreparingPaymentModel _self;
  final $Res Function(_PreparingPaymentModel) _then;

/// Create a copy of PreparingPaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentCode = null,Object? paymentMethod = null,Object? status = null,Object? paidAt = freezed,Object? cancelledAmount = null,Object? netAmount = null,Object? receiptUrl = freezed,Object? approvalNumber = freezed,Object? vbankNumber = freezed,Object? vbankName = freezed,Object? vbankExpDate = freezed,Object? vbankHolder = freezed,}) {
  return _then(_PreparingPaymentModel(
paymentCode: null == paymentCode ? _self.paymentCode : paymentCode // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAmount: null == cancelledAmount ? _self.cancelledAmount : cancelledAmount // ignore: cast_nullable_to_non_nullable
as num,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as num,receiptUrl: freezed == receiptUrl ? _self.receiptUrl : receiptUrl // ignore: cast_nullable_to_non_nullable
as String?,approvalNumber: freezed == approvalNumber ? _self.approvalNumber : approvalNumber // ignore: cast_nullable_to_non_nullable
as String?,vbankNumber: freezed == vbankNumber ? _self.vbankNumber : vbankNumber // ignore: cast_nullable_to_non_nullable
as String?,vbankName: freezed == vbankName ? _self.vbankName : vbankName // ignore: cast_nullable_to_non_nullable
as String?,vbankExpDate: freezed == vbankExpDate ? _self.vbankExpDate : vbankExpDate // ignore: cast_nullable_to_non_nullable
as DateTime?,vbankHolder: freezed == vbankHolder ? _self.vbankHolder : vbankHolder // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
