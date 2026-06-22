// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_invoice_page_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaxInvoicePageResult {

 List<TaxInvoiceItem> get content; int get number; int get size; int get totalElements; int get totalPages;
/// Create a copy of TaxInvoicePageResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaxInvoicePageResultCopyWith<TaxInvoicePageResult> get copyWith => _$TaxInvoicePageResultCopyWithImpl<TaxInvoicePageResult>(this as TaxInvoicePageResult, _$identity);

  /// Serializes this TaxInvoicePageResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaxInvoicePageResult&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.number, number) || other.number == number)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),number,size,totalElements,totalPages);

@override
String toString() {
  return 'TaxInvoicePageResult(content: $content, number: $number, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $TaxInvoicePageResultCopyWith<$Res>  {
  factory $TaxInvoicePageResultCopyWith(TaxInvoicePageResult value, $Res Function(TaxInvoicePageResult) _then) = _$TaxInvoicePageResultCopyWithImpl;
@useResult
$Res call({
 List<TaxInvoiceItem> content, int number, int size, int totalElements, int totalPages
});




}
/// @nodoc
class _$TaxInvoicePageResultCopyWithImpl<$Res>
    implements $TaxInvoicePageResultCopyWith<$Res> {
  _$TaxInvoicePageResultCopyWithImpl(this._self, this._then);

  final TaxInvoicePageResult _self;
  final $Res Function(TaxInvoicePageResult) _then;

/// Create a copy of TaxInvoicePageResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? number = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<TaxInvoiceItem>,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TaxInvoicePageResult].
extension TaxInvoicePageResultPatterns on TaxInvoicePageResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaxInvoicePageResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaxInvoicePageResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaxInvoicePageResult value)  $default,){
final _that = this;
switch (_that) {
case _TaxInvoicePageResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaxInvoicePageResult value)?  $default,){
final _that = this;
switch (_that) {
case _TaxInvoicePageResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TaxInvoiceItem> content,  int number,  int size,  int totalElements,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaxInvoicePageResult() when $default != null:
return $default(_that.content,_that.number,_that.size,_that.totalElements,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TaxInvoiceItem> content,  int number,  int size,  int totalElements,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _TaxInvoicePageResult():
return $default(_that.content,_that.number,_that.size,_that.totalElements,_that.totalPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TaxInvoiceItem> content,  int number,  int size,  int totalElements,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _TaxInvoicePageResult() when $default != null:
return $default(_that.content,_that.number,_that.size,_that.totalElements,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaxInvoicePageResult extends TaxInvoicePageResult {
  const _TaxInvoicePageResult({final  List<TaxInvoiceItem> content = const [], this.number = 0, this.size = 20, this.totalElements = 0, this.totalPages = 0}): _content = content,super._();
  factory _TaxInvoicePageResult.fromJson(Map<String, dynamic> json) => _$TaxInvoicePageResultFromJson(json);

 final  List<TaxInvoiceItem> _content;
@override@JsonKey() List<TaxInvoiceItem> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override@JsonKey() final  int number;
@override@JsonKey() final  int size;
@override@JsonKey() final  int totalElements;
@override@JsonKey() final  int totalPages;

/// Create a copy of TaxInvoicePageResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaxInvoicePageResultCopyWith<_TaxInvoicePageResult> get copyWith => __$TaxInvoicePageResultCopyWithImpl<_TaxInvoicePageResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaxInvoicePageResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaxInvoicePageResult&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.number, number) || other.number == number)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),number,size,totalElements,totalPages);

@override
String toString() {
  return 'TaxInvoicePageResult(content: $content, number: $number, size: $size, totalElements: $totalElements, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$TaxInvoicePageResultCopyWith<$Res> implements $TaxInvoicePageResultCopyWith<$Res> {
  factory _$TaxInvoicePageResultCopyWith(_TaxInvoicePageResult value, $Res Function(_TaxInvoicePageResult) _then) = __$TaxInvoicePageResultCopyWithImpl;
@override @useResult
$Res call({
 List<TaxInvoiceItem> content, int number, int size, int totalElements, int totalPages
});




}
/// @nodoc
class __$TaxInvoicePageResultCopyWithImpl<$Res>
    implements _$TaxInvoicePageResultCopyWith<$Res> {
  __$TaxInvoicePageResultCopyWithImpl(this._self, this._then);

  final _TaxInvoicePageResult _self;
  final $Res Function(_TaxInvoicePageResult) _then;

/// Create a copy of TaxInvoicePageResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? number = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,}) {
  return _then(_TaxInvoicePageResult(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<TaxInvoiceItem>,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
