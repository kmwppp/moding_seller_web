// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settlement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettlementModel {

 int get id; String get settlementCode; num get finalAmount;@JsonKey(unknownEnumValue: SettlementStatusType.hold) SettlementStatusType get status;@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime? get settledAt;/// UI 전용 필드
 bool get isSelected; SettlementDetailModel? get detail;
/// Create a copy of SettlementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettlementModelCopyWith<SettlementModel> get copyWith => _$SettlementModelCopyWithImpl<SettlementModel>(this as SettlementModel, _$identity);

  /// Serializes this SettlementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettlementModel&&(identical(other.id, id) || other.id == id)&&(identical(other.settlementCode, settlementCode) || other.settlementCode == settlementCode)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.settledAt, settledAt) || other.settledAt == settledAt)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,settlementCode,finalAmount,status,settledAt,isSelected,detail);

@override
String toString() {
  return 'SettlementModel(id: $id, settlementCode: $settlementCode, finalAmount: $finalAmount, status: $status, settledAt: $settledAt, isSelected: $isSelected, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $SettlementModelCopyWith<$Res>  {
  factory $SettlementModelCopyWith(SettlementModel value, $Res Function(SettlementModel) _then) = _$SettlementModelCopyWithImpl;
@useResult
$Res call({
 int id, String settlementCode, num finalAmount,@JsonKey(unknownEnumValue: SettlementStatusType.hold) SettlementStatusType status,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime? settledAt, bool isSelected, SettlementDetailModel? detail
});


$SettlementDetailModelCopyWith<$Res>? get detail;

}
/// @nodoc
class _$SettlementModelCopyWithImpl<$Res>
    implements $SettlementModelCopyWith<$Res> {
  _$SettlementModelCopyWithImpl(this._self, this._then);

  final SettlementModel _self;
  final $Res Function(SettlementModel) _then;

/// Create a copy of SettlementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? settlementCode = null,Object? finalAmount = null,Object? status = null,Object? settledAt = freezed,Object? isSelected = null,Object? detail = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,settlementCode: null == settlementCode ? _self.settlementCode : settlementCode // ignore: cast_nullable_to_non_nullable
as String,finalAmount: null == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as num,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SettlementStatusType,settledAt: freezed == settledAt ? _self.settledAt : settledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as SettlementDetailModel?,
  ));
}
/// Create a copy of SettlementModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettlementDetailModelCopyWith<$Res>? get detail {
    if (_self.detail == null) {
    return null;
  }

  return $SettlementDetailModelCopyWith<$Res>(_self.detail!, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}


/// Adds pattern-matching-related methods to [SettlementModel].
extension SettlementModelPatterns on SettlementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettlementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettlementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettlementModel value)  $default,){
final _that = this;
switch (_that) {
case _SettlementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettlementModel value)?  $default,){
final _that = this;
switch (_that) {
case _SettlementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String settlementCode,  num finalAmount, @JsonKey(unknownEnumValue: SettlementStatusType.hold)  SettlementStatusType status, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime? settledAt,  bool isSelected,  SettlementDetailModel? detail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettlementModel() when $default != null:
return $default(_that.id,_that.settlementCode,_that.finalAmount,_that.status,_that.settledAt,_that.isSelected,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String settlementCode,  num finalAmount, @JsonKey(unknownEnumValue: SettlementStatusType.hold)  SettlementStatusType status, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime? settledAt,  bool isSelected,  SettlementDetailModel? detail)  $default,) {final _that = this;
switch (_that) {
case _SettlementModel():
return $default(_that.id,_that.settlementCode,_that.finalAmount,_that.status,_that.settledAt,_that.isSelected,_that.detail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String settlementCode,  num finalAmount, @JsonKey(unknownEnumValue: SettlementStatusType.hold)  SettlementStatusType status, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime? settledAt,  bool isSelected,  SettlementDetailModel? detail)?  $default,) {final _that = this;
switch (_that) {
case _SettlementModel() when $default != null:
return $default(_that.id,_that.settlementCode,_that.finalAmount,_that.status,_that.settledAt,_that.isSelected,_that.detail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettlementModel implements SettlementModel {
  const _SettlementModel({required this.id, required this.settlementCode, required this.finalAmount, @JsonKey(unknownEnumValue: SettlementStatusType.hold) this.status = SettlementStatusType.hold, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) this.settledAt, this.isSelected = false, this.detail});
  factory _SettlementModel.fromJson(Map<String, dynamic> json) => _$SettlementModelFromJson(json);

@override final  int id;
@override final  String settlementCode;
@override final  num finalAmount;
@override@JsonKey(unknownEnumValue: SettlementStatusType.hold) final  SettlementStatusType status;
@override@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) final  DateTime? settledAt;
/// UI 전용 필드
@override@JsonKey() final  bool isSelected;
@override final  SettlementDetailModel? detail;

/// Create a copy of SettlementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettlementModelCopyWith<_SettlementModel> get copyWith => __$SettlementModelCopyWithImpl<_SettlementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettlementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettlementModel&&(identical(other.id, id) || other.id == id)&&(identical(other.settlementCode, settlementCode) || other.settlementCode == settlementCode)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.settledAt, settledAt) || other.settledAt == settledAt)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.detail, detail) || other.detail == detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,settlementCode,finalAmount,status,settledAt,isSelected,detail);

@override
String toString() {
  return 'SettlementModel(id: $id, settlementCode: $settlementCode, finalAmount: $finalAmount, status: $status, settledAt: $settledAt, isSelected: $isSelected, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$SettlementModelCopyWith<$Res> implements $SettlementModelCopyWith<$Res> {
  factory _$SettlementModelCopyWith(_SettlementModel value, $Res Function(_SettlementModel) _then) = __$SettlementModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String settlementCode, num finalAmount,@JsonKey(unknownEnumValue: SettlementStatusType.hold) SettlementStatusType status,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime? settledAt, bool isSelected, SettlementDetailModel? detail
});


@override $SettlementDetailModelCopyWith<$Res>? get detail;

}
/// @nodoc
class __$SettlementModelCopyWithImpl<$Res>
    implements _$SettlementModelCopyWith<$Res> {
  __$SettlementModelCopyWithImpl(this._self, this._then);

  final _SettlementModel _self;
  final $Res Function(_SettlementModel) _then;

/// Create a copy of SettlementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? settlementCode = null,Object? finalAmount = null,Object? status = null,Object? settledAt = freezed,Object? isSelected = null,Object? detail = freezed,}) {
  return _then(_SettlementModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,settlementCode: null == settlementCode ? _self.settlementCode : settlementCode // ignore: cast_nullable_to_non_nullable
as String,finalAmount: null == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as num,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SettlementStatusType,settledAt: freezed == settledAt ? _self.settledAt : settledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as SettlementDetailModel?,
  ));
}

/// Create a copy of SettlementModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SettlementDetailModelCopyWith<$Res>? get detail {
    if (_self.detail == null) {
    return null;
  }

  return $SettlementDetailModelCopyWith<$Res>(_self.detail!, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}

// dart format on
