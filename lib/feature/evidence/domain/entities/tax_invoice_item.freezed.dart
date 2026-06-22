// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_invoice_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaxInvoiceItem {

 int? get id; int? get settlementId; int? get orderId; String? get settlementCode; String? get invoiceType; String? get supplierName; String? get receiverName; num? get supplyAmount; num? get taxAmount; num? get totalAmount; String? get status; DateTime? get issuedAt; String? get externalInvoiceId;
/// Create a copy of TaxInvoiceItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaxInvoiceItemCopyWith<TaxInvoiceItem> get copyWith => _$TaxInvoiceItemCopyWithImpl<TaxInvoiceItem>(this as TaxInvoiceItem, _$identity);

  /// Serializes this TaxInvoiceItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaxInvoiceItem&&(identical(other.id, id) || other.id == id)&&(identical(other.settlementId, settlementId) || other.settlementId == settlementId)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.settlementCode, settlementCode) || other.settlementCode == settlementCode)&&(identical(other.invoiceType, invoiceType) || other.invoiceType == invoiceType)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName)&&(identical(other.receiverName, receiverName) || other.receiverName == receiverName)&&(identical(other.supplyAmount, supplyAmount) || other.supplyAmount == supplyAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.externalInvoiceId, externalInvoiceId) || other.externalInvoiceId == externalInvoiceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,settlementId,orderId,settlementCode,invoiceType,supplierName,receiverName,supplyAmount,taxAmount,totalAmount,status,issuedAt,externalInvoiceId);

@override
String toString() {
  return 'TaxInvoiceItem(id: $id, settlementId: $settlementId, orderId: $orderId, settlementCode: $settlementCode, invoiceType: $invoiceType, supplierName: $supplierName, receiverName: $receiverName, supplyAmount: $supplyAmount, taxAmount: $taxAmount, totalAmount: $totalAmount, status: $status, issuedAt: $issuedAt, externalInvoiceId: $externalInvoiceId)';
}


}

/// @nodoc
abstract mixin class $TaxInvoiceItemCopyWith<$Res>  {
  factory $TaxInvoiceItemCopyWith(TaxInvoiceItem value, $Res Function(TaxInvoiceItem) _then) = _$TaxInvoiceItemCopyWithImpl;
@useResult
$Res call({
 int? id, int? settlementId, int? orderId, String? settlementCode, String? invoiceType, String? supplierName, String? receiverName, num? supplyAmount, num? taxAmount, num? totalAmount, String? status, DateTime? issuedAt, String? externalInvoiceId
});




}
/// @nodoc
class _$TaxInvoiceItemCopyWithImpl<$Res>
    implements $TaxInvoiceItemCopyWith<$Res> {
  _$TaxInvoiceItemCopyWithImpl(this._self, this._then);

  final TaxInvoiceItem _self;
  final $Res Function(TaxInvoiceItem) _then;

/// Create a copy of TaxInvoiceItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? settlementId = freezed,Object? orderId = freezed,Object? settlementCode = freezed,Object? invoiceType = freezed,Object? supplierName = freezed,Object? receiverName = freezed,Object? supplyAmount = freezed,Object? taxAmount = freezed,Object? totalAmount = freezed,Object? status = freezed,Object? issuedAt = freezed,Object? externalInvoiceId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,settlementId: freezed == settlementId ? _self.settlementId : settlementId // ignore: cast_nullable_to_non_nullable
as int?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,settlementCode: freezed == settlementCode ? _self.settlementCode : settlementCode // ignore: cast_nullable_to_non_nullable
as String?,invoiceType: freezed == invoiceType ? _self.invoiceType : invoiceType // ignore: cast_nullable_to_non_nullable
as String?,supplierName: freezed == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String?,receiverName: freezed == receiverName ? _self.receiverName : receiverName // ignore: cast_nullable_to_non_nullable
as String?,supplyAmount: freezed == supplyAmount ? _self.supplyAmount : supplyAmount // ignore: cast_nullable_to_non_nullable
as num?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as num?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as num?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,issuedAt: freezed == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,externalInvoiceId: freezed == externalInvoiceId ? _self.externalInvoiceId : externalInvoiceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaxInvoiceItem].
extension TaxInvoiceItemPatterns on TaxInvoiceItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaxInvoiceItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaxInvoiceItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaxInvoiceItem value)  $default,){
final _that = this;
switch (_that) {
case _TaxInvoiceItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaxInvoiceItem value)?  $default,){
final _that = this;
switch (_that) {
case _TaxInvoiceItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? settlementId,  int? orderId,  String? settlementCode,  String? invoiceType,  String? supplierName,  String? receiverName,  num? supplyAmount,  num? taxAmount,  num? totalAmount,  String? status,  DateTime? issuedAt,  String? externalInvoiceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaxInvoiceItem() when $default != null:
return $default(_that.id,_that.settlementId,_that.orderId,_that.settlementCode,_that.invoiceType,_that.supplierName,_that.receiverName,_that.supplyAmount,_that.taxAmount,_that.totalAmount,_that.status,_that.issuedAt,_that.externalInvoiceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? settlementId,  int? orderId,  String? settlementCode,  String? invoiceType,  String? supplierName,  String? receiverName,  num? supplyAmount,  num? taxAmount,  num? totalAmount,  String? status,  DateTime? issuedAt,  String? externalInvoiceId)  $default,) {final _that = this;
switch (_that) {
case _TaxInvoiceItem():
return $default(_that.id,_that.settlementId,_that.orderId,_that.settlementCode,_that.invoiceType,_that.supplierName,_that.receiverName,_that.supplyAmount,_that.taxAmount,_that.totalAmount,_that.status,_that.issuedAt,_that.externalInvoiceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? settlementId,  int? orderId,  String? settlementCode,  String? invoiceType,  String? supplierName,  String? receiverName,  num? supplyAmount,  num? taxAmount,  num? totalAmount,  String? status,  DateTime? issuedAt,  String? externalInvoiceId)?  $default,) {final _that = this;
switch (_that) {
case _TaxInvoiceItem() when $default != null:
return $default(_that.id,_that.settlementId,_that.orderId,_that.settlementCode,_that.invoiceType,_that.supplierName,_that.receiverName,_that.supplyAmount,_that.taxAmount,_that.totalAmount,_that.status,_that.issuedAt,_that.externalInvoiceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaxInvoiceItem implements TaxInvoiceItem {
  const _TaxInvoiceItem({this.id, this.settlementId, this.orderId, this.settlementCode, this.invoiceType, this.supplierName, this.receiverName, this.supplyAmount, this.taxAmount, this.totalAmount, this.status, this.issuedAt, this.externalInvoiceId});
  factory _TaxInvoiceItem.fromJson(Map<String, dynamic> json) => _$TaxInvoiceItemFromJson(json);

@override final  int? id;
@override final  int? settlementId;
@override final  int? orderId;
@override final  String? settlementCode;
@override final  String? invoiceType;
@override final  String? supplierName;
@override final  String? receiverName;
@override final  num? supplyAmount;
@override final  num? taxAmount;
@override final  num? totalAmount;
@override final  String? status;
@override final  DateTime? issuedAt;
@override final  String? externalInvoiceId;

/// Create a copy of TaxInvoiceItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaxInvoiceItemCopyWith<_TaxInvoiceItem> get copyWith => __$TaxInvoiceItemCopyWithImpl<_TaxInvoiceItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaxInvoiceItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaxInvoiceItem&&(identical(other.id, id) || other.id == id)&&(identical(other.settlementId, settlementId) || other.settlementId == settlementId)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.settlementCode, settlementCode) || other.settlementCode == settlementCode)&&(identical(other.invoiceType, invoiceType) || other.invoiceType == invoiceType)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName)&&(identical(other.receiverName, receiverName) || other.receiverName == receiverName)&&(identical(other.supplyAmount, supplyAmount) || other.supplyAmount == supplyAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.externalInvoiceId, externalInvoiceId) || other.externalInvoiceId == externalInvoiceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,settlementId,orderId,settlementCode,invoiceType,supplierName,receiverName,supplyAmount,taxAmount,totalAmount,status,issuedAt,externalInvoiceId);

@override
String toString() {
  return 'TaxInvoiceItem(id: $id, settlementId: $settlementId, orderId: $orderId, settlementCode: $settlementCode, invoiceType: $invoiceType, supplierName: $supplierName, receiverName: $receiverName, supplyAmount: $supplyAmount, taxAmount: $taxAmount, totalAmount: $totalAmount, status: $status, issuedAt: $issuedAt, externalInvoiceId: $externalInvoiceId)';
}


}

/// @nodoc
abstract mixin class _$TaxInvoiceItemCopyWith<$Res> implements $TaxInvoiceItemCopyWith<$Res> {
  factory _$TaxInvoiceItemCopyWith(_TaxInvoiceItem value, $Res Function(_TaxInvoiceItem) _then) = __$TaxInvoiceItemCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? settlementId, int? orderId, String? settlementCode, String? invoiceType, String? supplierName, String? receiverName, num? supplyAmount, num? taxAmount, num? totalAmount, String? status, DateTime? issuedAt, String? externalInvoiceId
});




}
/// @nodoc
class __$TaxInvoiceItemCopyWithImpl<$Res>
    implements _$TaxInvoiceItemCopyWith<$Res> {
  __$TaxInvoiceItemCopyWithImpl(this._self, this._then);

  final _TaxInvoiceItem _self;
  final $Res Function(_TaxInvoiceItem) _then;

/// Create a copy of TaxInvoiceItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? settlementId = freezed,Object? orderId = freezed,Object? settlementCode = freezed,Object? invoiceType = freezed,Object? supplierName = freezed,Object? receiverName = freezed,Object? supplyAmount = freezed,Object? taxAmount = freezed,Object? totalAmount = freezed,Object? status = freezed,Object? issuedAt = freezed,Object? externalInvoiceId = freezed,}) {
  return _then(_TaxInvoiceItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,settlementId: freezed == settlementId ? _self.settlementId : settlementId // ignore: cast_nullable_to_non_nullable
as int?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,settlementCode: freezed == settlementCode ? _self.settlementCode : settlementCode // ignore: cast_nullable_to_non_nullable
as String?,invoiceType: freezed == invoiceType ? _self.invoiceType : invoiceType // ignore: cast_nullable_to_non_nullable
as String?,supplierName: freezed == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String?,receiverName: freezed == receiverName ? _self.receiverName : receiverName // ignore: cast_nullable_to_non_nullable
as String?,supplyAmount: freezed == supplyAmount ? _self.supplyAmount : supplyAmount // ignore: cast_nullable_to_non_nullable
as num?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as num?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as num?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,issuedAt: freezed == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,externalInvoiceId: freezed == externalInvoiceId ? _self.externalInvoiceId : externalInvoiceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
