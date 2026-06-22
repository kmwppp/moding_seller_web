// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClaimModel {

 int get id; int get orderId; String get claimCode; String get productName;@JsonKey(unknownEnumValue: ClaimType.CONDITION) ClaimType get claimType; String get claimReason;@JsonKey(unknownEnumValue: ClaimStatus.requested) ClaimStatus get status; String get resolution;// @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)
// required DateTime appealDeadlineAt,
@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime get createdAt;
/// Create a copy of ClaimModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimModelCopyWith<ClaimModel> get copyWith => _$ClaimModelCopyWithImpl<ClaimModel>(this as ClaimModel, _$identity);

  /// Serializes this ClaimModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.claimCode, claimCode) || other.claimCode == claimCode)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.claimType, claimType) || other.claimType == claimType)&&(identical(other.claimReason, claimReason) || other.claimReason == claimReason)&&(identical(other.status, status) || other.status == status)&&(identical(other.resolution, resolution) || other.resolution == resolution)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,claimCode,productName,claimType,claimReason,status,resolution,createdAt);

@override
String toString() {
  return 'ClaimModel(id: $id, orderId: $orderId, claimCode: $claimCode, productName: $productName, claimType: $claimType, claimReason: $claimReason, status: $status, resolution: $resolution, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ClaimModelCopyWith<$Res>  {
  factory $ClaimModelCopyWith(ClaimModel value, $Res Function(ClaimModel) _then) = _$ClaimModelCopyWithImpl;
@useResult
$Res call({
 int id, int orderId, String claimCode, String productName,@JsonKey(unknownEnumValue: ClaimType.CONDITION) ClaimType claimType, String claimReason,@JsonKey(unknownEnumValue: ClaimStatus.requested) ClaimStatus status, String resolution,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime createdAt
});




}
/// @nodoc
class _$ClaimModelCopyWithImpl<$Res>
    implements $ClaimModelCopyWith<$Res> {
  _$ClaimModelCopyWithImpl(this._self, this._then);

  final ClaimModel _self;
  final $Res Function(ClaimModel) _then;

/// Create a copy of ClaimModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? claimCode = null,Object? productName = null,Object? claimType = null,Object? claimReason = null,Object? status = null,Object? resolution = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,claimCode: null == claimCode ? _self.claimCode : claimCode // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,claimType: null == claimType ? _self.claimType : claimType // ignore: cast_nullable_to_non_nullable
as ClaimType,claimReason: null == claimReason ? _self.claimReason : claimReason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ClaimStatus,resolution: null == resolution ? _self.resolution : resolution // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ClaimModel].
extension ClaimModelPatterns on ClaimModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimModel value)  $default,){
final _that = this;
switch (_that) {
case _ClaimModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int orderId,  String claimCode,  String productName, @JsonKey(unknownEnumValue: ClaimType.CONDITION)  ClaimType claimType,  String claimReason, @JsonKey(unknownEnumValue: ClaimStatus.requested)  ClaimStatus status,  String resolution, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimModel() when $default != null:
return $default(_that.id,_that.orderId,_that.claimCode,_that.productName,_that.claimType,_that.claimReason,_that.status,_that.resolution,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int orderId,  String claimCode,  String productName, @JsonKey(unknownEnumValue: ClaimType.CONDITION)  ClaimType claimType,  String claimReason, @JsonKey(unknownEnumValue: ClaimStatus.requested)  ClaimStatus status,  String resolution, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ClaimModel():
return $default(_that.id,_that.orderId,_that.claimCode,_that.productName,_that.claimType,_that.claimReason,_that.status,_that.resolution,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int orderId,  String claimCode,  String productName, @JsonKey(unknownEnumValue: ClaimType.CONDITION)  ClaimType claimType,  String claimReason, @JsonKey(unknownEnumValue: ClaimStatus.requested)  ClaimStatus status,  String resolution, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ClaimModel() when $default != null:
return $default(_that.id,_that.orderId,_that.claimCode,_that.productName,_that.claimType,_that.claimReason,_that.status,_that.resolution,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClaimModel implements ClaimModel {
  const _ClaimModel({this.id = 0, this.orderId = 0, this.claimCode = '', this.productName = '', @JsonKey(unknownEnumValue: ClaimType.CONDITION) this.claimType = ClaimType.CONDITION, this.claimReason = '', @JsonKey(unknownEnumValue: ClaimStatus.requested) this.status = ClaimStatus.requested, this.resolution = '', @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) required this.createdAt});
  factory _ClaimModel.fromJson(Map<String, dynamic> json) => _$ClaimModelFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int orderId;
@override@JsonKey() final  String claimCode;
@override@JsonKey() final  String productName;
@override@JsonKey(unknownEnumValue: ClaimType.CONDITION) final  ClaimType claimType;
@override@JsonKey() final  String claimReason;
@override@JsonKey(unknownEnumValue: ClaimStatus.requested) final  ClaimStatus status;
@override@JsonKey() final  String resolution;
// @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)
// required DateTime appealDeadlineAt,
@override@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) final  DateTime createdAt;

/// Create a copy of ClaimModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimModelCopyWith<_ClaimModel> get copyWith => __$ClaimModelCopyWithImpl<_ClaimModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClaimModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.claimCode, claimCode) || other.claimCode == claimCode)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.claimType, claimType) || other.claimType == claimType)&&(identical(other.claimReason, claimReason) || other.claimReason == claimReason)&&(identical(other.status, status) || other.status == status)&&(identical(other.resolution, resolution) || other.resolution == resolution)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,claimCode,productName,claimType,claimReason,status,resolution,createdAt);

@override
String toString() {
  return 'ClaimModel(id: $id, orderId: $orderId, claimCode: $claimCode, productName: $productName, claimType: $claimType, claimReason: $claimReason, status: $status, resolution: $resolution, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ClaimModelCopyWith<$Res> implements $ClaimModelCopyWith<$Res> {
  factory _$ClaimModelCopyWith(_ClaimModel value, $Res Function(_ClaimModel) _then) = __$ClaimModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int orderId, String claimCode, String productName,@JsonKey(unknownEnumValue: ClaimType.CONDITION) ClaimType claimType, String claimReason,@JsonKey(unknownEnumValue: ClaimStatus.requested) ClaimStatus status, String resolution,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime createdAt
});




}
/// @nodoc
class __$ClaimModelCopyWithImpl<$Res>
    implements _$ClaimModelCopyWith<$Res> {
  __$ClaimModelCopyWithImpl(this._self, this._then);

  final _ClaimModel _self;
  final $Res Function(_ClaimModel) _then;

/// Create a copy of ClaimModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? claimCode = null,Object? productName = null,Object? claimType = null,Object? claimReason = null,Object? status = null,Object? resolution = null,Object? createdAt = null,}) {
  return _then(_ClaimModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,claimCode: null == claimCode ? _self.claimCode : claimCode // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,claimType: null == claimType ? _self.claimType : claimType // ignore: cast_nullable_to_non_nullable
as ClaimType,claimReason: null == claimReason ? _self.claimReason : claimReason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ClaimStatus,resolution: null == resolution ? _self.resolution : resolution // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
