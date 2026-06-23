// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainScreenModel {

 String get title; String get iconUrl;
/// Create a copy of MainScreenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainScreenModelCopyWith<MainScreenModel> get copyWith => _$MainScreenModelCopyWithImpl<MainScreenModel>(this as MainScreenModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainScreenModel&&(identical(other.title, title) || other.title == title)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}


@override
int get hashCode => Object.hash(runtimeType,title,iconUrl);

@override
String toString() {
  return 'MainScreenModel(title: $title, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class $MainScreenModelCopyWith<$Res>  {
  factory $MainScreenModelCopyWith(MainScreenModel value, $Res Function(MainScreenModel) _then) = _$MainScreenModelCopyWithImpl;
@useResult
$Res call({
 String title, String iconUrl
});




}
/// @nodoc
class _$MainScreenModelCopyWithImpl<$Res>
    implements $MainScreenModelCopyWith<$Res> {
  _$MainScreenModelCopyWithImpl(this._self, this._then);

  final MainScreenModel _self;
  final $Res Function(MainScreenModel) _then;

/// Create a copy of MainScreenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? iconUrl = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MainScreenModel].
extension MainScreenModelPatterns on MainScreenModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MainScreenModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MainScreenModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MainScreenModel value)  $default,){
final _that = this;
switch (_that) {
case _MainScreenModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MainScreenModel value)?  $default,){
final _that = this;
switch (_that) {
case _MainScreenModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String iconUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MainScreenModel() when $default != null:
return $default(_that.title,_that.iconUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String iconUrl)  $default,) {final _that = this;
switch (_that) {
case _MainScreenModel():
return $default(_that.title,_that.iconUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String iconUrl)?  $default,) {final _that = this;
switch (_that) {
case _MainScreenModel() when $default != null:
return $default(_that.title,_that.iconUrl);case _:
  return null;

}
}

}

/// @nodoc


class _MainScreenModel implements MainScreenModel {
  const _MainScreenModel({this.title = AppStrings.dashBoard, this.iconUrl = "assets/images/icons/homeIcon.png"});
  

@override@JsonKey() final  String title;
@override@JsonKey() final  String iconUrl;

/// Create a copy of MainScreenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MainScreenModelCopyWith<_MainScreenModel> get copyWith => __$MainScreenModelCopyWithImpl<_MainScreenModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MainScreenModel&&(identical(other.title, title) || other.title == title)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}


@override
int get hashCode => Object.hash(runtimeType,title,iconUrl);

@override
String toString() {
  return 'MainScreenModel(title: $title, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class _$MainScreenModelCopyWith<$Res> implements $MainScreenModelCopyWith<$Res> {
  factory _$MainScreenModelCopyWith(_MainScreenModel value, $Res Function(_MainScreenModel) _then) = __$MainScreenModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String iconUrl
});




}
/// @nodoc
class __$MainScreenModelCopyWithImpl<$Res>
    implements _$MainScreenModelCopyWith<$Res> {
  __$MainScreenModelCopyWithImpl(this._self, this._then);

  final _MainScreenModel _self;
  final $Res Function(_MainScreenModel) _then;

/// Create a copy of MainScreenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? iconUrl = null,}) {
  return _then(_MainScreenModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
