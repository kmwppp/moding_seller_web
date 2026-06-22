// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dash_delivery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashDeliveryState {

 bool get isLoading; String get orderCode; String get orderStatus; String get orderDate; String get recipientName; String get address; String get phone; List<PreparingOrderItemModel> get items; String get deliveryRequest; bool get isVariableWeight; DeliveryMethod? get deliveryMethod; List<DeliveryMethod> get deliveryMethodList; List<DeliveryExecuteTab> get availableDeliveryTabs; DeliveryExecuteTab get selectedDeliveryTab; CarrierModel? get courierCompany; List<CarrierModel> get courierCompanyList; String get invoice; bool get isTrackingValidated; String get trackingValidationMessage; HanjinServiceCategory? get hanjinServiceCategory; HanjinBoxType? get hanjinBoxType; HanjinPayType? get hanjinPayType; PreparingDeliveryModel? get delivery; PreparingPaymentModel? get payment;
/// Create a copy of DashDeliveryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashDeliveryStateCopyWith<DashDeliveryState> get copyWith => _$DashDeliveryStateCopyWithImpl<DashDeliveryState>(this as DashDeliveryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashDeliveryState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.orderCode, orderCode) || other.orderCode == orderCode)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&(identical(other.orderDate, orderDate) || other.orderDate == orderDate)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.deliveryRequest, deliveryRequest) || other.deliveryRequest == deliveryRequest)&&(identical(other.isVariableWeight, isVariableWeight) || other.isVariableWeight == isVariableWeight)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&const DeepCollectionEquality().equals(other.deliveryMethodList, deliveryMethodList)&&const DeepCollectionEquality().equals(other.availableDeliveryTabs, availableDeliveryTabs)&&(identical(other.selectedDeliveryTab, selectedDeliveryTab) || other.selectedDeliveryTab == selectedDeliveryTab)&&(identical(other.courierCompany, courierCompany) || other.courierCompany == courierCompany)&&const DeepCollectionEquality().equals(other.courierCompanyList, courierCompanyList)&&(identical(other.invoice, invoice) || other.invoice == invoice)&&(identical(other.isTrackingValidated, isTrackingValidated) || other.isTrackingValidated == isTrackingValidated)&&(identical(other.trackingValidationMessage, trackingValidationMessage) || other.trackingValidationMessage == trackingValidationMessage)&&(identical(other.hanjinServiceCategory, hanjinServiceCategory) || other.hanjinServiceCategory == hanjinServiceCategory)&&(identical(other.hanjinBoxType, hanjinBoxType) || other.hanjinBoxType == hanjinBoxType)&&(identical(other.hanjinPayType, hanjinPayType) || other.hanjinPayType == hanjinPayType)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.payment, payment) || other.payment == payment));
}


@override
int get hashCode => Object.hashAll([runtimeType,isLoading,orderCode,orderStatus,orderDate,recipientName,address,phone,const DeepCollectionEquality().hash(items),deliveryRequest,isVariableWeight,deliveryMethod,const DeepCollectionEquality().hash(deliveryMethodList),const DeepCollectionEquality().hash(availableDeliveryTabs),selectedDeliveryTab,courierCompany,const DeepCollectionEquality().hash(courierCompanyList),invoice,isTrackingValidated,trackingValidationMessage,hanjinServiceCategory,hanjinBoxType,hanjinPayType,delivery,payment]);

@override
String toString() {
  return 'DashDeliveryState(isLoading: $isLoading, orderCode: $orderCode, orderStatus: $orderStatus, orderDate: $orderDate, recipientName: $recipientName, address: $address, phone: $phone, items: $items, deliveryRequest: $deliveryRequest, isVariableWeight: $isVariableWeight, deliveryMethod: $deliveryMethod, deliveryMethodList: $deliveryMethodList, availableDeliveryTabs: $availableDeliveryTabs, selectedDeliveryTab: $selectedDeliveryTab, courierCompany: $courierCompany, courierCompanyList: $courierCompanyList, invoice: $invoice, isTrackingValidated: $isTrackingValidated, trackingValidationMessage: $trackingValidationMessage, hanjinServiceCategory: $hanjinServiceCategory, hanjinBoxType: $hanjinBoxType, hanjinPayType: $hanjinPayType, delivery: $delivery, payment: $payment)';
}


}

/// @nodoc
abstract mixin class $DashDeliveryStateCopyWith<$Res>  {
  factory $DashDeliveryStateCopyWith(DashDeliveryState value, $Res Function(DashDeliveryState) _then) = _$DashDeliveryStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, String orderCode, String orderStatus, String orderDate, String recipientName, String address, String phone, List<PreparingOrderItemModel> items, String deliveryRequest, bool isVariableWeight, DeliveryMethod? deliveryMethod, List<DeliveryMethod> deliveryMethodList, List<DeliveryExecuteTab> availableDeliveryTabs, DeliveryExecuteTab selectedDeliveryTab, CarrierModel? courierCompany, List<CarrierModel> courierCompanyList, String invoice, bool isTrackingValidated, String trackingValidationMessage, HanjinServiceCategory? hanjinServiceCategory, HanjinBoxType? hanjinBoxType, HanjinPayType? hanjinPayType, PreparingDeliveryModel? delivery, PreparingPaymentModel? payment
});


$CarrierModelCopyWith<$Res>? get courierCompany;$PreparingDeliveryModelCopyWith<$Res>? get delivery;$PreparingPaymentModelCopyWith<$Res>? get payment;

}
/// @nodoc
class _$DashDeliveryStateCopyWithImpl<$Res>
    implements $DashDeliveryStateCopyWith<$Res> {
  _$DashDeliveryStateCopyWithImpl(this._self, this._then);

  final DashDeliveryState _self;
  final $Res Function(DashDeliveryState) _then;

/// Create a copy of DashDeliveryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? orderCode = null,Object? orderStatus = null,Object? orderDate = null,Object? recipientName = null,Object? address = null,Object? phone = null,Object? items = null,Object? deliveryRequest = null,Object? isVariableWeight = null,Object? deliveryMethod = freezed,Object? deliveryMethodList = null,Object? availableDeliveryTabs = null,Object? selectedDeliveryTab = null,Object? courierCompany = freezed,Object? courierCompanyList = null,Object? invoice = null,Object? isTrackingValidated = null,Object? trackingValidationMessage = null,Object? hanjinServiceCategory = freezed,Object? hanjinBoxType = freezed,Object? hanjinPayType = freezed,Object? delivery = freezed,Object? payment = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,orderStatus: null == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String,orderDate: null == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PreparingOrderItemModel>,deliveryRequest: null == deliveryRequest ? _self.deliveryRequest : deliveryRequest // ignore: cast_nullable_to_non_nullable
as String,isVariableWeight: null == isVariableWeight ? _self.isVariableWeight : isVariableWeight // ignore: cast_nullable_to_non_nullable
as bool,deliveryMethod: freezed == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as DeliveryMethod?,deliveryMethodList: null == deliveryMethodList ? _self.deliveryMethodList : deliveryMethodList // ignore: cast_nullable_to_non_nullable
as List<DeliveryMethod>,availableDeliveryTabs: null == availableDeliveryTabs ? _self.availableDeliveryTabs : availableDeliveryTabs // ignore: cast_nullable_to_non_nullable
as List<DeliveryExecuteTab>,selectedDeliveryTab: null == selectedDeliveryTab ? _self.selectedDeliveryTab : selectedDeliveryTab // ignore: cast_nullable_to_non_nullable
as DeliveryExecuteTab,courierCompany: freezed == courierCompany ? _self.courierCompany : courierCompany // ignore: cast_nullable_to_non_nullable
as CarrierModel?,courierCompanyList: null == courierCompanyList ? _self.courierCompanyList : courierCompanyList // ignore: cast_nullable_to_non_nullable
as List<CarrierModel>,invoice: null == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as String,isTrackingValidated: null == isTrackingValidated ? _self.isTrackingValidated : isTrackingValidated // ignore: cast_nullable_to_non_nullable
as bool,trackingValidationMessage: null == trackingValidationMessage ? _self.trackingValidationMessage : trackingValidationMessage // ignore: cast_nullable_to_non_nullable
as String,hanjinServiceCategory: freezed == hanjinServiceCategory ? _self.hanjinServiceCategory : hanjinServiceCategory // ignore: cast_nullable_to_non_nullable
as HanjinServiceCategory?,hanjinBoxType: freezed == hanjinBoxType ? _self.hanjinBoxType : hanjinBoxType // ignore: cast_nullable_to_non_nullable
as HanjinBoxType?,hanjinPayType: freezed == hanjinPayType ? _self.hanjinPayType : hanjinPayType // ignore: cast_nullable_to_non_nullable
as HanjinPayType?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as PreparingDeliveryModel?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PreparingPaymentModel?,
  ));
}
/// Create a copy of DashDeliveryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarrierModelCopyWith<$Res>? get courierCompany {
    if (_self.courierCompany == null) {
    return null;
  }

  return $CarrierModelCopyWith<$Res>(_self.courierCompany!, (value) {
    return _then(_self.copyWith(courierCompany: value));
  });
}/// Create a copy of DashDeliveryState
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
}/// Create a copy of DashDeliveryState
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


/// Adds pattern-matching-related methods to [DashDeliveryState].
extension DashDeliveryStatePatterns on DashDeliveryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashDeliveryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashDeliveryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashDeliveryState value)  $default,){
final _that = this;
switch (_that) {
case _DashDeliveryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashDeliveryState value)?  $default,){
final _that = this;
switch (_that) {
case _DashDeliveryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  String orderCode,  String orderStatus,  String orderDate,  String recipientName,  String address,  String phone,  List<PreparingOrderItemModel> items,  String deliveryRequest,  bool isVariableWeight,  DeliveryMethod? deliveryMethod,  List<DeliveryMethod> deliveryMethodList,  List<DeliveryExecuteTab> availableDeliveryTabs,  DeliveryExecuteTab selectedDeliveryTab,  CarrierModel? courierCompany,  List<CarrierModel> courierCompanyList,  String invoice,  bool isTrackingValidated,  String trackingValidationMessage,  HanjinServiceCategory? hanjinServiceCategory,  HanjinBoxType? hanjinBoxType,  HanjinPayType? hanjinPayType,  PreparingDeliveryModel? delivery,  PreparingPaymentModel? payment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashDeliveryState() when $default != null:
return $default(_that.isLoading,_that.orderCode,_that.orderStatus,_that.orderDate,_that.recipientName,_that.address,_that.phone,_that.items,_that.deliveryRequest,_that.isVariableWeight,_that.deliveryMethod,_that.deliveryMethodList,_that.availableDeliveryTabs,_that.selectedDeliveryTab,_that.courierCompany,_that.courierCompanyList,_that.invoice,_that.isTrackingValidated,_that.trackingValidationMessage,_that.hanjinServiceCategory,_that.hanjinBoxType,_that.hanjinPayType,_that.delivery,_that.payment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  String orderCode,  String orderStatus,  String orderDate,  String recipientName,  String address,  String phone,  List<PreparingOrderItemModel> items,  String deliveryRequest,  bool isVariableWeight,  DeliveryMethod? deliveryMethod,  List<DeliveryMethod> deliveryMethodList,  List<DeliveryExecuteTab> availableDeliveryTabs,  DeliveryExecuteTab selectedDeliveryTab,  CarrierModel? courierCompany,  List<CarrierModel> courierCompanyList,  String invoice,  bool isTrackingValidated,  String trackingValidationMessage,  HanjinServiceCategory? hanjinServiceCategory,  HanjinBoxType? hanjinBoxType,  HanjinPayType? hanjinPayType,  PreparingDeliveryModel? delivery,  PreparingPaymentModel? payment)  $default,) {final _that = this;
switch (_that) {
case _DashDeliveryState():
return $default(_that.isLoading,_that.orderCode,_that.orderStatus,_that.orderDate,_that.recipientName,_that.address,_that.phone,_that.items,_that.deliveryRequest,_that.isVariableWeight,_that.deliveryMethod,_that.deliveryMethodList,_that.availableDeliveryTabs,_that.selectedDeliveryTab,_that.courierCompany,_that.courierCompanyList,_that.invoice,_that.isTrackingValidated,_that.trackingValidationMessage,_that.hanjinServiceCategory,_that.hanjinBoxType,_that.hanjinPayType,_that.delivery,_that.payment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  String orderCode,  String orderStatus,  String orderDate,  String recipientName,  String address,  String phone,  List<PreparingOrderItemModel> items,  String deliveryRequest,  bool isVariableWeight,  DeliveryMethod? deliveryMethod,  List<DeliveryMethod> deliveryMethodList,  List<DeliveryExecuteTab> availableDeliveryTabs,  DeliveryExecuteTab selectedDeliveryTab,  CarrierModel? courierCompany,  List<CarrierModel> courierCompanyList,  String invoice,  bool isTrackingValidated,  String trackingValidationMessage,  HanjinServiceCategory? hanjinServiceCategory,  HanjinBoxType? hanjinBoxType,  HanjinPayType? hanjinPayType,  PreparingDeliveryModel? delivery,  PreparingPaymentModel? payment)?  $default,) {final _that = this;
switch (_that) {
case _DashDeliveryState() when $default != null:
return $default(_that.isLoading,_that.orderCode,_that.orderStatus,_that.orderDate,_that.recipientName,_that.address,_that.phone,_that.items,_that.deliveryRequest,_that.isVariableWeight,_that.deliveryMethod,_that.deliveryMethodList,_that.availableDeliveryTabs,_that.selectedDeliveryTab,_that.courierCompany,_that.courierCompanyList,_that.invoice,_that.isTrackingValidated,_that.trackingValidationMessage,_that.hanjinServiceCategory,_that.hanjinBoxType,_that.hanjinPayType,_that.delivery,_that.payment);case _:
  return null;

}
}

}

/// @nodoc


class _DashDeliveryState extends DashDeliveryState {
  const _DashDeliveryState({required this.isLoading, required this.orderCode, required this.orderStatus, required this.orderDate, required this.recipientName, required this.address, required this.phone, required final  List<PreparingOrderItemModel> items, required this.deliveryRequest, required this.isVariableWeight, required this.deliveryMethod, required final  List<DeliveryMethod> deliveryMethodList, required final  List<DeliveryExecuteTab> availableDeliveryTabs, required this.selectedDeliveryTab, required this.courierCompany, required final  List<CarrierModel> courierCompanyList, required this.invoice, required this.isTrackingValidated, required this.trackingValidationMessage, required this.hanjinServiceCategory, required this.hanjinBoxType, required this.hanjinPayType, this.delivery, this.payment}): _items = items,_deliveryMethodList = deliveryMethodList,_availableDeliveryTabs = availableDeliveryTabs,_courierCompanyList = courierCompanyList,super._();
  

@override final  bool isLoading;
@override final  String orderCode;
@override final  String orderStatus;
@override final  String orderDate;
@override final  String recipientName;
@override final  String address;
@override final  String phone;
 final  List<PreparingOrderItemModel> _items;
@override List<PreparingOrderItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String deliveryRequest;
@override final  bool isVariableWeight;
@override final  DeliveryMethod? deliveryMethod;
 final  List<DeliveryMethod> _deliveryMethodList;
@override List<DeliveryMethod> get deliveryMethodList {
  if (_deliveryMethodList is EqualUnmodifiableListView) return _deliveryMethodList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deliveryMethodList);
}

 final  List<DeliveryExecuteTab> _availableDeliveryTabs;
@override List<DeliveryExecuteTab> get availableDeliveryTabs {
  if (_availableDeliveryTabs is EqualUnmodifiableListView) return _availableDeliveryTabs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableDeliveryTabs);
}

@override final  DeliveryExecuteTab selectedDeliveryTab;
@override final  CarrierModel? courierCompany;
 final  List<CarrierModel> _courierCompanyList;
@override List<CarrierModel> get courierCompanyList {
  if (_courierCompanyList is EqualUnmodifiableListView) return _courierCompanyList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_courierCompanyList);
}

@override final  String invoice;
@override final  bool isTrackingValidated;
@override final  String trackingValidationMessage;
@override final  HanjinServiceCategory? hanjinServiceCategory;
@override final  HanjinBoxType? hanjinBoxType;
@override final  HanjinPayType? hanjinPayType;
@override final  PreparingDeliveryModel? delivery;
@override final  PreparingPaymentModel? payment;

/// Create a copy of DashDeliveryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashDeliveryStateCopyWith<_DashDeliveryState> get copyWith => __$DashDeliveryStateCopyWithImpl<_DashDeliveryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashDeliveryState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.orderCode, orderCode) || other.orderCode == orderCode)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&(identical(other.orderDate, orderDate) || other.orderDate == orderDate)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.deliveryRequest, deliveryRequest) || other.deliveryRequest == deliveryRequest)&&(identical(other.isVariableWeight, isVariableWeight) || other.isVariableWeight == isVariableWeight)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&const DeepCollectionEquality().equals(other._deliveryMethodList, _deliveryMethodList)&&const DeepCollectionEquality().equals(other._availableDeliveryTabs, _availableDeliveryTabs)&&(identical(other.selectedDeliveryTab, selectedDeliveryTab) || other.selectedDeliveryTab == selectedDeliveryTab)&&(identical(other.courierCompany, courierCompany) || other.courierCompany == courierCompany)&&const DeepCollectionEquality().equals(other._courierCompanyList, _courierCompanyList)&&(identical(other.invoice, invoice) || other.invoice == invoice)&&(identical(other.isTrackingValidated, isTrackingValidated) || other.isTrackingValidated == isTrackingValidated)&&(identical(other.trackingValidationMessage, trackingValidationMessage) || other.trackingValidationMessage == trackingValidationMessage)&&(identical(other.hanjinServiceCategory, hanjinServiceCategory) || other.hanjinServiceCategory == hanjinServiceCategory)&&(identical(other.hanjinBoxType, hanjinBoxType) || other.hanjinBoxType == hanjinBoxType)&&(identical(other.hanjinPayType, hanjinPayType) || other.hanjinPayType == hanjinPayType)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.payment, payment) || other.payment == payment));
}


@override
int get hashCode => Object.hashAll([runtimeType,isLoading,orderCode,orderStatus,orderDate,recipientName,address,phone,const DeepCollectionEquality().hash(_items),deliveryRequest,isVariableWeight,deliveryMethod,const DeepCollectionEquality().hash(_deliveryMethodList),const DeepCollectionEquality().hash(_availableDeliveryTabs),selectedDeliveryTab,courierCompany,const DeepCollectionEquality().hash(_courierCompanyList),invoice,isTrackingValidated,trackingValidationMessage,hanjinServiceCategory,hanjinBoxType,hanjinPayType,delivery,payment]);

@override
String toString() {
  return 'DashDeliveryState(isLoading: $isLoading, orderCode: $orderCode, orderStatus: $orderStatus, orderDate: $orderDate, recipientName: $recipientName, address: $address, phone: $phone, items: $items, deliveryRequest: $deliveryRequest, isVariableWeight: $isVariableWeight, deliveryMethod: $deliveryMethod, deliveryMethodList: $deliveryMethodList, availableDeliveryTabs: $availableDeliveryTabs, selectedDeliveryTab: $selectedDeliveryTab, courierCompany: $courierCompany, courierCompanyList: $courierCompanyList, invoice: $invoice, isTrackingValidated: $isTrackingValidated, trackingValidationMessage: $trackingValidationMessage, hanjinServiceCategory: $hanjinServiceCategory, hanjinBoxType: $hanjinBoxType, hanjinPayType: $hanjinPayType, delivery: $delivery, payment: $payment)';
}


}

/// @nodoc
abstract mixin class _$DashDeliveryStateCopyWith<$Res> implements $DashDeliveryStateCopyWith<$Res> {
  factory _$DashDeliveryStateCopyWith(_DashDeliveryState value, $Res Function(_DashDeliveryState) _then) = __$DashDeliveryStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, String orderCode, String orderStatus, String orderDate, String recipientName, String address, String phone, List<PreparingOrderItemModel> items, String deliveryRequest, bool isVariableWeight, DeliveryMethod? deliveryMethod, List<DeliveryMethod> deliveryMethodList, List<DeliveryExecuteTab> availableDeliveryTabs, DeliveryExecuteTab selectedDeliveryTab, CarrierModel? courierCompany, List<CarrierModel> courierCompanyList, String invoice, bool isTrackingValidated, String trackingValidationMessage, HanjinServiceCategory? hanjinServiceCategory, HanjinBoxType? hanjinBoxType, HanjinPayType? hanjinPayType, PreparingDeliveryModel? delivery, PreparingPaymentModel? payment
});


@override $CarrierModelCopyWith<$Res>? get courierCompany;@override $PreparingDeliveryModelCopyWith<$Res>? get delivery;@override $PreparingPaymentModelCopyWith<$Res>? get payment;

}
/// @nodoc
class __$DashDeliveryStateCopyWithImpl<$Res>
    implements _$DashDeliveryStateCopyWith<$Res> {
  __$DashDeliveryStateCopyWithImpl(this._self, this._then);

  final _DashDeliveryState _self;
  final $Res Function(_DashDeliveryState) _then;

/// Create a copy of DashDeliveryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? orderCode = null,Object? orderStatus = null,Object? orderDate = null,Object? recipientName = null,Object? address = null,Object? phone = null,Object? items = null,Object? deliveryRequest = null,Object? isVariableWeight = null,Object? deliveryMethod = freezed,Object? deliveryMethodList = null,Object? availableDeliveryTabs = null,Object? selectedDeliveryTab = null,Object? courierCompany = freezed,Object? courierCompanyList = null,Object? invoice = null,Object? isTrackingValidated = null,Object? trackingValidationMessage = null,Object? hanjinServiceCategory = freezed,Object? hanjinBoxType = freezed,Object? hanjinPayType = freezed,Object? delivery = freezed,Object? payment = freezed,}) {
  return _then(_DashDeliveryState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,orderStatus: null == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String,orderDate: null == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PreparingOrderItemModel>,deliveryRequest: null == deliveryRequest ? _self.deliveryRequest : deliveryRequest // ignore: cast_nullable_to_non_nullable
as String,isVariableWeight: null == isVariableWeight ? _self.isVariableWeight : isVariableWeight // ignore: cast_nullable_to_non_nullable
as bool,deliveryMethod: freezed == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as DeliveryMethod?,deliveryMethodList: null == deliveryMethodList ? _self._deliveryMethodList : deliveryMethodList // ignore: cast_nullable_to_non_nullable
as List<DeliveryMethod>,availableDeliveryTabs: null == availableDeliveryTabs ? _self._availableDeliveryTabs : availableDeliveryTabs // ignore: cast_nullable_to_non_nullable
as List<DeliveryExecuteTab>,selectedDeliveryTab: null == selectedDeliveryTab ? _self.selectedDeliveryTab : selectedDeliveryTab // ignore: cast_nullable_to_non_nullable
as DeliveryExecuteTab,courierCompany: freezed == courierCompany ? _self.courierCompany : courierCompany // ignore: cast_nullable_to_non_nullable
as CarrierModel?,courierCompanyList: null == courierCompanyList ? _self._courierCompanyList : courierCompanyList // ignore: cast_nullable_to_non_nullable
as List<CarrierModel>,invoice: null == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as String,isTrackingValidated: null == isTrackingValidated ? _self.isTrackingValidated : isTrackingValidated // ignore: cast_nullable_to_non_nullable
as bool,trackingValidationMessage: null == trackingValidationMessage ? _self.trackingValidationMessage : trackingValidationMessage // ignore: cast_nullable_to_non_nullable
as String,hanjinServiceCategory: freezed == hanjinServiceCategory ? _self.hanjinServiceCategory : hanjinServiceCategory // ignore: cast_nullable_to_non_nullable
as HanjinServiceCategory?,hanjinBoxType: freezed == hanjinBoxType ? _self.hanjinBoxType : hanjinBoxType // ignore: cast_nullable_to_non_nullable
as HanjinBoxType?,hanjinPayType: freezed == hanjinPayType ? _self.hanjinPayType : hanjinPayType // ignore: cast_nullable_to_non_nullable
as HanjinPayType?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as PreparingDeliveryModel?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PreparingPaymentModel?,
  ));
}

/// Create a copy of DashDeliveryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CarrierModelCopyWith<$Res>? get courierCompany {
    if (_self.courierCompany == null) {
    return null;
  }

  return $CarrierModelCopyWith<$Res>(_self.courierCompany!, (value) {
    return _then(_self.copyWith(courierCompany: value));
  });
}/// Create a copy of DashDeliveryState
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
}/// Create a copy of DashDeliveryState
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

// dart format on
