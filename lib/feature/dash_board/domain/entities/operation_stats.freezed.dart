// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OperationStats {

 int get thisMonthSales; int get confirmedSettlementAmount; int get scheduledSettlementAmount; int get readyToShipCount; int get shippingCount;
/// Create a copy of OperationStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationStatsCopyWith<OperationStats> get copyWith => _$OperationStatsCopyWithImpl<OperationStats>(this as OperationStats, _$identity);

  /// Serializes this OperationStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationStats&&(identical(other.thisMonthSales, thisMonthSales) || other.thisMonthSales == thisMonthSales)&&(identical(other.confirmedSettlementAmount, confirmedSettlementAmount) || other.confirmedSettlementAmount == confirmedSettlementAmount)&&(identical(other.scheduledSettlementAmount, scheduledSettlementAmount) || other.scheduledSettlementAmount == scheduledSettlementAmount)&&(identical(other.readyToShipCount, readyToShipCount) || other.readyToShipCount == readyToShipCount)&&(identical(other.shippingCount, shippingCount) || other.shippingCount == shippingCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thisMonthSales,confirmedSettlementAmount,scheduledSettlementAmount,readyToShipCount,shippingCount);

@override
String toString() {
  return 'OperationStats(thisMonthSales: $thisMonthSales, confirmedSettlementAmount: $confirmedSettlementAmount, scheduledSettlementAmount: $scheduledSettlementAmount, readyToShipCount: $readyToShipCount, shippingCount: $shippingCount)';
}


}

/// @nodoc
abstract mixin class $OperationStatsCopyWith<$Res>  {
  factory $OperationStatsCopyWith(OperationStats value, $Res Function(OperationStats) _then) = _$OperationStatsCopyWithImpl;
@useResult
$Res call({
 int thisMonthSales, int confirmedSettlementAmount, int scheduledSettlementAmount, int readyToShipCount, int shippingCount
});




}
/// @nodoc
class _$OperationStatsCopyWithImpl<$Res>
    implements $OperationStatsCopyWith<$Res> {
  _$OperationStatsCopyWithImpl(this._self, this._then);

  final OperationStats _self;
  final $Res Function(OperationStats) _then;

/// Create a copy of OperationStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? thisMonthSales = null,Object? confirmedSettlementAmount = null,Object? scheduledSettlementAmount = null,Object? readyToShipCount = null,Object? shippingCount = null,}) {
  return _then(_self.copyWith(
thisMonthSales: null == thisMonthSales ? _self.thisMonthSales : thisMonthSales // ignore: cast_nullable_to_non_nullable
as int,confirmedSettlementAmount: null == confirmedSettlementAmount ? _self.confirmedSettlementAmount : confirmedSettlementAmount // ignore: cast_nullable_to_non_nullable
as int,scheduledSettlementAmount: null == scheduledSettlementAmount ? _self.scheduledSettlementAmount : scheduledSettlementAmount // ignore: cast_nullable_to_non_nullable
as int,readyToShipCount: null == readyToShipCount ? _self.readyToShipCount : readyToShipCount // ignore: cast_nullable_to_non_nullable
as int,shippingCount: null == shippingCount ? _self.shippingCount : shippingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OperationStats].
extension OperationStatsPatterns on OperationStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperationStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperationStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperationStats value)  $default,){
final _that = this;
switch (_that) {
case _OperationStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperationStats value)?  $default,){
final _that = this;
switch (_that) {
case _OperationStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int thisMonthSales,  int confirmedSettlementAmount,  int scheduledSettlementAmount,  int readyToShipCount,  int shippingCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperationStats() when $default != null:
return $default(_that.thisMonthSales,_that.confirmedSettlementAmount,_that.scheduledSettlementAmount,_that.readyToShipCount,_that.shippingCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int thisMonthSales,  int confirmedSettlementAmount,  int scheduledSettlementAmount,  int readyToShipCount,  int shippingCount)  $default,) {final _that = this;
switch (_that) {
case _OperationStats():
return $default(_that.thisMonthSales,_that.confirmedSettlementAmount,_that.scheduledSettlementAmount,_that.readyToShipCount,_that.shippingCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int thisMonthSales,  int confirmedSettlementAmount,  int scheduledSettlementAmount,  int readyToShipCount,  int shippingCount)?  $default,) {final _that = this;
switch (_that) {
case _OperationStats() when $default != null:
return $default(_that.thisMonthSales,_that.confirmedSettlementAmount,_that.scheduledSettlementAmount,_that.readyToShipCount,_that.shippingCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OperationStats implements OperationStats {
  const _OperationStats({required this.thisMonthSales, required this.confirmedSettlementAmount, required this.scheduledSettlementAmount, required this.readyToShipCount, required this.shippingCount});
  factory _OperationStats.fromJson(Map<String, dynamic> json) => _$OperationStatsFromJson(json);

@override final  int thisMonthSales;
@override final  int confirmedSettlementAmount;
@override final  int scheduledSettlementAmount;
@override final  int readyToShipCount;
@override final  int shippingCount;

/// Create a copy of OperationStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationStatsCopyWith<_OperationStats> get copyWith => __$OperationStatsCopyWithImpl<_OperationStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OperationStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationStats&&(identical(other.thisMonthSales, thisMonthSales) || other.thisMonthSales == thisMonthSales)&&(identical(other.confirmedSettlementAmount, confirmedSettlementAmount) || other.confirmedSettlementAmount == confirmedSettlementAmount)&&(identical(other.scheduledSettlementAmount, scheduledSettlementAmount) || other.scheduledSettlementAmount == scheduledSettlementAmount)&&(identical(other.readyToShipCount, readyToShipCount) || other.readyToShipCount == readyToShipCount)&&(identical(other.shippingCount, shippingCount) || other.shippingCount == shippingCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thisMonthSales,confirmedSettlementAmount,scheduledSettlementAmount,readyToShipCount,shippingCount);

@override
String toString() {
  return 'OperationStats(thisMonthSales: $thisMonthSales, confirmedSettlementAmount: $confirmedSettlementAmount, scheduledSettlementAmount: $scheduledSettlementAmount, readyToShipCount: $readyToShipCount, shippingCount: $shippingCount)';
}


}

/// @nodoc
abstract mixin class _$OperationStatsCopyWith<$Res> implements $OperationStatsCopyWith<$Res> {
  factory _$OperationStatsCopyWith(_OperationStats value, $Res Function(_OperationStats) _then) = __$OperationStatsCopyWithImpl;
@override @useResult
$Res call({
 int thisMonthSales, int confirmedSettlementAmount, int scheduledSettlementAmount, int readyToShipCount, int shippingCount
});




}
/// @nodoc
class __$OperationStatsCopyWithImpl<$Res>
    implements _$OperationStatsCopyWith<$Res> {
  __$OperationStatsCopyWithImpl(this._self, this._then);

  final _OperationStats _self;
  final $Res Function(_OperationStats) _then;

/// Create a copy of OperationStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thisMonthSales = null,Object? confirmedSettlementAmount = null,Object? scheduledSettlementAmount = null,Object? readyToShipCount = null,Object? shippingCount = null,}) {
  return _then(_OperationStats(
thisMonthSales: null == thisMonthSales ? _self.thisMonthSales : thisMonthSales // ignore: cast_nullable_to_non_nullable
as int,confirmedSettlementAmount: null == confirmedSettlementAmount ? _self.confirmedSettlementAmount : confirmedSettlementAmount // ignore: cast_nullable_to_non_nullable
as int,scheduledSettlementAmount: null == scheduledSettlementAmount ? _self.scheduledSettlementAmount : scheduledSettlementAmount // ignore: cast_nullable_to_non_nullable
as int,readyToShipCount: null == readyToShipCount ? _self.readyToShipCount : readyToShipCount // ignore: cast_nullable_to_non_nullable
as int,shippingCount: null == shippingCount ? _self.shippingCount : shippingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
