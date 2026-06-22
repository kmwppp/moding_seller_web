// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_product_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyProductSummaryModel {

 int get total; int get active; int get inactive;
/// Create a copy of MyProductSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyProductSummaryModelCopyWith<MyProductSummaryModel> get copyWith => _$MyProductSummaryModelCopyWithImpl<MyProductSummaryModel>(this as MyProductSummaryModel, _$identity);

  /// Serializes this MyProductSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyProductSummaryModel&&(identical(other.total, total) || other.total == total)&&(identical(other.active, active) || other.active == active)&&(identical(other.inactive, inactive) || other.inactive == inactive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,active,inactive);

@override
String toString() {
  return 'MyProductSummaryModel(total: $total, active: $active, inactive: $inactive)';
}


}

/// @nodoc
abstract mixin class $MyProductSummaryModelCopyWith<$Res>  {
  factory $MyProductSummaryModelCopyWith(MyProductSummaryModel value, $Res Function(MyProductSummaryModel) _then) = _$MyProductSummaryModelCopyWithImpl;
@useResult
$Res call({
 int total, int active, int inactive
});




}
/// @nodoc
class _$MyProductSummaryModelCopyWithImpl<$Res>
    implements $MyProductSummaryModelCopyWith<$Res> {
  _$MyProductSummaryModelCopyWithImpl(this._self, this._then);

  final MyProductSummaryModel _self;
  final $Res Function(MyProductSummaryModel) _then;

/// Create a copy of MyProductSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? active = null,Object? inactive = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,inactive: null == inactive ? _self.inactive : inactive // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MyProductSummaryModel].
extension MyProductSummaryModelPatterns on MyProductSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyProductSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyProductSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyProductSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _MyProductSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyProductSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _MyProductSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int active,  int inactive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyProductSummaryModel() when $default != null:
return $default(_that.total,_that.active,_that.inactive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int active,  int inactive)  $default,) {final _that = this;
switch (_that) {
case _MyProductSummaryModel():
return $default(_that.total,_that.active,_that.inactive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int active,  int inactive)?  $default,) {final _that = this;
switch (_that) {
case _MyProductSummaryModel() when $default != null:
return $default(_that.total,_that.active,_that.inactive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyProductSummaryModel implements MyProductSummaryModel {
  const _MyProductSummaryModel({required this.total, required this.active, required this.inactive});
  factory _MyProductSummaryModel.fromJson(Map<String, dynamic> json) => _$MyProductSummaryModelFromJson(json);

@override final  int total;
@override final  int active;
@override final  int inactive;

/// Create a copy of MyProductSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyProductSummaryModelCopyWith<_MyProductSummaryModel> get copyWith => __$MyProductSummaryModelCopyWithImpl<_MyProductSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyProductSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyProductSummaryModel&&(identical(other.total, total) || other.total == total)&&(identical(other.active, active) || other.active == active)&&(identical(other.inactive, inactive) || other.inactive == inactive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,active,inactive);

@override
String toString() {
  return 'MyProductSummaryModel(total: $total, active: $active, inactive: $inactive)';
}


}

/// @nodoc
abstract mixin class _$MyProductSummaryModelCopyWith<$Res> implements $MyProductSummaryModelCopyWith<$Res> {
  factory _$MyProductSummaryModelCopyWith(_MyProductSummaryModel value, $Res Function(_MyProductSummaryModel) _then) = __$MyProductSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 int total, int active, int inactive
});




}
/// @nodoc
class __$MyProductSummaryModelCopyWithImpl<$Res>
    implements _$MyProductSummaryModelCopyWith<$Res> {
  __$MyProductSummaryModelCopyWithImpl(this._self, this._then);

  final _MyProductSummaryModel _self;
  final $Res Function(_MyProductSummaryModel) _then;

/// Create a copy of MyProductSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? active = null,Object? inactive = null,}) {
  return _then(_MyProductSummaryModel(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,inactive: null == inactive ? _self.inactive : inactive // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
