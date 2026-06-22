// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_required.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActionRequired {

 int get approvalPendingCount; int get readyToShipCount; int get shippingDelayedCount;
/// Create a copy of ActionRequired
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionRequiredCopyWith<ActionRequired> get copyWith => _$ActionRequiredCopyWithImpl<ActionRequired>(this as ActionRequired, _$identity);

  /// Serializes this ActionRequired to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionRequired&&(identical(other.approvalPendingCount, approvalPendingCount) || other.approvalPendingCount == approvalPendingCount)&&(identical(other.readyToShipCount, readyToShipCount) || other.readyToShipCount == readyToShipCount)&&(identical(other.shippingDelayedCount, shippingDelayedCount) || other.shippingDelayedCount == shippingDelayedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,approvalPendingCount,readyToShipCount,shippingDelayedCount);

@override
String toString() {
  return 'ActionRequired(approvalPendingCount: $approvalPendingCount, readyToShipCount: $readyToShipCount, shippingDelayedCount: $shippingDelayedCount)';
}


}

/// @nodoc
abstract mixin class $ActionRequiredCopyWith<$Res>  {
  factory $ActionRequiredCopyWith(ActionRequired value, $Res Function(ActionRequired) _then) = _$ActionRequiredCopyWithImpl;
@useResult
$Res call({
 int approvalPendingCount, int readyToShipCount, int shippingDelayedCount
});




}
/// @nodoc
class _$ActionRequiredCopyWithImpl<$Res>
    implements $ActionRequiredCopyWith<$Res> {
  _$ActionRequiredCopyWithImpl(this._self, this._then);

  final ActionRequired _self;
  final $Res Function(ActionRequired) _then;

/// Create a copy of ActionRequired
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? approvalPendingCount = null,Object? readyToShipCount = null,Object? shippingDelayedCount = null,}) {
  return _then(_self.copyWith(
approvalPendingCount: null == approvalPendingCount ? _self.approvalPendingCount : approvalPendingCount // ignore: cast_nullable_to_non_nullable
as int,readyToShipCount: null == readyToShipCount ? _self.readyToShipCount : readyToShipCount // ignore: cast_nullable_to_non_nullable
as int,shippingDelayedCount: null == shippingDelayedCount ? _self.shippingDelayedCount : shippingDelayedCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ActionRequired].
extension ActionRequiredPatterns on ActionRequired {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActionRequired value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActionRequired() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActionRequired value)  $default,){
final _that = this;
switch (_that) {
case _ActionRequired():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActionRequired value)?  $default,){
final _that = this;
switch (_that) {
case _ActionRequired() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int approvalPendingCount,  int readyToShipCount,  int shippingDelayedCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActionRequired() when $default != null:
return $default(_that.approvalPendingCount,_that.readyToShipCount,_that.shippingDelayedCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int approvalPendingCount,  int readyToShipCount,  int shippingDelayedCount)  $default,) {final _that = this;
switch (_that) {
case _ActionRequired():
return $default(_that.approvalPendingCount,_that.readyToShipCount,_that.shippingDelayedCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int approvalPendingCount,  int readyToShipCount,  int shippingDelayedCount)?  $default,) {final _that = this;
switch (_that) {
case _ActionRequired() when $default != null:
return $default(_that.approvalPendingCount,_that.readyToShipCount,_that.shippingDelayedCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActionRequired implements ActionRequired {
  const _ActionRequired({required this.approvalPendingCount, required this.readyToShipCount, required this.shippingDelayedCount});
  factory _ActionRequired.fromJson(Map<String, dynamic> json) => _$ActionRequiredFromJson(json);

@override final  int approvalPendingCount;
@override final  int readyToShipCount;
@override final  int shippingDelayedCount;

/// Create a copy of ActionRequired
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActionRequiredCopyWith<_ActionRequired> get copyWith => __$ActionRequiredCopyWithImpl<_ActionRequired>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActionRequiredToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActionRequired&&(identical(other.approvalPendingCount, approvalPendingCount) || other.approvalPendingCount == approvalPendingCount)&&(identical(other.readyToShipCount, readyToShipCount) || other.readyToShipCount == readyToShipCount)&&(identical(other.shippingDelayedCount, shippingDelayedCount) || other.shippingDelayedCount == shippingDelayedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,approvalPendingCount,readyToShipCount,shippingDelayedCount);

@override
String toString() {
  return 'ActionRequired(approvalPendingCount: $approvalPendingCount, readyToShipCount: $readyToShipCount, shippingDelayedCount: $shippingDelayedCount)';
}


}

/// @nodoc
abstract mixin class _$ActionRequiredCopyWith<$Res> implements $ActionRequiredCopyWith<$Res> {
  factory _$ActionRequiredCopyWith(_ActionRequired value, $Res Function(_ActionRequired) _then) = __$ActionRequiredCopyWithImpl;
@override @useResult
$Res call({
 int approvalPendingCount, int readyToShipCount, int shippingDelayedCount
});




}
/// @nodoc
class __$ActionRequiredCopyWithImpl<$Res>
    implements _$ActionRequiredCopyWith<$Res> {
  __$ActionRequiredCopyWithImpl(this._self, this._then);

  final _ActionRequired _self;
  final $Res Function(_ActionRequired) _then;

/// Create a copy of ActionRequired
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? approvalPendingCount = null,Object? readyToShipCount = null,Object? shippingDelayedCount = null,}) {
  return _then(_ActionRequired(
approvalPendingCount: null == approvalPendingCount ? _self.approvalPendingCount : approvalPendingCount // ignore: cast_nullable_to_non_nullable
as int,readyToShipCount: null == readyToShipCount ? _self.readyToShipCount : readyToShipCount // ignore: cast_nullable_to_non_nullable
as int,shippingDelayedCount: null == shippingDelayedCount ? _self.shippingDelayedCount : shippingDelayedCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
