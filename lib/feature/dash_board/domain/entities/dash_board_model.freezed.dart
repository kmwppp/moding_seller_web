// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dash_board_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashBoardModel {

 DashboardData get data;
/// Create a copy of DashBoardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashBoardModelCopyWith<DashBoardModel> get copyWith => _$DashBoardModelCopyWithImpl<DashBoardModel>(this as DashBoardModel, _$identity);

  /// Serializes this DashBoardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashBoardModel&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'DashBoardModel(data: $data)';
}


}

/// @nodoc
abstract mixin class $DashBoardModelCopyWith<$Res>  {
  factory $DashBoardModelCopyWith(DashBoardModel value, $Res Function(DashBoardModel) _then) = _$DashBoardModelCopyWithImpl;
@useResult
$Res call({
 DashboardData data
});


$DashboardDataCopyWith<$Res> get data;

}
/// @nodoc
class _$DashBoardModelCopyWithImpl<$Res>
    implements $DashBoardModelCopyWith<$Res> {
  _$DashBoardModelCopyWithImpl(this._self, this._then);

  final DashBoardModel _self;
  final $Res Function(DashBoardModel) _then;

/// Create a copy of DashBoardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DashboardData,
  ));
}
/// Create a copy of DashBoardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardDataCopyWith<$Res> get data {
  
  return $DashboardDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashBoardModel].
extension DashBoardModelPatterns on DashBoardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashBoardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashBoardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashBoardModel value)  $default,){
final _that = this;
switch (_that) {
case _DashBoardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashBoardModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashBoardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DashboardData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashBoardModel() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DashboardData data)  $default,) {final _that = this;
switch (_that) {
case _DashBoardModel():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DashboardData data)?  $default,) {final _that = this;
switch (_that) {
case _DashBoardModel() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashBoardModel implements DashBoardModel {
  const _DashBoardModel({required this.data});
  factory _DashBoardModel.fromJson(Map<String, dynamic> json) => _$DashBoardModelFromJson(json);

@override final  DashboardData data;

/// Create a copy of DashBoardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashBoardModelCopyWith<_DashBoardModel> get copyWith => __$DashBoardModelCopyWithImpl<_DashBoardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashBoardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashBoardModel&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'DashBoardModel(data: $data)';
}


}

/// @nodoc
abstract mixin class _$DashBoardModelCopyWith<$Res> implements $DashBoardModelCopyWith<$Res> {
  factory _$DashBoardModelCopyWith(_DashBoardModel value, $Res Function(_DashBoardModel) _then) = __$DashBoardModelCopyWithImpl;
@override @useResult
$Res call({
 DashboardData data
});


@override $DashboardDataCopyWith<$Res> get data;

}
/// @nodoc
class __$DashBoardModelCopyWithImpl<$Res>
    implements _$DashBoardModelCopyWith<$Res> {
  __$DashBoardModelCopyWithImpl(this._self, this._then);

  final _DashBoardModel _self;
  final $Res Function(_DashBoardModel) _then;

/// Create a copy of DashBoardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_DashBoardModel(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DashboardData,
  ));
}

/// Create a copy of DashBoardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardDataCopyWith<$Res> get data {
  
  return $DashboardDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
