// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderSummaryModel {

 int get total; int get ordered; int get confirmed; int get shipped; int get delivered; int get claimInProgress;
/// Create a copy of OrderSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderSummaryModelCopyWith<OrderSummaryModel> get copyWith => _$OrderSummaryModelCopyWithImpl<OrderSummaryModel>(this as OrderSummaryModel, _$identity);

  /// Serializes this OrderSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderSummaryModel&&(identical(other.total, total) || other.total == total)&&(identical(other.ordered, ordered) || other.ordered == ordered)&&(identical(other.confirmed, confirmed) || other.confirmed == confirmed)&&(identical(other.shipped, shipped) || other.shipped == shipped)&&(identical(other.delivered, delivered) || other.delivered == delivered)&&(identical(other.claimInProgress, claimInProgress) || other.claimInProgress == claimInProgress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,ordered,confirmed,shipped,delivered,claimInProgress);

@override
String toString() {
  return 'OrderSummaryModel(total: $total, ordered: $ordered, confirmed: $confirmed, shipped: $shipped, delivered: $delivered, claimInProgress: $claimInProgress)';
}


}

/// @nodoc
abstract mixin class $OrderSummaryModelCopyWith<$Res>  {
  factory $OrderSummaryModelCopyWith(OrderSummaryModel value, $Res Function(OrderSummaryModel) _then) = _$OrderSummaryModelCopyWithImpl;
@useResult
$Res call({
 int total, int ordered, int confirmed, int shipped, int delivered, int claimInProgress
});




}
/// @nodoc
class _$OrderSummaryModelCopyWithImpl<$Res>
    implements $OrderSummaryModelCopyWith<$Res> {
  _$OrderSummaryModelCopyWithImpl(this._self, this._then);

  final OrderSummaryModel _self;
  final $Res Function(OrderSummaryModel) _then;

/// Create a copy of OrderSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? ordered = null,Object? confirmed = null,Object? shipped = null,Object? delivered = null,Object? claimInProgress = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,ordered: null == ordered ? _self.ordered : ordered // ignore: cast_nullable_to_non_nullable
as int,confirmed: null == confirmed ? _self.confirmed : confirmed // ignore: cast_nullable_to_non_nullable
as int,shipped: null == shipped ? _self.shipped : shipped // ignore: cast_nullable_to_non_nullable
as int,delivered: null == delivered ? _self.delivered : delivered // ignore: cast_nullable_to_non_nullable
as int,claimInProgress: null == claimInProgress ? _self.claimInProgress : claimInProgress // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderSummaryModel].
extension OrderSummaryModelPatterns on OrderSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int ordered,  int confirmed,  int shipped,  int delivered,  int claimInProgress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderSummaryModel() when $default != null:
return $default(_that.total,_that.ordered,_that.confirmed,_that.shipped,_that.delivered,_that.claimInProgress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int ordered,  int confirmed,  int shipped,  int delivered,  int claimInProgress)  $default,) {final _that = this;
switch (_that) {
case _OrderSummaryModel():
return $default(_that.total,_that.ordered,_that.confirmed,_that.shipped,_that.delivered,_that.claimInProgress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int ordered,  int confirmed,  int shipped,  int delivered,  int claimInProgress)?  $default,) {final _that = this;
switch (_that) {
case _OrderSummaryModel() when $default != null:
return $default(_that.total,_that.ordered,_that.confirmed,_that.shipped,_that.delivered,_that.claimInProgress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderSummaryModel implements OrderSummaryModel {
  const _OrderSummaryModel({required this.total, required this.ordered, required this.confirmed, required this.shipped, required this.delivered, required this.claimInProgress});
  factory _OrderSummaryModel.fromJson(Map<String, dynamic> json) => _$OrderSummaryModelFromJson(json);

@override final  int total;
@override final  int ordered;
@override final  int confirmed;
@override final  int shipped;
@override final  int delivered;
@override final  int claimInProgress;

/// Create a copy of OrderSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderSummaryModelCopyWith<_OrderSummaryModel> get copyWith => __$OrderSummaryModelCopyWithImpl<_OrderSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderSummaryModel&&(identical(other.total, total) || other.total == total)&&(identical(other.ordered, ordered) || other.ordered == ordered)&&(identical(other.confirmed, confirmed) || other.confirmed == confirmed)&&(identical(other.shipped, shipped) || other.shipped == shipped)&&(identical(other.delivered, delivered) || other.delivered == delivered)&&(identical(other.claimInProgress, claimInProgress) || other.claimInProgress == claimInProgress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,ordered,confirmed,shipped,delivered,claimInProgress);

@override
String toString() {
  return 'OrderSummaryModel(total: $total, ordered: $ordered, confirmed: $confirmed, shipped: $shipped, delivered: $delivered, claimInProgress: $claimInProgress)';
}


}

/// @nodoc
abstract mixin class _$OrderSummaryModelCopyWith<$Res> implements $OrderSummaryModelCopyWith<$Res> {
  factory _$OrderSummaryModelCopyWith(_OrderSummaryModel value, $Res Function(_OrderSummaryModel) _then) = __$OrderSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 int total, int ordered, int confirmed, int shipped, int delivered, int claimInProgress
});




}
/// @nodoc
class __$OrderSummaryModelCopyWithImpl<$Res>
    implements _$OrderSummaryModelCopyWith<$Res> {
  __$OrderSummaryModelCopyWithImpl(this._self, this._then);

  final _OrderSummaryModel _self;
  final $Res Function(_OrderSummaryModel) _then;

/// Create a copy of OrderSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? ordered = null,Object? confirmed = null,Object? shipped = null,Object? delivered = null,Object? claimInProgress = null,}) {
  return _then(_OrderSummaryModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,ordered: null == ordered ? _self.ordered : ordered // ignore: cast_nullable_to_non_nullable
as int,confirmed: null == confirmed ? _self.confirmed : confirmed // ignore: cast_nullable_to_non_nullable
as int,shipped: null == shipped ? _self.shipped : shipped // ignore: cast_nullable_to_non_nullable
as int,delivered: null == delivered ? _self.delivered : delivered // ignore: cast_nullable_to_non_nullable
as int,claimInProgress: null == claimInProgress ? _self.claimInProgress : claimInProgress // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
