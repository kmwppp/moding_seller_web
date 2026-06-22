// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking_validation_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackingValidationResult {

 bool get success; String get message; TrackingValidationData? get data;
/// Create a copy of TrackingValidationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingValidationResultCopyWith<TrackingValidationResult> get copyWith => _$TrackingValidationResultCopyWithImpl<TrackingValidationResult>(this as TrackingValidationResult, _$identity);

  /// Serializes this TrackingValidationResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingValidationResult&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'TrackingValidationResult(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $TrackingValidationResultCopyWith<$Res>  {
  factory $TrackingValidationResultCopyWith(TrackingValidationResult value, $Res Function(TrackingValidationResult) _then) = _$TrackingValidationResultCopyWithImpl;
@useResult
$Res call({
 bool success, String message, TrackingValidationData? data
});


$TrackingValidationDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$TrackingValidationResultCopyWithImpl<$Res>
    implements $TrackingValidationResultCopyWith<$Res> {
  _$TrackingValidationResultCopyWithImpl(this._self, this._then);

  final TrackingValidationResult _self;
  final $Res Function(TrackingValidationResult) _then;

/// Create a copy of TrackingValidationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TrackingValidationData?,
  ));
}
/// Create a copy of TrackingValidationResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackingValidationDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $TrackingValidationDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrackingValidationResult].
extension TrackingValidationResultPatterns on TrackingValidationResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingValidationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingValidationResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingValidationResult value)  $default,){
final _that = this;
switch (_that) {
case _TrackingValidationResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingValidationResult value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingValidationResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  TrackingValidationData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingValidationResult() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  TrackingValidationData? data)  $default,) {final _that = this;
switch (_that) {
case _TrackingValidationResult():
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  TrackingValidationData? data)?  $default,) {final _that = this;
switch (_that) {
case _TrackingValidationResult() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackingValidationResult implements TrackingValidationResult {
  const _TrackingValidationResult({this.success = false, this.message = '', this.data});
  factory _TrackingValidationResult.fromJson(Map<String, dynamic> json) => _$TrackingValidationResultFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override final  TrackingValidationData? data;

/// Create a copy of TrackingValidationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingValidationResultCopyWith<_TrackingValidationResult> get copyWith => __$TrackingValidationResultCopyWithImpl<_TrackingValidationResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackingValidationResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingValidationResult&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'TrackingValidationResult(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$TrackingValidationResultCopyWith<$Res> implements $TrackingValidationResultCopyWith<$Res> {
  factory _$TrackingValidationResultCopyWith(_TrackingValidationResult value, $Res Function(_TrackingValidationResult) _then) = __$TrackingValidationResultCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, TrackingValidationData? data
});


@override $TrackingValidationDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$TrackingValidationResultCopyWithImpl<$Res>
    implements _$TrackingValidationResultCopyWith<$Res> {
  __$TrackingValidationResultCopyWithImpl(this._self, this._then);

  final _TrackingValidationResult _self;
  final $Res Function(_TrackingValidationResult) _then;

/// Create a copy of TrackingValidationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_TrackingValidationResult(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TrackingValidationData?,
  ));
}

/// Create a copy of TrackingValidationResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrackingValidationDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $TrackingValidationDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$TrackingValidationData {

 String? get state; String? get message; bool? get isValid; bool? get isRecipientMismatch;
/// Create a copy of TrackingValidationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingValidationDataCopyWith<TrackingValidationData> get copyWith => _$TrackingValidationDataCopyWithImpl<TrackingValidationData>(this as TrackingValidationData, _$identity);

  /// Serializes this TrackingValidationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingValidationData&&(identical(other.state, state) || other.state == state)&&(identical(other.message, message) || other.message == message)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.isRecipientMismatch, isRecipientMismatch) || other.isRecipientMismatch == isRecipientMismatch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,message,isValid,isRecipientMismatch);

@override
String toString() {
  return 'TrackingValidationData(state: $state, message: $message, isValid: $isValid, isRecipientMismatch: $isRecipientMismatch)';
}


}

/// @nodoc
abstract mixin class $TrackingValidationDataCopyWith<$Res>  {
  factory $TrackingValidationDataCopyWith(TrackingValidationData value, $Res Function(TrackingValidationData) _then) = _$TrackingValidationDataCopyWithImpl;
@useResult
$Res call({
 String? state, String? message, bool? isValid, bool? isRecipientMismatch
});




}
/// @nodoc
class _$TrackingValidationDataCopyWithImpl<$Res>
    implements $TrackingValidationDataCopyWith<$Res> {
  _$TrackingValidationDataCopyWithImpl(this._self, this._then);

  final TrackingValidationData _self;
  final $Res Function(TrackingValidationData) _then;

/// Create a copy of TrackingValidationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = freezed,Object? message = freezed,Object? isValid = freezed,Object? isRecipientMismatch = freezed,}) {
  return _then(_self.copyWith(
state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,isValid: freezed == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool?,isRecipientMismatch: freezed == isRecipientMismatch ? _self.isRecipientMismatch : isRecipientMismatch // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackingValidationData].
extension TrackingValidationDataPatterns on TrackingValidationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingValidationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingValidationData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingValidationData value)  $default,){
final _that = this;
switch (_that) {
case _TrackingValidationData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingValidationData value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingValidationData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? state,  String? message,  bool? isValid,  bool? isRecipientMismatch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingValidationData() when $default != null:
return $default(_that.state,_that.message,_that.isValid,_that.isRecipientMismatch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? state,  String? message,  bool? isValid,  bool? isRecipientMismatch)  $default,) {final _that = this;
switch (_that) {
case _TrackingValidationData():
return $default(_that.state,_that.message,_that.isValid,_that.isRecipientMismatch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? state,  String? message,  bool? isValid,  bool? isRecipientMismatch)?  $default,) {final _that = this;
switch (_that) {
case _TrackingValidationData() when $default != null:
return $default(_that.state,_that.message,_that.isValid,_that.isRecipientMismatch);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackingValidationData implements TrackingValidationData {
  const _TrackingValidationData({this.state, this.message, this.isValid, this.isRecipientMismatch});
  factory _TrackingValidationData.fromJson(Map<String, dynamic> json) => _$TrackingValidationDataFromJson(json);

@override final  String? state;
@override final  String? message;
@override final  bool? isValid;
@override final  bool? isRecipientMismatch;

/// Create a copy of TrackingValidationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingValidationDataCopyWith<_TrackingValidationData> get copyWith => __$TrackingValidationDataCopyWithImpl<_TrackingValidationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackingValidationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingValidationData&&(identical(other.state, state) || other.state == state)&&(identical(other.message, message) || other.message == message)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.isRecipientMismatch, isRecipientMismatch) || other.isRecipientMismatch == isRecipientMismatch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,message,isValid,isRecipientMismatch);

@override
String toString() {
  return 'TrackingValidationData(state: $state, message: $message, isValid: $isValid, isRecipientMismatch: $isRecipientMismatch)';
}


}

/// @nodoc
abstract mixin class _$TrackingValidationDataCopyWith<$Res> implements $TrackingValidationDataCopyWith<$Res> {
  factory _$TrackingValidationDataCopyWith(_TrackingValidationData value, $Res Function(_TrackingValidationData) _then) = __$TrackingValidationDataCopyWithImpl;
@override @useResult
$Res call({
 String? state, String? message, bool? isValid, bool? isRecipientMismatch
});




}
/// @nodoc
class __$TrackingValidationDataCopyWithImpl<$Res>
    implements _$TrackingValidationDataCopyWith<$Res> {
  __$TrackingValidationDataCopyWithImpl(this._self, this._then);

  final _TrackingValidationData _self;
  final $Res Function(_TrackingValidationData) _then;

/// Create a copy of TrackingValidationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = freezed,Object? message = freezed,Object? isValid = freezed,Object? isRecipientMismatch = freezed,}) {
  return _then(_TrackingValidationData(
state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,isValid: freezed == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool?,isRecipientMismatch: freezed == isRecipientMismatch ? _self.isRecipientMismatch : isRecipientMismatch // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
