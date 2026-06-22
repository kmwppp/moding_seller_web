// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaxSummaryDto {

 int get total; int get sellerToBuyerCount; int get modingToSellerCount;
/// Create a copy of TaxSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaxSummaryDtoCopyWith<TaxSummaryDto> get copyWith => _$TaxSummaryDtoCopyWithImpl<TaxSummaryDto>(this as TaxSummaryDto, _$identity);

  /// Serializes this TaxSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaxSummaryDto&&(identical(other.total, total) || other.total == total)&&(identical(other.sellerToBuyerCount, sellerToBuyerCount) || other.sellerToBuyerCount == sellerToBuyerCount)&&(identical(other.modingToSellerCount, modingToSellerCount) || other.modingToSellerCount == modingToSellerCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,sellerToBuyerCount,modingToSellerCount);

@override
String toString() {
  return 'TaxSummaryDto(total: $total, sellerToBuyerCount: $sellerToBuyerCount, modingToSellerCount: $modingToSellerCount)';
}


}

/// @nodoc
abstract mixin class $TaxSummaryDtoCopyWith<$Res>  {
  factory $TaxSummaryDtoCopyWith(TaxSummaryDto value, $Res Function(TaxSummaryDto) _then) = _$TaxSummaryDtoCopyWithImpl;
@useResult
$Res call({
 int total, int sellerToBuyerCount, int modingToSellerCount
});




}
/// @nodoc
class _$TaxSummaryDtoCopyWithImpl<$Res>
    implements $TaxSummaryDtoCopyWith<$Res> {
  _$TaxSummaryDtoCopyWithImpl(this._self, this._then);

  final TaxSummaryDto _self;
  final $Res Function(TaxSummaryDto) _then;

/// Create a copy of TaxSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? sellerToBuyerCount = null,Object? modingToSellerCount = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,sellerToBuyerCount: null == sellerToBuyerCount ? _self.sellerToBuyerCount : sellerToBuyerCount // ignore: cast_nullable_to_non_nullable
as int,modingToSellerCount: null == modingToSellerCount ? _self.modingToSellerCount : modingToSellerCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TaxSummaryDto].
extension TaxSummaryDtoPatterns on TaxSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaxSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaxSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaxSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _TaxSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaxSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _TaxSummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int sellerToBuyerCount,  int modingToSellerCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaxSummaryDto() when $default != null:
return $default(_that.total,_that.sellerToBuyerCount,_that.modingToSellerCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int sellerToBuyerCount,  int modingToSellerCount)  $default,) {final _that = this;
switch (_that) {
case _TaxSummaryDto():
return $default(_that.total,_that.sellerToBuyerCount,_that.modingToSellerCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int sellerToBuyerCount,  int modingToSellerCount)?  $default,) {final _that = this;
switch (_that) {
case _TaxSummaryDto() when $default != null:
return $default(_that.total,_that.sellerToBuyerCount,_that.modingToSellerCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaxSummaryDto implements TaxSummaryDto {
  const _TaxSummaryDto({this.total = 0, this.sellerToBuyerCount = 0, this.modingToSellerCount = 0});
  factory _TaxSummaryDto.fromJson(Map<String, dynamic> json) => _$TaxSummaryDtoFromJson(json);

@override@JsonKey() final  int total;
@override@JsonKey() final  int sellerToBuyerCount;
@override@JsonKey() final  int modingToSellerCount;

/// Create a copy of TaxSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaxSummaryDtoCopyWith<_TaxSummaryDto> get copyWith => __$TaxSummaryDtoCopyWithImpl<_TaxSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaxSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaxSummaryDto&&(identical(other.total, total) || other.total == total)&&(identical(other.sellerToBuyerCount, sellerToBuyerCount) || other.sellerToBuyerCount == sellerToBuyerCount)&&(identical(other.modingToSellerCount, modingToSellerCount) || other.modingToSellerCount == modingToSellerCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,sellerToBuyerCount,modingToSellerCount);

@override
String toString() {
  return 'TaxSummaryDto(total: $total, sellerToBuyerCount: $sellerToBuyerCount, modingToSellerCount: $modingToSellerCount)';
}


}

/// @nodoc
abstract mixin class _$TaxSummaryDtoCopyWith<$Res> implements $TaxSummaryDtoCopyWith<$Res> {
  factory _$TaxSummaryDtoCopyWith(_TaxSummaryDto value, $Res Function(_TaxSummaryDto) _then) = __$TaxSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 int total, int sellerToBuyerCount, int modingToSellerCount
});




}
/// @nodoc
class __$TaxSummaryDtoCopyWithImpl<$Res>
    implements _$TaxSummaryDtoCopyWith<$Res> {
  __$TaxSummaryDtoCopyWithImpl(this._self, this._then);

  final _TaxSummaryDto _self;
  final $Res Function(_TaxSummaryDto) _then;

/// Create a copy of TaxSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? sellerToBuyerCount = null,Object? modingToSellerCount = null,}) {
  return _then(_TaxSummaryDto(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,sellerToBuyerCount: null == sellerToBuyerCount ? _self.sellerToBuyerCount : sellerToBuyerCount // ignore: cast_nullable_to_non_nullable
as int,modingToSellerCount: null == modingToSellerCount ? _self.modingToSellerCount : modingToSellerCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
