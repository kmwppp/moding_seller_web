// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settlement_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettlementSummaryModel {

 int get pendingAmount; int get confirmedAmount; int get onHoldAmount; int get onHoldCount; DateTime get nextSettledAt; int get nextSettlementCount; int get nextSettlementAmount;
/// Create a copy of SettlementSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettlementSummaryModelCopyWith<SettlementSummaryModel> get copyWith => _$SettlementSummaryModelCopyWithImpl<SettlementSummaryModel>(this as SettlementSummaryModel, _$identity);

  /// Serializes this SettlementSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettlementSummaryModel&&(identical(other.pendingAmount, pendingAmount) || other.pendingAmount == pendingAmount)&&(identical(other.confirmedAmount, confirmedAmount) || other.confirmedAmount == confirmedAmount)&&(identical(other.onHoldAmount, onHoldAmount) || other.onHoldAmount == onHoldAmount)&&(identical(other.onHoldCount, onHoldCount) || other.onHoldCount == onHoldCount)&&(identical(other.nextSettledAt, nextSettledAt) || other.nextSettledAt == nextSettledAt)&&(identical(other.nextSettlementCount, nextSettlementCount) || other.nextSettlementCount == nextSettlementCount)&&(identical(other.nextSettlementAmount, nextSettlementAmount) || other.nextSettlementAmount == nextSettlementAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pendingAmount,confirmedAmount,onHoldAmount,onHoldCount,nextSettledAt,nextSettlementCount,nextSettlementAmount);

@override
String toString() {
  return 'SettlementSummaryModel(pendingAmount: $pendingAmount, confirmedAmount: $confirmedAmount, onHoldAmount: $onHoldAmount, onHoldCount: $onHoldCount, nextSettledAt: $nextSettledAt, nextSettlementCount: $nextSettlementCount, nextSettlementAmount: $nextSettlementAmount)';
}


}

/// @nodoc
abstract mixin class $SettlementSummaryModelCopyWith<$Res>  {
  factory $SettlementSummaryModelCopyWith(SettlementSummaryModel value, $Res Function(SettlementSummaryModel) _then) = _$SettlementSummaryModelCopyWithImpl;
@useResult
$Res call({
 int pendingAmount, int confirmedAmount, int onHoldAmount, int onHoldCount, DateTime nextSettledAt, int nextSettlementCount, int nextSettlementAmount
});




}
/// @nodoc
class _$SettlementSummaryModelCopyWithImpl<$Res>
    implements $SettlementSummaryModelCopyWith<$Res> {
  _$SettlementSummaryModelCopyWithImpl(this._self, this._then);

  final SettlementSummaryModel _self;
  final $Res Function(SettlementSummaryModel) _then;

/// Create a copy of SettlementSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pendingAmount = null,Object? confirmedAmount = null,Object? onHoldAmount = null,Object? onHoldCount = null,Object? nextSettledAt = null,Object? nextSettlementCount = null,Object? nextSettlementAmount = null,}) {
  return _then(_self.copyWith(
pendingAmount: null == pendingAmount ? _self.pendingAmount : pendingAmount // ignore: cast_nullable_to_non_nullable
as int,confirmedAmount: null == confirmedAmount ? _self.confirmedAmount : confirmedAmount // ignore: cast_nullable_to_non_nullable
as int,onHoldAmount: null == onHoldAmount ? _self.onHoldAmount : onHoldAmount // ignore: cast_nullable_to_non_nullable
as int,onHoldCount: null == onHoldCount ? _self.onHoldCount : onHoldCount // ignore: cast_nullable_to_non_nullable
as int,nextSettledAt: null == nextSettledAt ? _self.nextSettledAt : nextSettledAt // ignore: cast_nullable_to_non_nullable
as DateTime,nextSettlementCount: null == nextSettlementCount ? _self.nextSettlementCount : nextSettlementCount // ignore: cast_nullable_to_non_nullable
as int,nextSettlementAmount: null == nextSettlementAmount ? _self.nextSettlementAmount : nextSettlementAmount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SettlementSummaryModel].
extension SettlementSummaryModelPatterns on SettlementSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettlementSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettlementSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettlementSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _SettlementSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettlementSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _SettlementSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pendingAmount,  int confirmedAmount,  int onHoldAmount,  int onHoldCount,  DateTime nextSettledAt,  int nextSettlementCount,  int nextSettlementAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettlementSummaryModel() when $default != null:
return $default(_that.pendingAmount,_that.confirmedAmount,_that.onHoldAmount,_that.onHoldCount,_that.nextSettledAt,_that.nextSettlementCount,_that.nextSettlementAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pendingAmount,  int confirmedAmount,  int onHoldAmount,  int onHoldCount,  DateTime nextSettledAt,  int nextSettlementCount,  int nextSettlementAmount)  $default,) {final _that = this;
switch (_that) {
case _SettlementSummaryModel():
return $default(_that.pendingAmount,_that.confirmedAmount,_that.onHoldAmount,_that.onHoldCount,_that.nextSettledAt,_that.nextSettlementCount,_that.nextSettlementAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pendingAmount,  int confirmedAmount,  int onHoldAmount,  int onHoldCount,  DateTime nextSettledAt,  int nextSettlementCount,  int nextSettlementAmount)?  $default,) {final _that = this;
switch (_that) {
case _SettlementSummaryModel() when $default != null:
return $default(_that.pendingAmount,_that.confirmedAmount,_that.onHoldAmount,_that.onHoldCount,_that.nextSettledAt,_that.nextSettlementCount,_that.nextSettlementAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SettlementSummaryModel implements SettlementSummaryModel {
  const _SettlementSummaryModel({required this.pendingAmount, required this.confirmedAmount, required this.onHoldAmount, required this.onHoldCount, required this.nextSettledAt, required this.nextSettlementCount, required this.nextSettlementAmount});
  factory _SettlementSummaryModel.fromJson(Map<String, dynamic> json) => _$SettlementSummaryModelFromJson(json);

@override final  int pendingAmount;
@override final  int confirmedAmount;
@override final  int onHoldAmount;
@override final  int onHoldCount;
@override final  DateTime nextSettledAt;
@override final  int nextSettlementCount;
@override final  int nextSettlementAmount;

/// Create a copy of SettlementSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettlementSummaryModelCopyWith<_SettlementSummaryModel> get copyWith => __$SettlementSummaryModelCopyWithImpl<_SettlementSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettlementSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettlementSummaryModel&&(identical(other.pendingAmount, pendingAmount) || other.pendingAmount == pendingAmount)&&(identical(other.confirmedAmount, confirmedAmount) || other.confirmedAmount == confirmedAmount)&&(identical(other.onHoldAmount, onHoldAmount) || other.onHoldAmount == onHoldAmount)&&(identical(other.onHoldCount, onHoldCount) || other.onHoldCount == onHoldCount)&&(identical(other.nextSettledAt, nextSettledAt) || other.nextSettledAt == nextSettledAt)&&(identical(other.nextSettlementCount, nextSettlementCount) || other.nextSettlementCount == nextSettlementCount)&&(identical(other.nextSettlementAmount, nextSettlementAmount) || other.nextSettlementAmount == nextSettlementAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pendingAmount,confirmedAmount,onHoldAmount,onHoldCount,nextSettledAt,nextSettlementCount,nextSettlementAmount);

@override
String toString() {
  return 'SettlementSummaryModel(pendingAmount: $pendingAmount, confirmedAmount: $confirmedAmount, onHoldAmount: $onHoldAmount, onHoldCount: $onHoldCount, nextSettledAt: $nextSettledAt, nextSettlementCount: $nextSettlementCount, nextSettlementAmount: $nextSettlementAmount)';
}


}

/// @nodoc
abstract mixin class _$SettlementSummaryModelCopyWith<$Res> implements $SettlementSummaryModelCopyWith<$Res> {
  factory _$SettlementSummaryModelCopyWith(_SettlementSummaryModel value, $Res Function(_SettlementSummaryModel) _then) = __$SettlementSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 int pendingAmount, int confirmedAmount, int onHoldAmount, int onHoldCount, DateTime nextSettledAt, int nextSettlementCount, int nextSettlementAmount
});




}
/// @nodoc
class __$SettlementSummaryModelCopyWithImpl<$Res>
    implements _$SettlementSummaryModelCopyWith<$Res> {
  __$SettlementSummaryModelCopyWithImpl(this._self, this._then);

  final _SettlementSummaryModel _self;
  final $Res Function(_SettlementSummaryModel) _then;

/// Create a copy of SettlementSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pendingAmount = null,Object? confirmedAmount = null,Object? onHoldAmount = null,Object? onHoldCount = null,Object? nextSettledAt = null,Object? nextSettlementCount = null,Object? nextSettlementAmount = null,}) {
  return _then(_SettlementSummaryModel(
pendingAmount: null == pendingAmount ? _self.pendingAmount : pendingAmount // ignore: cast_nullable_to_non_nullable
as int,confirmedAmount: null == confirmedAmount ? _self.confirmedAmount : confirmedAmount // ignore: cast_nullable_to_non_nullable
as int,onHoldAmount: null == onHoldAmount ? _self.onHoldAmount : onHoldAmount // ignore: cast_nullable_to_non_nullable
as int,onHoldCount: null == onHoldCount ? _self.onHoldCount : onHoldCount // ignore: cast_nullable_to_non_nullable
as int,nextSettledAt: null == nextSettledAt ? _self.nextSettledAt : nextSettledAt // ignore: cast_nullable_to_non_nullable
as DateTime,nextSettlementCount: null == nextSettlementCount ? _self.nextSettlementCount : nextSettlementCount // ignore: cast_nullable_to_non_nullable
as int,nextSettlementAmount: null == nextSettlementAmount ? _self.nextSettlementAmount : nextSettlementAmount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
