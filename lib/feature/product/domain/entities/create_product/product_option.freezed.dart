// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestProductOption {

@JsonKey(includeIfNull: false) int? get id;@JsonKey(ignore: true) String get weightOptions; int get capacity;@JsonKey(includeIfNull: false) List<CapacityUnit>? get capacityUnitList;@JsonKey(fromJson: capacityUnitFromJson, toJson: capacityUnitToJson) CapacityUnit get capacityUnit; int get quantityValue;@JsonKey(fromJson: quantityUnitFromJson, toJson: quantityUnitToJson) QuantityUnit get quantityUnit; int get price; int get discountAmount;@JsonKey(includeToJson: false) int get finalPrice; int get stockQuantity;
/// Create a copy of RequestProductOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestProductOptionCopyWith<RequestProductOption> get copyWith => _$RequestProductOptionCopyWithImpl<RequestProductOption>(this as RequestProductOption, _$identity);

  /// Serializes this RequestProductOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestProductOption&&(identical(other.id, id) || other.id == id)&&(identical(other.weightOptions, weightOptions) || other.weightOptions == weightOptions)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&const DeepCollectionEquality().equals(other.capacityUnitList, capacityUnitList)&&(identical(other.capacityUnit, capacityUnit) || other.capacityUnit == capacityUnit)&&(identical(other.quantityValue, quantityValue) || other.quantityValue == quantityValue)&&(identical(other.quantityUnit, quantityUnit) || other.quantityUnit == quantityUnit)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.finalPrice, finalPrice) || other.finalPrice == finalPrice)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,weightOptions,capacity,const DeepCollectionEquality().hash(capacityUnitList),capacityUnit,quantityValue,quantityUnit,price,discountAmount,finalPrice,stockQuantity);

@override
String toString() {
  return 'RequestProductOption(id: $id, weightOptions: $weightOptions, capacity: $capacity, capacityUnitList: $capacityUnitList, capacityUnit: $capacityUnit, quantityValue: $quantityValue, quantityUnit: $quantityUnit, price: $price, discountAmount: $discountAmount, finalPrice: $finalPrice, stockQuantity: $stockQuantity)';
}


}

/// @nodoc
abstract mixin class $RequestProductOptionCopyWith<$Res>  {
  factory $RequestProductOptionCopyWith(RequestProductOption value, $Res Function(RequestProductOption) _then) = _$RequestProductOptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) int? id,@JsonKey(ignore: true) String weightOptions, int capacity,@JsonKey(includeIfNull: false) List<CapacityUnit>? capacityUnitList,@JsonKey(fromJson: capacityUnitFromJson, toJson: capacityUnitToJson) CapacityUnit capacityUnit, int quantityValue,@JsonKey(fromJson: quantityUnitFromJson, toJson: quantityUnitToJson) QuantityUnit quantityUnit, int price, int discountAmount,@JsonKey(includeToJson: false) int finalPrice, int stockQuantity
});




}
/// @nodoc
class _$RequestProductOptionCopyWithImpl<$Res>
    implements $RequestProductOptionCopyWith<$Res> {
  _$RequestProductOptionCopyWithImpl(this._self, this._then);

  final RequestProductOption _self;
  final $Res Function(RequestProductOption) _then;

/// Create a copy of RequestProductOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? weightOptions = null,Object? capacity = null,Object? capacityUnitList = freezed,Object? capacityUnit = null,Object? quantityValue = null,Object? quantityUnit = null,Object? price = null,Object? discountAmount = null,Object? finalPrice = null,Object? stockQuantity = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,weightOptions: null == weightOptions ? _self.weightOptions : weightOptions // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,capacityUnitList: freezed == capacityUnitList ? _self.capacityUnitList : capacityUnitList // ignore: cast_nullable_to_non_nullable
as List<CapacityUnit>?,capacityUnit: null == capacityUnit ? _self.capacityUnit : capacityUnit // ignore: cast_nullable_to_non_nullable
as CapacityUnit,quantityValue: null == quantityValue ? _self.quantityValue : quantityValue // ignore: cast_nullable_to_non_nullable
as int,quantityUnit: null == quantityUnit ? _self.quantityUnit : quantityUnit // ignore: cast_nullable_to_non_nullable
as QuantityUnit,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as int,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestProductOption].
extension RequestProductOptionPatterns on RequestProductOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestProductOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestProductOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestProductOption value)  $default,){
final _that = this;
switch (_that) {
case _RequestProductOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestProductOption value)?  $default,){
final _that = this;
switch (_that) {
case _RequestProductOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  int? id, @JsonKey(ignore: true)  String weightOptions,  int capacity, @JsonKey(includeIfNull: false)  List<CapacityUnit>? capacityUnitList, @JsonKey(fromJson: capacityUnitFromJson, toJson: capacityUnitToJson)  CapacityUnit capacityUnit,  int quantityValue, @JsonKey(fromJson: quantityUnitFromJson, toJson: quantityUnitToJson)  QuantityUnit quantityUnit,  int price,  int discountAmount, @JsonKey(includeToJson: false)  int finalPrice,  int stockQuantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestProductOption() when $default != null:
return $default(_that.id,_that.weightOptions,_that.capacity,_that.capacityUnitList,_that.capacityUnit,_that.quantityValue,_that.quantityUnit,_that.price,_that.discountAmount,_that.finalPrice,_that.stockQuantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  int? id, @JsonKey(ignore: true)  String weightOptions,  int capacity, @JsonKey(includeIfNull: false)  List<CapacityUnit>? capacityUnitList, @JsonKey(fromJson: capacityUnitFromJson, toJson: capacityUnitToJson)  CapacityUnit capacityUnit,  int quantityValue, @JsonKey(fromJson: quantityUnitFromJson, toJson: quantityUnitToJson)  QuantityUnit quantityUnit,  int price,  int discountAmount, @JsonKey(includeToJson: false)  int finalPrice,  int stockQuantity)  $default,) {final _that = this;
switch (_that) {
case _RequestProductOption():
return $default(_that.id,_that.weightOptions,_that.capacity,_that.capacityUnitList,_that.capacityUnit,_that.quantityValue,_that.quantityUnit,_that.price,_that.discountAmount,_that.finalPrice,_that.stockQuantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  int? id, @JsonKey(ignore: true)  String weightOptions,  int capacity, @JsonKey(includeIfNull: false)  List<CapacityUnit>? capacityUnitList, @JsonKey(fromJson: capacityUnitFromJson, toJson: capacityUnitToJson)  CapacityUnit capacityUnit,  int quantityValue, @JsonKey(fromJson: quantityUnitFromJson, toJson: quantityUnitToJson)  QuantityUnit quantityUnit,  int price,  int discountAmount, @JsonKey(includeToJson: false)  int finalPrice,  int stockQuantity)?  $default,) {final _that = this;
switch (_that) {
case _RequestProductOption() when $default != null:
return $default(_that.id,_that.weightOptions,_that.capacity,_that.capacityUnitList,_that.capacityUnit,_that.quantityValue,_that.quantityUnit,_that.price,_that.discountAmount,_that.finalPrice,_that.stockQuantity);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RequestProductOption implements RequestProductOption {
  const _RequestProductOption({@JsonKey(includeIfNull: false) this.id, @JsonKey(ignore: true) this.weightOptions = '개당 중량', this.capacity = 0, @JsonKey(includeIfNull: false) final  List<CapacityUnit>? capacityUnitList, @JsonKey(fromJson: capacityUnitFromJson, toJson: capacityUnitToJson) this.capacityUnit = CapacityUnit.g, this.quantityValue = 0, @JsonKey(fromJson: quantityUnitFromJson, toJson: quantityUnitToJson) this.quantityUnit = QuantityUnit.ea, this.price = 0, this.discountAmount = 0, @JsonKey(includeToJson: false) this.finalPrice = 0, this.stockQuantity = 0}): _capacityUnitList = capacityUnitList;
  factory _RequestProductOption.fromJson(Map<String, dynamic> json) => _$RequestProductOptionFromJson(json);

@override@JsonKey(includeIfNull: false) final  int? id;
@override@JsonKey(ignore: true) final  String weightOptions;
@override@JsonKey() final  int capacity;
 final  List<CapacityUnit>? _capacityUnitList;
@override@JsonKey(includeIfNull: false) List<CapacityUnit>? get capacityUnitList {
  final value = _capacityUnitList;
  if (value == null) return null;
  if (_capacityUnitList is EqualUnmodifiableListView) return _capacityUnitList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(fromJson: capacityUnitFromJson, toJson: capacityUnitToJson) final  CapacityUnit capacityUnit;
@override@JsonKey() final  int quantityValue;
@override@JsonKey(fromJson: quantityUnitFromJson, toJson: quantityUnitToJson) final  QuantityUnit quantityUnit;
@override@JsonKey() final  int price;
@override@JsonKey() final  int discountAmount;
@override@JsonKey(includeToJson: false) final  int finalPrice;
@override@JsonKey() final  int stockQuantity;

/// Create a copy of RequestProductOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestProductOptionCopyWith<_RequestProductOption> get copyWith => __$RequestProductOptionCopyWithImpl<_RequestProductOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestProductOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestProductOption&&(identical(other.id, id) || other.id == id)&&(identical(other.weightOptions, weightOptions) || other.weightOptions == weightOptions)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&const DeepCollectionEquality().equals(other._capacityUnitList, _capacityUnitList)&&(identical(other.capacityUnit, capacityUnit) || other.capacityUnit == capacityUnit)&&(identical(other.quantityValue, quantityValue) || other.quantityValue == quantityValue)&&(identical(other.quantityUnit, quantityUnit) || other.quantityUnit == quantityUnit)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.finalPrice, finalPrice) || other.finalPrice == finalPrice)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,weightOptions,capacity,const DeepCollectionEquality().hash(_capacityUnitList),capacityUnit,quantityValue,quantityUnit,price,discountAmount,finalPrice,stockQuantity);

@override
String toString() {
  return 'RequestProductOption(id: $id, weightOptions: $weightOptions, capacity: $capacity, capacityUnitList: $capacityUnitList, capacityUnit: $capacityUnit, quantityValue: $quantityValue, quantityUnit: $quantityUnit, price: $price, discountAmount: $discountAmount, finalPrice: $finalPrice, stockQuantity: $stockQuantity)';
}


}

/// @nodoc
abstract mixin class _$RequestProductOptionCopyWith<$Res> implements $RequestProductOptionCopyWith<$Res> {
  factory _$RequestProductOptionCopyWith(_RequestProductOption value, $Res Function(_RequestProductOption) _then) = __$RequestProductOptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) int? id,@JsonKey(ignore: true) String weightOptions, int capacity,@JsonKey(includeIfNull: false) List<CapacityUnit>? capacityUnitList,@JsonKey(fromJson: capacityUnitFromJson, toJson: capacityUnitToJson) CapacityUnit capacityUnit, int quantityValue,@JsonKey(fromJson: quantityUnitFromJson, toJson: quantityUnitToJson) QuantityUnit quantityUnit, int price, int discountAmount,@JsonKey(includeToJson: false) int finalPrice, int stockQuantity
});




}
/// @nodoc
class __$RequestProductOptionCopyWithImpl<$Res>
    implements _$RequestProductOptionCopyWith<$Res> {
  __$RequestProductOptionCopyWithImpl(this._self, this._then);

  final _RequestProductOption _self;
  final $Res Function(_RequestProductOption) _then;

/// Create a copy of RequestProductOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? weightOptions = null,Object? capacity = null,Object? capacityUnitList = freezed,Object? capacityUnit = null,Object? quantityValue = null,Object? quantityUnit = null,Object? price = null,Object? discountAmount = null,Object? finalPrice = null,Object? stockQuantity = null,}) {
  return _then(_RequestProductOption(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,weightOptions: null == weightOptions ? _self.weightOptions : weightOptions // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,capacityUnitList: freezed == capacityUnitList ? _self._capacityUnitList : capacityUnitList // ignore: cast_nullable_to_non_nullable
as List<CapacityUnit>?,capacityUnit: null == capacityUnit ? _self.capacityUnit : capacityUnit // ignore: cast_nullable_to_non_nullable
as CapacityUnit,quantityValue: null == quantityValue ? _self.quantityValue : quantityValue // ignore: cast_nullable_to_non_nullable
as int,quantityUnit: null == quantityUnit ? _self.quantityUnit : quantityUnit // ignore: cast_nullable_to_non_nullable
as QuantityUnit,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int,finalPrice: null == finalPrice ? _self.finalPrice : finalPrice // ignore: cast_nullable_to_non_nullable
as int,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
