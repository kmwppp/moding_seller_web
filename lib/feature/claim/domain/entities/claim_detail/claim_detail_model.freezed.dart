// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClaimDetailModel {

 int get id; String get claimCode; int get orderId; String get orderCode; String get buyerBusinessName; ClaimType get claimType; String get claimReason; ClaimStatus get status; ClaimResolution? get resolution;@JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) DateTime? get deliveredAt; String? get rejectReason; String? get appealReason;@JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) DateTime? get appealDeadlineAt; DeliveryMethod? get reshipDeliveryMethod; String? get reshipCourierCode; String? get reshipTrackingNumber; List<DeliveryMethod>? get productDeliveryMethods;@JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) DateTime? get reshipShippedAt;/// 배송지 정보
 String? get recipientName; String? get zipCode; String? get address; String? get addressDetail; String? get phone; String? get deliveryRequest; List<ClaimItemModel> get items;@JsonKey(name: "photoUrls") List<String> get photos; List<ClaimStatusHistoryModel> get statusHistories; List<ClaimTrackingEventModel> get reshipTrackingEvents;@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime get createdAt;@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime get updatedAt;
/// Create a copy of ClaimDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimDetailModelCopyWith<ClaimDetailModel> get copyWith => _$ClaimDetailModelCopyWithImpl<ClaimDetailModel>(this as ClaimDetailModel, _$identity);

  /// Serializes this ClaimDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.claimCode, claimCode) || other.claimCode == claimCode)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.orderCode, orderCode) || other.orderCode == orderCode)&&(identical(other.buyerBusinessName, buyerBusinessName) || other.buyerBusinessName == buyerBusinessName)&&(identical(other.claimType, claimType) || other.claimType == claimType)&&(identical(other.claimReason, claimReason) || other.claimReason == claimReason)&&(identical(other.status, status) || other.status == status)&&(identical(other.resolution, resolution) || other.resolution == resolution)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.rejectReason, rejectReason) || other.rejectReason == rejectReason)&&(identical(other.appealReason, appealReason) || other.appealReason == appealReason)&&(identical(other.appealDeadlineAt, appealDeadlineAt) || other.appealDeadlineAt == appealDeadlineAt)&&(identical(other.reshipDeliveryMethod, reshipDeliveryMethod) || other.reshipDeliveryMethod == reshipDeliveryMethod)&&(identical(other.reshipCourierCode, reshipCourierCode) || other.reshipCourierCode == reshipCourierCode)&&(identical(other.reshipTrackingNumber, reshipTrackingNumber) || other.reshipTrackingNumber == reshipTrackingNumber)&&const DeepCollectionEquality().equals(other.productDeliveryMethods, productDeliveryMethods)&&(identical(other.reshipShippedAt, reshipShippedAt) || other.reshipShippedAt == reshipShippedAt)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressDetail, addressDetail) || other.addressDetail == addressDetail)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.deliveryRequest, deliveryRequest) || other.deliveryRequest == deliveryRequest)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.photos, photos)&&const DeepCollectionEquality().equals(other.statusHistories, statusHistories)&&const DeepCollectionEquality().equals(other.reshipTrackingEvents, reshipTrackingEvents)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,claimCode,orderId,orderCode,buyerBusinessName,claimType,claimReason,status,resolution,deliveredAt,rejectReason,appealReason,appealDeadlineAt,reshipDeliveryMethod,reshipCourierCode,reshipTrackingNumber,const DeepCollectionEquality().hash(productDeliveryMethods),reshipShippedAt,recipientName,zipCode,address,addressDetail,phone,deliveryRequest,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(photos),const DeepCollectionEquality().hash(statusHistories),const DeepCollectionEquality().hash(reshipTrackingEvents),createdAt,updatedAt]);

@override
String toString() {
  return 'ClaimDetailModel(id: $id, claimCode: $claimCode, orderId: $orderId, orderCode: $orderCode, buyerBusinessName: $buyerBusinessName, claimType: $claimType, claimReason: $claimReason, status: $status, resolution: $resolution, deliveredAt: $deliveredAt, rejectReason: $rejectReason, appealReason: $appealReason, appealDeadlineAt: $appealDeadlineAt, reshipDeliveryMethod: $reshipDeliveryMethod, reshipCourierCode: $reshipCourierCode, reshipTrackingNumber: $reshipTrackingNumber, productDeliveryMethods: $productDeliveryMethods, reshipShippedAt: $reshipShippedAt, recipientName: $recipientName, zipCode: $zipCode, address: $address, addressDetail: $addressDetail, phone: $phone, deliveryRequest: $deliveryRequest, items: $items, photos: $photos, statusHistories: $statusHistories, reshipTrackingEvents: $reshipTrackingEvents, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ClaimDetailModelCopyWith<$Res>  {
  factory $ClaimDetailModelCopyWith(ClaimDetailModel value, $Res Function(ClaimDetailModel) _then) = _$ClaimDetailModelCopyWithImpl;
@useResult
$Res call({
 int id, String claimCode, int orderId, String orderCode, String buyerBusinessName, ClaimType claimType, String claimReason, ClaimStatus status, ClaimResolution? resolution,@JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) DateTime? deliveredAt, String? rejectReason, String? appealReason,@JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) DateTime? appealDeadlineAt, DeliveryMethod? reshipDeliveryMethod, String? reshipCourierCode, String? reshipTrackingNumber, List<DeliveryMethod>? productDeliveryMethods,@JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) DateTime? reshipShippedAt, String? recipientName, String? zipCode, String? address, String? addressDetail, String? phone, String? deliveryRequest, List<ClaimItemModel> items,@JsonKey(name: "photoUrls") List<String> photos, List<ClaimStatusHistoryModel> statusHistories, List<ClaimTrackingEventModel> reshipTrackingEvents,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime createdAt,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime updatedAt
});




}
/// @nodoc
class _$ClaimDetailModelCopyWithImpl<$Res>
    implements $ClaimDetailModelCopyWith<$Res> {
  _$ClaimDetailModelCopyWithImpl(this._self, this._then);

  final ClaimDetailModel _self;
  final $Res Function(ClaimDetailModel) _then;

/// Create a copy of ClaimDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? claimCode = null,Object? orderId = null,Object? orderCode = null,Object? buyerBusinessName = null,Object? claimType = null,Object? claimReason = null,Object? status = null,Object? resolution = freezed,Object? deliveredAt = freezed,Object? rejectReason = freezed,Object? appealReason = freezed,Object? appealDeadlineAt = freezed,Object? reshipDeliveryMethod = freezed,Object? reshipCourierCode = freezed,Object? reshipTrackingNumber = freezed,Object? productDeliveryMethods = freezed,Object? reshipShippedAt = freezed,Object? recipientName = freezed,Object? zipCode = freezed,Object? address = freezed,Object? addressDetail = freezed,Object? phone = freezed,Object? deliveryRequest = freezed,Object? items = null,Object? photos = null,Object? statusHistories = null,Object? reshipTrackingEvents = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,claimCode: null == claimCode ? _self.claimCode : claimCode // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,buyerBusinessName: null == buyerBusinessName ? _self.buyerBusinessName : buyerBusinessName // ignore: cast_nullable_to_non_nullable
as String,claimType: null == claimType ? _self.claimType : claimType // ignore: cast_nullable_to_non_nullable
as ClaimType,claimReason: null == claimReason ? _self.claimReason : claimReason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ClaimStatus,resolution: freezed == resolution ? _self.resolution : resolution // ignore: cast_nullable_to_non_nullable
as ClaimResolution?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectReason: freezed == rejectReason ? _self.rejectReason : rejectReason // ignore: cast_nullable_to_non_nullable
as String?,appealReason: freezed == appealReason ? _self.appealReason : appealReason // ignore: cast_nullable_to_non_nullable
as String?,appealDeadlineAt: freezed == appealDeadlineAt ? _self.appealDeadlineAt : appealDeadlineAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reshipDeliveryMethod: freezed == reshipDeliveryMethod ? _self.reshipDeliveryMethod : reshipDeliveryMethod // ignore: cast_nullable_to_non_nullable
as DeliveryMethod?,reshipCourierCode: freezed == reshipCourierCode ? _self.reshipCourierCode : reshipCourierCode // ignore: cast_nullable_to_non_nullable
as String?,reshipTrackingNumber: freezed == reshipTrackingNumber ? _self.reshipTrackingNumber : reshipTrackingNumber // ignore: cast_nullable_to_non_nullable
as String?,productDeliveryMethods: freezed == productDeliveryMethods ? _self.productDeliveryMethods : productDeliveryMethods // ignore: cast_nullable_to_non_nullable
as List<DeliveryMethod>?,reshipShippedAt: freezed == reshipShippedAt ? _self.reshipShippedAt : reshipShippedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,recipientName: freezed == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,addressDetail: freezed == addressDetail ? _self.addressDetail : addressDetail // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,deliveryRequest: freezed == deliveryRequest ? _self.deliveryRequest : deliveryRequest // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ClaimItemModel>,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,statusHistories: null == statusHistories ? _self.statusHistories : statusHistories // ignore: cast_nullable_to_non_nullable
as List<ClaimStatusHistoryModel>,reshipTrackingEvents: null == reshipTrackingEvents ? _self.reshipTrackingEvents : reshipTrackingEvents // ignore: cast_nullable_to_non_nullable
as List<ClaimTrackingEventModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ClaimDetailModel].
extension ClaimDetailModelPatterns on ClaimDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _ClaimDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String claimCode,  int orderId,  String orderCode,  String buyerBusinessName,  ClaimType claimType,  String claimReason,  ClaimStatus status,  ClaimResolution? resolution, @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable)  DateTime? deliveredAt,  String? rejectReason,  String? appealReason, @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable)  DateTime? appealDeadlineAt,  DeliveryMethod? reshipDeliveryMethod,  String? reshipCourierCode,  String? reshipTrackingNumber,  List<DeliveryMethod>? productDeliveryMethods, @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable)  DateTime? reshipShippedAt,  String? recipientName,  String? zipCode,  String? address,  String? addressDetail,  String? phone,  String? deliveryRequest,  List<ClaimItemModel> items, @JsonKey(name: "photoUrls")  List<String> photos,  List<ClaimStatusHistoryModel> statusHistories,  List<ClaimTrackingEventModel> reshipTrackingEvents, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime createdAt, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimDetailModel() when $default != null:
return $default(_that.id,_that.claimCode,_that.orderId,_that.orderCode,_that.buyerBusinessName,_that.claimType,_that.claimReason,_that.status,_that.resolution,_that.deliveredAt,_that.rejectReason,_that.appealReason,_that.appealDeadlineAt,_that.reshipDeliveryMethod,_that.reshipCourierCode,_that.reshipTrackingNumber,_that.productDeliveryMethods,_that.reshipShippedAt,_that.recipientName,_that.zipCode,_that.address,_that.addressDetail,_that.phone,_that.deliveryRequest,_that.items,_that.photos,_that.statusHistories,_that.reshipTrackingEvents,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String claimCode,  int orderId,  String orderCode,  String buyerBusinessName,  ClaimType claimType,  String claimReason,  ClaimStatus status,  ClaimResolution? resolution, @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable)  DateTime? deliveredAt,  String? rejectReason,  String? appealReason, @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable)  DateTime? appealDeadlineAt,  DeliveryMethod? reshipDeliveryMethod,  String? reshipCourierCode,  String? reshipTrackingNumber,  List<DeliveryMethod>? productDeliveryMethods, @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable)  DateTime? reshipShippedAt,  String? recipientName,  String? zipCode,  String? address,  String? addressDetail,  String? phone,  String? deliveryRequest,  List<ClaimItemModel> items, @JsonKey(name: "photoUrls")  List<String> photos,  List<ClaimStatusHistoryModel> statusHistories,  List<ClaimTrackingEventModel> reshipTrackingEvents, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime createdAt, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ClaimDetailModel():
return $default(_that.id,_that.claimCode,_that.orderId,_that.orderCode,_that.buyerBusinessName,_that.claimType,_that.claimReason,_that.status,_that.resolution,_that.deliveredAt,_that.rejectReason,_that.appealReason,_that.appealDeadlineAt,_that.reshipDeliveryMethod,_that.reshipCourierCode,_that.reshipTrackingNumber,_that.productDeliveryMethods,_that.reshipShippedAt,_that.recipientName,_that.zipCode,_that.address,_that.addressDetail,_that.phone,_that.deliveryRequest,_that.items,_that.photos,_that.statusHistories,_that.reshipTrackingEvents,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String claimCode,  int orderId,  String orderCode,  String buyerBusinessName,  ClaimType claimType,  String claimReason,  ClaimStatus status,  ClaimResolution? resolution, @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable)  DateTime? deliveredAt,  String? rejectReason,  String? appealReason, @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable)  DateTime? appealDeadlineAt,  DeliveryMethod? reshipDeliveryMethod,  String? reshipCourierCode,  String? reshipTrackingNumber,  List<DeliveryMethod>? productDeliveryMethods, @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable)  DateTime? reshipShippedAt,  String? recipientName,  String? zipCode,  String? address,  String? addressDetail,  String? phone,  String? deliveryRequest,  List<ClaimItemModel> items, @JsonKey(name: "photoUrls")  List<String> photos,  List<ClaimStatusHistoryModel> statusHistories,  List<ClaimTrackingEventModel> reshipTrackingEvents, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime createdAt, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ClaimDetailModel() when $default != null:
return $default(_that.id,_that.claimCode,_that.orderId,_that.orderCode,_that.buyerBusinessName,_that.claimType,_that.claimReason,_that.status,_that.resolution,_that.deliveredAt,_that.rejectReason,_that.appealReason,_that.appealDeadlineAt,_that.reshipDeliveryMethod,_that.reshipCourierCode,_that.reshipTrackingNumber,_that.productDeliveryMethods,_that.reshipShippedAt,_that.recipientName,_that.zipCode,_that.address,_that.addressDetail,_that.phone,_that.deliveryRequest,_that.items,_that.photos,_that.statusHistories,_that.reshipTrackingEvents,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClaimDetailModel implements ClaimDetailModel {
  const _ClaimDetailModel({required this.id, required this.claimCode, required this.orderId, required this.orderCode, required this.buyerBusinessName, required this.claimType, required this.claimReason, required this.status, this.resolution, @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) this.deliveredAt, this.rejectReason, this.appealReason, @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) this.appealDeadlineAt, this.reshipDeliveryMethod, this.reshipCourierCode, this.reshipTrackingNumber, final  List<DeliveryMethod>? productDeliveryMethods, @JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) this.reshipShippedAt, this.recipientName, this.zipCode, this.address, this.addressDetail, this.phone, this.deliveryRequest, final  List<ClaimItemModel> items = const [], @JsonKey(name: "photoUrls") final  List<String> photos = const [], final  List<ClaimStatusHistoryModel> statusHistories = const [], final  List<ClaimTrackingEventModel> reshipTrackingEvents = const [], @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) required this.createdAt, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) required this.updatedAt}): _productDeliveryMethods = productDeliveryMethods,_items = items,_photos = photos,_statusHistories = statusHistories,_reshipTrackingEvents = reshipTrackingEvents;
  factory _ClaimDetailModel.fromJson(Map<String, dynamic> json) => _$ClaimDetailModelFromJson(json);

@override final  int id;
@override final  String claimCode;
@override final  int orderId;
@override final  String orderCode;
@override final  String buyerBusinessName;
@override final  ClaimType claimType;
@override final  String claimReason;
@override final  ClaimStatus status;
@override final  ClaimResolution? resolution;
@override@JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) final  DateTime? deliveredAt;
@override final  String? rejectReason;
@override final  String? appealReason;
@override@JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) final  DateTime? appealDeadlineAt;
@override final  DeliveryMethod? reshipDeliveryMethod;
@override final  String? reshipCourierCode;
@override final  String? reshipTrackingNumber;
 final  List<DeliveryMethod>? _productDeliveryMethods;
@override List<DeliveryMethod>? get productDeliveryMethods {
  final value = _productDeliveryMethods;
  if (value == null) return null;
  if (_productDeliveryMethods is EqualUnmodifiableListView) return _productDeliveryMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) final  DateTime? reshipShippedAt;
/// 배송지 정보
@override final  String? recipientName;
@override final  String? zipCode;
@override final  String? address;
@override final  String? addressDetail;
@override final  String? phone;
@override final  String? deliveryRequest;
 final  List<ClaimItemModel> _items;
@override@JsonKey() List<ClaimItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<String> _photos;
@override@JsonKey(name: "photoUrls") List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

 final  List<ClaimStatusHistoryModel> _statusHistories;
@override@JsonKey() List<ClaimStatusHistoryModel> get statusHistories {
  if (_statusHistories is EqualUnmodifiableListView) return _statusHistories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_statusHistories);
}

 final  List<ClaimTrackingEventModel> _reshipTrackingEvents;
@override@JsonKey() List<ClaimTrackingEventModel> get reshipTrackingEvents {
  if (_reshipTrackingEvents is EqualUnmodifiableListView) return _reshipTrackingEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reshipTrackingEvents);
}

@override@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) final  DateTime createdAt;
@override@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) final  DateTime updatedAt;

/// Create a copy of ClaimDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimDetailModelCopyWith<_ClaimDetailModel> get copyWith => __$ClaimDetailModelCopyWithImpl<_ClaimDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClaimDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.claimCode, claimCode) || other.claimCode == claimCode)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.orderCode, orderCode) || other.orderCode == orderCode)&&(identical(other.buyerBusinessName, buyerBusinessName) || other.buyerBusinessName == buyerBusinessName)&&(identical(other.claimType, claimType) || other.claimType == claimType)&&(identical(other.claimReason, claimReason) || other.claimReason == claimReason)&&(identical(other.status, status) || other.status == status)&&(identical(other.resolution, resolution) || other.resolution == resolution)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.rejectReason, rejectReason) || other.rejectReason == rejectReason)&&(identical(other.appealReason, appealReason) || other.appealReason == appealReason)&&(identical(other.appealDeadlineAt, appealDeadlineAt) || other.appealDeadlineAt == appealDeadlineAt)&&(identical(other.reshipDeliveryMethod, reshipDeliveryMethod) || other.reshipDeliveryMethod == reshipDeliveryMethod)&&(identical(other.reshipCourierCode, reshipCourierCode) || other.reshipCourierCode == reshipCourierCode)&&(identical(other.reshipTrackingNumber, reshipTrackingNumber) || other.reshipTrackingNumber == reshipTrackingNumber)&&const DeepCollectionEquality().equals(other._productDeliveryMethods, _productDeliveryMethods)&&(identical(other.reshipShippedAt, reshipShippedAt) || other.reshipShippedAt == reshipShippedAt)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressDetail, addressDetail) || other.addressDetail == addressDetail)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.deliveryRequest, deliveryRequest) || other.deliveryRequest == deliveryRequest)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._photos, _photos)&&const DeepCollectionEquality().equals(other._statusHistories, _statusHistories)&&const DeepCollectionEquality().equals(other._reshipTrackingEvents, _reshipTrackingEvents)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,claimCode,orderId,orderCode,buyerBusinessName,claimType,claimReason,status,resolution,deliveredAt,rejectReason,appealReason,appealDeadlineAt,reshipDeliveryMethod,reshipCourierCode,reshipTrackingNumber,const DeepCollectionEquality().hash(_productDeliveryMethods),reshipShippedAt,recipientName,zipCode,address,addressDetail,phone,deliveryRequest,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_photos),const DeepCollectionEquality().hash(_statusHistories),const DeepCollectionEquality().hash(_reshipTrackingEvents),createdAt,updatedAt]);

@override
String toString() {
  return 'ClaimDetailModel(id: $id, claimCode: $claimCode, orderId: $orderId, orderCode: $orderCode, buyerBusinessName: $buyerBusinessName, claimType: $claimType, claimReason: $claimReason, status: $status, resolution: $resolution, deliveredAt: $deliveredAt, rejectReason: $rejectReason, appealReason: $appealReason, appealDeadlineAt: $appealDeadlineAt, reshipDeliveryMethod: $reshipDeliveryMethod, reshipCourierCode: $reshipCourierCode, reshipTrackingNumber: $reshipTrackingNumber, productDeliveryMethods: $productDeliveryMethods, reshipShippedAt: $reshipShippedAt, recipientName: $recipientName, zipCode: $zipCode, address: $address, addressDetail: $addressDetail, phone: $phone, deliveryRequest: $deliveryRequest, items: $items, photos: $photos, statusHistories: $statusHistories, reshipTrackingEvents: $reshipTrackingEvents, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ClaimDetailModelCopyWith<$Res> implements $ClaimDetailModelCopyWith<$Res> {
  factory _$ClaimDetailModelCopyWith(_ClaimDetailModel value, $Res Function(_ClaimDetailModel) _then) = __$ClaimDetailModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String claimCode, int orderId, String orderCode, String buyerBusinessName, ClaimType claimType, String claimReason, ClaimStatus status, ClaimResolution? resolution,@JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) DateTime? deliveredAt, String? rejectReason, String? appealReason,@JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) DateTime? appealDeadlineAt, DeliveryMethod? reshipDeliveryMethod, String? reshipCourierCode, String? reshipTrackingNumber, List<DeliveryMethod>? productDeliveryMethods,@JsonKey(fromJson: _fromJsonDateNullable, toJson: _toJsonDateNullable) DateTime? reshipShippedAt, String? recipientName, String? zipCode, String? address, String? addressDetail, String? phone, String? deliveryRequest, List<ClaimItemModel> items,@JsonKey(name: "photoUrls") List<String> photos, List<ClaimStatusHistoryModel> statusHistories, List<ClaimTrackingEventModel> reshipTrackingEvents,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime createdAt,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime updatedAt
});




}
/// @nodoc
class __$ClaimDetailModelCopyWithImpl<$Res>
    implements _$ClaimDetailModelCopyWith<$Res> {
  __$ClaimDetailModelCopyWithImpl(this._self, this._then);

  final _ClaimDetailModel _self;
  final $Res Function(_ClaimDetailModel) _then;

/// Create a copy of ClaimDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? claimCode = null,Object? orderId = null,Object? orderCode = null,Object? buyerBusinessName = null,Object? claimType = null,Object? claimReason = null,Object? status = null,Object? resolution = freezed,Object? deliveredAt = freezed,Object? rejectReason = freezed,Object? appealReason = freezed,Object? appealDeadlineAt = freezed,Object? reshipDeliveryMethod = freezed,Object? reshipCourierCode = freezed,Object? reshipTrackingNumber = freezed,Object? productDeliveryMethods = freezed,Object? reshipShippedAt = freezed,Object? recipientName = freezed,Object? zipCode = freezed,Object? address = freezed,Object? addressDetail = freezed,Object? phone = freezed,Object? deliveryRequest = freezed,Object? items = null,Object? photos = null,Object? statusHistories = null,Object? reshipTrackingEvents = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ClaimDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,claimCode: null == claimCode ? _self.claimCode : claimCode // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,orderCode: null == orderCode ? _self.orderCode : orderCode // ignore: cast_nullable_to_non_nullable
as String,buyerBusinessName: null == buyerBusinessName ? _self.buyerBusinessName : buyerBusinessName // ignore: cast_nullable_to_non_nullable
as String,claimType: null == claimType ? _self.claimType : claimType // ignore: cast_nullable_to_non_nullable
as ClaimType,claimReason: null == claimReason ? _self.claimReason : claimReason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ClaimStatus,resolution: freezed == resolution ? _self.resolution : resolution // ignore: cast_nullable_to_non_nullable
as ClaimResolution?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectReason: freezed == rejectReason ? _self.rejectReason : rejectReason // ignore: cast_nullable_to_non_nullable
as String?,appealReason: freezed == appealReason ? _self.appealReason : appealReason // ignore: cast_nullable_to_non_nullable
as String?,appealDeadlineAt: freezed == appealDeadlineAt ? _self.appealDeadlineAt : appealDeadlineAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reshipDeliveryMethod: freezed == reshipDeliveryMethod ? _self.reshipDeliveryMethod : reshipDeliveryMethod // ignore: cast_nullable_to_non_nullable
as DeliveryMethod?,reshipCourierCode: freezed == reshipCourierCode ? _self.reshipCourierCode : reshipCourierCode // ignore: cast_nullable_to_non_nullable
as String?,reshipTrackingNumber: freezed == reshipTrackingNumber ? _self.reshipTrackingNumber : reshipTrackingNumber // ignore: cast_nullable_to_non_nullable
as String?,productDeliveryMethods: freezed == productDeliveryMethods ? _self._productDeliveryMethods : productDeliveryMethods // ignore: cast_nullable_to_non_nullable
as List<DeliveryMethod>?,reshipShippedAt: freezed == reshipShippedAt ? _self.reshipShippedAt : reshipShippedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,recipientName: freezed == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,addressDetail: freezed == addressDetail ? _self.addressDetail : addressDetail // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,deliveryRequest: freezed == deliveryRequest ? _self.deliveryRequest : deliveryRequest // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ClaimItemModel>,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,statusHistories: null == statusHistories ? _self._statusHistories : statusHistories // ignore: cast_nullable_to_non_nullable
as List<ClaimStatusHistoryModel>,reshipTrackingEvents: null == reshipTrackingEvents ? _self._reshipTrackingEvents : reshipTrackingEvents // ignore: cast_nullable_to_non_nullable
as List<ClaimTrackingEventModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ClaimItemModel {

 int get id; int get orderItemId; String get productName; String get optionName; int get unitPrice; int get quantity; int get claimedQuantity; int get refundAmount;
/// Create a copy of ClaimItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimItemModelCopyWith<ClaimItemModel> get copyWith => _$ClaimItemModelCopyWithImpl<ClaimItemModel>(this as ClaimItemModel, _$identity);

  /// Serializes this ClaimItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderItemId, orderItemId) || other.orderItemId == orderItemId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.optionName, optionName) || other.optionName == optionName)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.claimedQuantity, claimedQuantity) || other.claimedQuantity == claimedQuantity)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderItemId,productName,optionName,unitPrice,quantity,claimedQuantity,refundAmount);

@override
String toString() {
  return 'ClaimItemModel(id: $id, orderItemId: $orderItemId, productName: $productName, optionName: $optionName, unitPrice: $unitPrice, quantity: $quantity, claimedQuantity: $claimedQuantity, refundAmount: $refundAmount)';
}


}

/// @nodoc
abstract mixin class $ClaimItemModelCopyWith<$Res>  {
  factory $ClaimItemModelCopyWith(ClaimItemModel value, $Res Function(ClaimItemModel) _then) = _$ClaimItemModelCopyWithImpl;
@useResult
$Res call({
 int id, int orderItemId, String productName, String optionName, int unitPrice, int quantity, int claimedQuantity, int refundAmount
});




}
/// @nodoc
class _$ClaimItemModelCopyWithImpl<$Res>
    implements $ClaimItemModelCopyWith<$Res> {
  _$ClaimItemModelCopyWithImpl(this._self, this._then);

  final ClaimItemModel _self;
  final $Res Function(ClaimItemModel) _then;

/// Create a copy of ClaimItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderItemId = null,Object? productName = null,Object? optionName = null,Object? unitPrice = null,Object? quantity = null,Object? claimedQuantity = null,Object? refundAmount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderItemId: null == orderItemId ? _self.orderItemId : orderItemId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,optionName: null == optionName ? _self.optionName : optionName // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,claimedQuantity: null == claimedQuantity ? _self.claimedQuantity : claimedQuantity // ignore: cast_nullable_to_non_nullable
as int,refundAmount: null == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClaimItemModel].
extension ClaimItemModelPatterns on ClaimItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ClaimItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int orderItemId,  String productName,  String optionName,  int unitPrice,  int quantity,  int claimedQuantity,  int refundAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimItemModel() when $default != null:
return $default(_that.id,_that.orderItemId,_that.productName,_that.optionName,_that.unitPrice,_that.quantity,_that.claimedQuantity,_that.refundAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int orderItemId,  String productName,  String optionName,  int unitPrice,  int quantity,  int claimedQuantity,  int refundAmount)  $default,) {final _that = this;
switch (_that) {
case _ClaimItemModel():
return $default(_that.id,_that.orderItemId,_that.productName,_that.optionName,_that.unitPrice,_that.quantity,_that.claimedQuantity,_that.refundAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int orderItemId,  String productName,  String optionName,  int unitPrice,  int quantity,  int claimedQuantity,  int refundAmount)?  $default,) {final _that = this;
switch (_that) {
case _ClaimItemModel() when $default != null:
return $default(_that.id,_that.orderItemId,_that.productName,_that.optionName,_that.unitPrice,_that.quantity,_that.claimedQuantity,_that.refundAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClaimItemModel implements ClaimItemModel {
  const _ClaimItemModel({required this.id, required this.orderItemId, required this.productName, required this.optionName, required this.unitPrice, required this.quantity, required this.claimedQuantity, required this.refundAmount});
  factory _ClaimItemModel.fromJson(Map<String, dynamic> json) => _$ClaimItemModelFromJson(json);

@override final  int id;
@override final  int orderItemId;
@override final  String productName;
@override final  String optionName;
@override final  int unitPrice;
@override final  int quantity;
@override final  int claimedQuantity;
@override final  int refundAmount;

/// Create a copy of ClaimItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimItemModelCopyWith<_ClaimItemModel> get copyWith => __$ClaimItemModelCopyWithImpl<_ClaimItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClaimItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderItemId, orderItemId) || other.orderItemId == orderItemId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.optionName, optionName) || other.optionName == optionName)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.claimedQuantity, claimedQuantity) || other.claimedQuantity == claimedQuantity)&&(identical(other.refundAmount, refundAmount) || other.refundAmount == refundAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderItemId,productName,optionName,unitPrice,quantity,claimedQuantity,refundAmount);

@override
String toString() {
  return 'ClaimItemModel(id: $id, orderItemId: $orderItemId, productName: $productName, optionName: $optionName, unitPrice: $unitPrice, quantity: $quantity, claimedQuantity: $claimedQuantity, refundAmount: $refundAmount)';
}


}

/// @nodoc
abstract mixin class _$ClaimItemModelCopyWith<$Res> implements $ClaimItemModelCopyWith<$Res> {
  factory _$ClaimItemModelCopyWith(_ClaimItemModel value, $Res Function(_ClaimItemModel) _then) = __$ClaimItemModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int orderItemId, String productName, String optionName, int unitPrice, int quantity, int claimedQuantity, int refundAmount
});




}
/// @nodoc
class __$ClaimItemModelCopyWithImpl<$Res>
    implements _$ClaimItemModelCopyWith<$Res> {
  __$ClaimItemModelCopyWithImpl(this._self, this._then);

  final _ClaimItemModel _self;
  final $Res Function(_ClaimItemModel) _then;

/// Create a copy of ClaimItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderItemId = null,Object? productName = null,Object? optionName = null,Object? unitPrice = null,Object? quantity = null,Object? claimedQuantity = null,Object? refundAmount = null,}) {
  return _then(_ClaimItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderItemId: null == orderItemId ? _self.orderItemId : orderItemId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,optionName: null == optionName ? _self.optionName : optionName // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,claimedQuantity: null == claimedQuantity ? _self.claimedQuantity : claimedQuantity // ignore: cast_nullable_to_non_nullable
as int,refundAmount: null == refundAmount ? _self.refundAmount : refundAmount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ClaimStatusHistoryModel {

 int get id; String get status; String get memo;@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime get createdAt;
/// Create a copy of ClaimStatusHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimStatusHistoryModelCopyWith<ClaimStatusHistoryModel> get copyWith => _$ClaimStatusHistoryModelCopyWithImpl<ClaimStatusHistoryModel>(this as ClaimStatusHistoryModel, _$identity);

  /// Serializes this ClaimStatusHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimStatusHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,memo,createdAt);

@override
String toString() {
  return 'ClaimStatusHistoryModel(id: $id, status: $status, memo: $memo, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ClaimStatusHistoryModelCopyWith<$Res>  {
  factory $ClaimStatusHistoryModelCopyWith(ClaimStatusHistoryModel value, $Res Function(ClaimStatusHistoryModel) _then) = _$ClaimStatusHistoryModelCopyWithImpl;
@useResult
$Res call({
 int id, String status, String memo,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime createdAt
});




}
/// @nodoc
class _$ClaimStatusHistoryModelCopyWithImpl<$Res>
    implements $ClaimStatusHistoryModelCopyWith<$Res> {
  _$ClaimStatusHistoryModelCopyWithImpl(this._self, this._then);

  final ClaimStatusHistoryModel _self;
  final $Res Function(ClaimStatusHistoryModel) _then;

/// Create a copy of ClaimStatusHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? memo = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,memo: null == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ClaimStatusHistoryModel].
extension ClaimStatusHistoryModelPatterns on ClaimStatusHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimStatusHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimStatusHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimStatusHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _ClaimStatusHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimStatusHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimStatusHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status,  String memo, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimStatusHistoryModel() when $default != null:
return $default(_that.id,_that.status,_that.memo,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status,  String memo, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ClaimStatusHistoryModel():
return $default(_that.id,_that.status,_that.memo,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status,  String memo, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ClaimStatusHistoryModel() when $default != null:
return $default(_that.id,_that.status,_that.memo,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClaimStatusHistoryModel implements ClaimStatusHistoryModel {
  const _ClaimStatusHistoryModel({required this.id, required this.status, required this.memo, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) required this.createdAt});
  factory _ClaimStatusHistoryModel.fromJson(Map<String, dynamic> json) => _$ClaimStatusHistoryModelFromJson(json);

@override final  int id;
@override final  String status;
@override final  String memo;
@override@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) final  DateTime createdAt;

/// Create a copy of ClaimStatusHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimStatusHistoryModelCopyWith<_ClaimStatusHistoryModel> get copyWith => __$ClaimStatusHistoryModelCopyWithImpl<_ClaimStatusHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClaimStatusHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimStatusHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,memo,createdAt);

@override
String toString() {
  return 'ClaimStatusHistoryModel(id: $id, status: $status, memo: $memo, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ClaimStatusHistoryModelCopyWith<$Res> implements $ClaimStatusHistoryModelCopyWith<$Res> {
  factory _$ClaimStatusHistoryModelCopyWith(_ClaimStatusHistoryModel value, $Res Function(_ClaimStatusHistoryModel) _then) = __$ClaimStatusHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String status, String memo,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime createdAt
});




}
/// @nodoc
class __$ClaimStatusHistoryModelCopyWithImpl<$Res>
    implements _$ClaimStatusHistoryModelCopyWith<$Res> {
  __$ClaimStatusHistoryModelCopyWithImpl(this._self, this._then);

  final _ClaimStatusHistoryModel _self;
  final $Res Function(_ClaimStatusHistoryModel) _then;

/// Create a copy of ClaimStatusHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? memo = null,Object? createdAt = null,}) {
  return _then(_ClaimStatusHistoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,memo: null == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ClaimTrackingEventModel {

 String get timeString; String get where; String get kind; int get level;
/// Create a copy of ClaimTrackingEventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimTrackingEventModelCopyWith<ClaimTrackingEventModel> get copyWith => _$ClaimTrackingEventModelCopyWithImpl<ClaimTrackingEventModel>(this as ClaimTrackingEventModel, _$identity);

  /// Serializes this ClaimTrackingEventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimTrackingEventModel&&(identical(other.timeString, timeString) || other.timeString == timeString)&&(identical(other.where, where) || other.where == where)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timeString,where,kind,level);

@override
String toString() {
  return 'ClaimTrackingEventModel(timeString: $timeString, where: $where, kind: $kind, level: $level)';
}


}

/// @nodoc
abstract mixin class $ClaimTrackingEventModelCopyWith<$Res>  {
  factory $ClaimTrackingEventModelCopyWith(ClaimTrackingEventModel value, $Res Function(ClaimTrackingEventModel) _then) = _$ClaimTrackingEventModelCopyWithImpl;
@useResult
$Res call({
 String timeString, String where, String kind, int level
});




}
/// @nodoc
class _$ClaimTrackingEventModelCopyWithImpl<$Res>
    implements $ClaimTrackingEventModelCopyWith<$Res> {
  _$ClaimTrackingEventModelCopyWithImpl(this._self, this._then);

  final ClaimTrackingEventModel _self;
  final $Res Function(ClaimTrackingEventModel) _then;

/// Create a copy of ClaimTrackingEventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timeString = null,Object? where = null,Object? kind = null,Object? level = null,}) {
  return _then(_self.copyWith(
timeString: null == timeString ? _self.timeString : timeString // ignore: cast_nullable_to_non_nullable
as String,where: null == where ? _self.where : where // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClaimTrackingEventModel].
extension ClaimTrackingEventModelPatterns on ClaimTrackingEventModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimTrackingEventModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimTrackingEventModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimTrackingEventModel value)  $default,){
final _that = this;
switch (_that) {
case _ClaimTrackingEventModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimTrackingEventModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimTrackingEventModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String timeString,  String where,  String kind,  int level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimTrackingEventModel() when $default != null:
return $default(_that.timeString,_that.where,_that.kind,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String timeString,  String where,  String kind,  int level)  $default,) {final _that = this;
switch (_that) {
case _ClaimTrackingEventModel():
return $default(_that.timeString,_that.where,_that.kind,_that.level);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String timeString,  String where,  String kind,  int level)?  $default,) {final _that = this;
switch (_that) {
case _ClaimTrackingEventModel() when $default != null:
return $default(_that.timeString,_that.where,_that.kind,_that.level);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClaimTrackingEventModel implements ClaimTrackingEventModel {
  const _ClaimTrackingEventModel({required this.timeString, required this.where, required this.kind, required this.level});
  factory _ClaimTrackingEventModel.fromJson(Map<String, dynamic> json) => _$ClaimTrackingEventModelFromJson(json);

@override final  String timeString;
@override final  String where;
@override final  String kind;
@override final  int level;

/// Create a copy of ClaimTrackingEventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimTrackingEventModelCopyWith<_ClaimTrackingEventModel> get copyWith => __$ClaimTrackingEventModelCopyWithImpl<_ClaimTrackingEventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClaimTrackingEventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimTrackingEventModel&&(identical(other.timeString, timeString) || other.timeString == timeString)&&(identical(other.where, where) || other.where == where)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timeString,where,kind,level);

@override
String toString() {
  return 'ClaimTrackingEventModel(timeString: $timeString, where: $where, kind: $kind, level: $level)';
}


}

/// @nodoc
abstract mixin class _$ClaimTrackingEventModelCopyWith<$Res> implements $ClaimTrackingEventModelCopyWith<$Res> {
  factory _$ClaimTrackingEventModelCopyWith(_ClaimTrackingEventModel value, $Res Function(_ClaimTrackingEventModel) _then) = __$ClaimTrackingEventModelCopyWithImpl;
@override @useResult
$Res call({
 String timeString, String where, String kind, int level
});




}
/// @nodoc
class __$ClaimTrackingEventModelCopyWithImpl<$Res>
    implements _$ClaimTrackingEventModelCopyWith<$Res> {
  __$ClaimTrackingEventModelCopyWithImpl(this._self, this._then);

  final _ClaimTrackingEventModel _self;
  final $Res Function(_ClaimTrackingEventModel) _then;

/// Create a copy of ClaimTrackingEventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timeString = null,Object? where = null,Object? kind = null,Object? level = null,}) {
  return _then(_ClaimTrackingEventModel(
timeString: null == timeString ? _self.timeString : timeString // ignore: cast_nullable_to_non_nullable
as String,where: null == where ? _self.where : where // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
