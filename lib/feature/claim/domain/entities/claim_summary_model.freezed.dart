// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'claim_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClaimSummaryModel {

 int get requested; int get inProgress; int get completed;
/// Create a copy of ClaimSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimSummaryModelCopyWith<ClaimSummaryModel> get copyWith => _$ClaimSummaryModelCopyWithImpl<ClaimSummaryModel>(this as ClaimSummaryModel, _$identity);

  /// Serializes this ClaimSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimSummaryModel&&(identical(other.requested, requested) || other.requested == requested)&&(identical(other.inProgress, inProgress) || other.inProgress == inProgress)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requested,inProgress,completed);

@override
String toString() {
  return 'ClaimSummaryModel(requested: $requested, inProgress: $inProgress, completed: $completed)';
}


}

/// @nodoc
abstract mixin class $ClaimSummaryModelCopyWith<$Res>  {
  factory $ClaimSummaryModelCopyWith(ClaimSummaryModel value, $Res Function(ClaimSummaryModel) _then) = _$ClaimSummaryModelCopyWithImpl;
@useResult
$Res call({
 int requested, int inProgress, int completed
});




}
/// @nodoc
class _$ClaimSummaryModelCopyWithImpl<$Res>
    implements $ClaimSummaryModelCopyWith<$Res> {
  _$ClaimSummaryModelCopyWithImpl(this._self, this._then);

  final ClaimSummaryModel _self;
  final $Res Function(ClaimSummaryModel) _then;

/// Create a copy of ClaimSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requested = null,Object? inProgress = null,Object? completed = null,}) {
  return _then(_self.copyWith(
requested: null == requested ? _self.requested : requested // ignore: cast_nullable_to_non_nullable
as int,inProgress: null == inProgress ? _self.inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClaimSummaryModel].
extension ClaimSummaryModelPatterns on ClaimSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _ClaimSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int requested,  int inProgress,  int completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimSummaryModel() when $default != null:
return $default(_that.requested,_that.inProgress,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int requested,  int inProgress,  int completed)  $default,) {final _that = this;
switch (_that) {
case _ClaimSummaryModel():
return $default(_that.requested,_that.inProgress,_that.completed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int requested,  int inProgress,  int completed)?  $default,) {final _that = this;
switch (_that) {
case _ClaimSummaryModel() when $default != null:
return $default(_that.requested,_that.inProgress,_that.completed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClaimSummaryModel implements ClaimSummaryModel {
  const _ClaimSummaryModel({required this.requested, required this.inProgress, required this.completed});
  factory _ClaimSummaryModel.fromJson(Map<String, dynamic> json) => _$ClaimSummaryModelFromJson(json);

@override final  int requested;
@override final  int inProgress;
@override final  int completed;

/// Create a copy of ClaimSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimSummaryModelCopyWith<_ClaimSummaryModel> get copyWith => __$ClaimSummaryModelCopyWithImpl<_ClaimSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClaimSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimSummaryModel&&(identical(other.requested, requested) || other.requested == requested)&&(identical(other.inProgress, inProgress) || other.inProgress == inProgress)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requested,inProgress,completed);

@override
String toString() {
  return 'ClaimSummaryModel(requested: $requested, inProgress: $inProgress, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$ClaimSummaryModelCopyWith<$Res> implements $ClaimSummaryModelCopyWith<$Res> {
  factory _$ClaimSummaryModelCopyWith(_ClaimSummaryModel value, $Res Function(_ClaimSummaryModel) _then) = __$ClaimSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 int requested, int inProgress, int completed
});




}
/// @nodoc
class __$ClaimSummaryModelCopyWithImpl<$Res>
    implements _$ClaimSummaryModelCopyWith<$Res> {
  __$ClaimSummaryModelCopyWithImpl(this._self, this._then);

  final _ClaimSummaryModel _self;
  final $Res Function(_ClaimSummaryModel) _then;

/// Create a copy of ClaimSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requested = null,Object? inProgress = null,Object? completed = null,}) {
  return _then(_ClaimSummaryModel(
requested: null == requested ? _self.requested : requested // ignore: cast_nullable_to_non_nullable
as int,inProgress: null == inProgress ? _self.inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
