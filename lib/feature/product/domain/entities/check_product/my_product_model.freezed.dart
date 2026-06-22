// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyProductModel {

 int get id; String get productCode; String get name; String get categoryFullPath;@JsonKey(fromJson: ProductStatusX.from) ProductStatus get status;@JsonKey(fromJson: ProductApprovalStatusX.from) ProductApprovalStatus get approvalStatus; String get thumbnailImageUrl; int get lowestSellingPrice;@JsonKey(name: 'lowestPriceStockQuantity') int get stockQuantity;@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime get updatedAt;
/// Create a copy of MyProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyProductModelCopyWith<MyProductModel> get copyWith => _$MyProductModelCopyWithImpl<MyProductModel>(this as MyProductModel, _$identity);

  /// Serializes this MyProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productCode, productCode) || other.productCode == productCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryFullPath, categoryFullPath) || other.categoryFullPath == categoryFullPath)&&(identical(other.status, status) || other.status == status)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.thumbnailImageUrl, thumbnailImageUrl) || other.thumbnailImageUrl == thumbnailImageUrl)&&(identical(other.lowestSellingPrice, lowestSellingPrice) || other.lowestSellingPrice == lowestSellingPrice)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productCode,name,categoryFullPath,status,approvalStatus,thumbnailImageUrl,lowestSellingPrice,stockQuantity,updatedAt);

@override
String toString() {
  return 'MyProductModel(id: $id, productCode: $productCode, name: $name, categoryFullPath: $categoryFullPath, status: $status, approvalStatus: $approvalStatus, thumbnailImageUrl: $thumbnailImageUrl, lowestSellingPrice: $lowestSellingPrice, stockQuantity: $stockQuantity, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MyProductModelCopyWith<$Res>  {
  factory $MyProductModelCopyWith(MyProductModel value, $Res Function(MyProductModel) _then) = _$MyProductModelCopyWithImpl;
@useResult
$Res call({
 int id, String productCode, String name, String categoryFullPath,@JsonKey(fromJson: ProductStatusX.from) ProductStatus status,@JsonKey(fromJson: ProductApprovalStatusX.from) ProductApprovalStatus approvalStatus, String thumbnailImageUrl, int lowestSellingPrice,@JsonKey(name: 'lowestPriceStockQuantity') int stockQuantity,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime updatedAt
});




}
/// @nodoc
class _$MyProductModelCopyWithImpl<$Res>
    implements $MyProductModelCopyWith<$Res> {
  _$MyProductModelCopyWithImpl(this._self, this._then);

  final MyProductModel _self;
  final $Res Function(MyProductModel) _then;

/// Create a copy of MyProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productCode = null,Object? name = null,Object? categoryFullPath = null,Object? status = null,Object? approvalStatus = null,Object? thumbnailImageUrl = null,Object? lowestSellingPrice = null,Object? stockQuantity = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productCode: null == productCode ? _self.productCode : productCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryFullPath: null == categoryFullPath ? _self.categoryFullPath : categoryFullPath // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductStatus,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ProductApprovalStatus,thumbnailImageUrl: null == thumbnailImageUrl ? _self.thumbnailImageUrl : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
as String,lowestSellingPrice: null == lowestSellingPrice ? _self.lowestSellingPrice : lowestSellingPrice // ignore: cast_nullable_to_non_nullable
as int,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MyProductModel].
extension MyProductModelPatterns on MyProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyProductModel value)  $default,){
final _that = this;
switch (_that) {
case _MyProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _MyProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String productCode,  String name,  String categoryFullPath, @JsonKey(fromJson: ProductStatusX.from)  ProductStatus status, @JsonKey(fromJson: ProductApprovalStatusX.from)  ProductApprovalStatus approvalStatus,  String thumbnailImageUrl,  int lowestSellingPrice, @JsonKey(name: 'lowestPriceStockQuantity')  int stockQuantity, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyProductModel() when $default != null:
return $default(_that.id,_that.productCode,_that.name,_that.categoryFullPath,_that.status,_that.approvalStatus,_that.thumbnailImageUrl,_that.lowestSellingPrice,_that.stockQuantity,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String productCode,  String name,  String categoryFullPath, @JsonKey(fromJson: ProductStatusX.from)  ProductStatus status, @JsonKey(fromJson: ProductApprovalStatusX.from)  ProductApprovalStatus approvalStatus,  String thumbnailImageUrl,  int lowestSellingPrice, @JsonKey(name: 'lowestPriceStockQuantity')  int stockQuantity, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MyProductModel():
return $default(_that.id,_that.productCode,_that.name,_that.categoryFullPath,_that.status,_that.approvalStatus,_that.thumbnailImageUrl,_that.lowestSellingPrice,_that.stockQuantity,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String productCode,  String name,  String categoryFullPath, @JsonKey(fromJson: ProductStatusX.from)  ProductStatus status, @JsonKey(fromJson: ProductApprovalStatusX.from)  ProductApprovalStatus approvalStatus,  String thumbnailImageUrl,  int lowestSellingPrice, @JsonKey(name: 'lowestPriceStockQuantity')  int stockQuantity, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MyProductModel() when $default != null:
return $default(_that.id,_that.productCode,_that.name,_that.categoryFullPath,_that.status,_that.approvalStatus,_that.thumbnailImageUrl,_that.lowestSellingPrice,_that.stockQuantity,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyProductModel implements MyProductModel {
  const _MyProductModel({required this.id, this.productCode = '', this.name = '', this.categoryFullPath = '', @JsonKey(fromJson: ProductStatusX.from) required this.status, @JsonKey(fromJson: ProductApprovalStatusX.from) this.approvalStatus = ProductApprovalStatus.pending, this.thumbnailImageUrl = '', this.lowestSellingPrice = 0, @JsonKey(name: 'lowestPriceStockQuantity') this.stockQuantity = 0, @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) required this.updatedAt});
  factory _MyProductModel.fromJson(Map<String, dynamic> json) => _$MyProductModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String productCode;
@override@JsonKey() final  String name;
@override@JsonKey() final  String categoryFullPath;
@override@JsonKey(fromJson: ProductStatusX.from) final  ProductStatus status;
@override@JsonKey(fromJson: ProductApprovalStatusX.from) final  ProductApprovalStatus approvalStatus;
@override@JsonKey() final  String thumbnailImageUrl;
@override@JsonKey() final  int lowestSellingPrice;
@override@JsonKey(name: 'lowestPriceStockQuantity') final  int stockQuantity;
@override@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) final  DateTime updatedAt;

/// Create a copy of MyProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyProductModelCopyWith<_MyProductModel> get copyWith => __$MyProductModelCopyWithImpl<_MyProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.productCode, productCode) || other.productCode == productCode)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryFullPath, categoryFullPath) || other.categoryFullPath == categoryFullPath)&&(identical(other.status, status) || other.status == status)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.thumbnailImageUrl, thumbnailImageUrl) || other.thumbnailImageUrl == thumbnailImageUrl)&&(identical(other.lowestSellingPrice, lowestSellingPrice) || other.lowestSellingPrice == lowestSellingPrice)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productCode,name,categoryFullPath,status,approvalStatus,thumbnailImageUrl,lowestSellingPrice,stockQuantity,updatedAt);

@override
String toString() {
  return 'MyProductModel(id: $id, productCode: $productCode, name: $name, categoryFullPath: $categoryFullPath, status: $status, approvalStatus: $approvalStatus, thumbnailImageUrl: $thumbnailImageUrl, lowestSellingPrice: $lowestSellingPrice, stockQuantity: $stockQuantity, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MyProductModelCopyWith<$Res> implements $MyProductModelCopyWith<$Res> {
  factory _$MyProductModelCopyWith(_MyProductModel value, $Res Function(_MyProductModel) _then) = __$MyProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String productCode, String name, String categoryFullPath,@JsonKey(fromJson: ProductStatusX.from) ProductStatus status,@JsonKey(fromJson: ProductApprovalStatusX.from) ProductApprovalStatus approvalStatus, String thumbnailImageUrl, int lowestSellingPrice,@JsonKey(name: 'lowestPriceStockQuantity') int stockQuantity,@JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate) DateTime updatedAt
});




}
/// @nodoc
class __$MyProductModelCopyWithImpl<$Res>
    implements _$MyProductModelCopyWith<$Res> {
  __$MyProductModelCopyWithImpl(this._self, this._then);

  final _MyProductModel _self;
  final $Res Function(_MyProductModel) _then;

/// Create a copy of MyProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productCode = null,Object? name = null,Object? categoryFullPath = null,Object? status = null,Object? approvalStatus = null,Object? thumbnailImageUrl = null,Object? lowestSellingPrice = null,Object? stockQuantity = null,Object? updatedAt = null,}) {
  return _then(_MyProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,productCode: null == productCode ? _self.productCode : productCode // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryFullPath: null == categoryFullPath ? _self.categoryFullPath : categoryFullPath // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductStatus,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ProductApprovalStatus,thumbnailImageUrl: null == thumbnailImageUrl ? _self.thumbnailImageUrl : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
as String,lowestSellingPrice: null == lowestSellingPrice ? _self.lowestSellingPrice : lowestSellingPrice // ignore: cast_nullable_to_non_nullable
as int,stockQuantity: null == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
