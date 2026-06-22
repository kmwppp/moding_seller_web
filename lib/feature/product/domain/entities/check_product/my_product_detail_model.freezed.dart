// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_product_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyProductDetailModel {

 int get id;// 상품명
 String get name;// 상품 설명
 String get description;// 대분류 카테고리 아이디
 int get parentCategoryId;// 소분류 카테고리 아이디
 int get categoryId; String get thumbnailImageUrl; String get foodLabelImageUrl;@JsonKey(name: 'galleryImageUrls', fromJson: _imageUrlsFromJson) List<String> get galleryImages;@JsonKey(name: 'descriptionImageUrls', fromJson: _imageUrlsFromJson) List<String> get descriptionImages;// 옵션
 List<RequestProductOption> get options;// 배송 방식
 List<String> get deliveryMethods;// 배송기간
@JsonKey(fromJson: _intFromJson) int get deliveryDays;// 당일 출고 가능 여부
 bool get isSameDayShipping;// 배송 소요 시간
@JsonKey(fromJson: _intFromJson) int get shippingLeadTime;// 배송 마감 시간
@JsonKey(fromJson: _nullableStringFromJson) String? get shippingCutoffTime; bool get isWeekendShipping;@JsonKey(fromJson: _directDeliveryDistrictsFromJson, toJson: _directDeliveryDistrictsToJson) List<DirectDeliveryDistrict> get directDeliveryDistricts; bool get isVariableWeight;// 배송비
@JsonKey(fromJson: _intFromJson) int get shippingFee;// 도서산간 배송 불가능 여부
 bool get isRemoteAreaUnavailable;// 도서산간 배송비
@JsonKey(fromJson: _intFromJson) int get remoteAreaShippingFee;// 제주도 배송 불가능 여부
 bool get isJejuUnavailable;// 제주도 배송비
@JsonKey(fromJson: _intFromJson) int get jejuShippingFee;// 무료배송 기준
@JsonKey(fromJson: _intFromJson) int get freeShippingThreshold;// 배송 안내
@JsonKey(fromJson: _stringFromJson) String get shippingNotice;// 보관방법
@JsonKey(fromJson: _stringFromJson) String get storageMethod;// 유통 안내
@JsonKey(fromJson: _stringFromJson) String get distributionNotice;// 취급주의
@JsonKey(fromJson: _stringFromJson) String get handlingPrecaution;// 과세 여부
@JsonKey(name: 'isTaxable') bool get isTaxable; bool get isHaccpCertified;// 판매 시작
@JsonKey(fromJson: _nullableStringFromJson) String? get saleStartAt;// 판매 종료
@JsonKey(fromJson: _nullableStringFromJson) String? get saleEndAt;
/// Create a copy of MyProductDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyProductDetailModelCopyWith<MyProductDetailModel> get copyWith => _$MyProductDetailModelCopyWithImpl<MyProductDetailModel>(this as MyProductDetailModel, _$identity);

  /// Serializes this MyProductDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyProductDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.parentCategoryId, parentCategoryId) || other.parentCategoryId == parentCategoryId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.thumbnailImageUrl, thumbnailImageUrl) || other.thumbnailImageUrl == thumbnailImageUrl)&&(identical(other.foodLabelImageUrl, foodLabelImageUrl) || other.foodLabelImageUrl == foodLabelImageUrl)&&const DeepCollectionEquality().equals(other.galleryImages, galleryImages)&&const DeepCollectionEquality().equals(other.descriptionImages, descriptionImages)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.deliveryMethods, deliveryMethods)&&(identical(other.deliveryDays, deliveryDays) || other.deliveryDays == deliveryDays)&&(identical(other.isSameDayShipping, isSameDayShipping) || other.isSameDayShipping == isSameDayShipping)&&(identical(other.shippingLeadTime, shippingLeadTime) || other.shippingLeadTime == shippingLeadTime)&&(identical(other.shippingCutoffTime, shippingCutoffTime) || other.shippingCutoffTime == shippingCutoffTime)&&(identical(other.isWeekendShipping, isWeekendShipping) || other.isWeekendShipping == isWeekendShipping)&&const DeepCollectionEquality().equals(other.directDeliveryDistricts, directDeliveryDistricts)&&(identical(other.isVariableWeight, isVariableWeight) || other.isVariableWeight == isVariableWeight)&&(identical(other.shippingFee, shippingFee) || other.shippingFee == shippingFee)&&(identical(other.isRemoteAreaUnavailable, isRemoteAreaUnavailable) || other.isRemoteAreaUnavailable == isRemoteAreaUnavailable)&&(identical(other.remoteAreaShippingFee, remoteAreaShippingFee) || other.remoteAreaShippingFee == remoteAreaShippingFee)&&(identical(other.isJejuUnavailable, isJejuUnavailable) || other.isJejuUnavailable == isJejuUnavailable)&&(identical(other.jejuShippingFee, jejuShippingFee) || other.jejuShippingFee == jejuShippingFee)&&(identical(other.freeShippingThreshold, freeShippingThreshold) || other.freeShippingThreshold == freeShippingThreshold)&&(identical(other.shippingNotice, shippingNotice) || other.shippingNotice == shippingNotice)&&(identical(other.storageMethod, storageMethod) || other.storageMethod == storageMethod)&&(identical(other.distributionNotice, distributionNotice) || other.distributionNotice == distributionNotice)&&(identical(other.handlingPrecaution, handlingPrecaution) || other.handlingPrecaution == handlingPrecaution)&&(identical(other.isTaxable, isTaxable) || other.isTaxable == isTaxable)&&(identical(other.isHaccpCertified, isHaccpCertified) || other.isHaccpCertified == isHaccpCertified)&&(identical(other.saleStartAt, saleStartAt) || other.saleStartAt == saleStartAt)&&(identical(other.saleEndAt, saleEndAt) || other.saleEndAt == saleEndAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,parentCategoryId,categoryId,thumbnailImageUrl,foodLabelImageUrl,const DeepCollectionEquality().hash(galleryImages),const DeepCollectionEquality().hash(descriptionImages),const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(deliveryMethods),deliveryDays,isSameDayShipping,shippingLeadTime,shippingCutoffTime,isWeekendShipping,const DeepCollectionEquality().hash(directDeliveryDistricts),isVariableWeight,shippingFee,isRemoteAreaUnavailable,remoteAreaShippingFee,isJejuUnavailable,jejuShippingFee,freeShippingThreshold,shippingNotice,storageMethod,distributionNotice,handlingPrecaution,isTaxable,isHaccpCertified,saleStartAt,saleEndAt]);

@override
String toString() {
  return 'MyProductDetailModel(id: $id, name: $name, description: $description, parentCategoryId: $parentCategoryId, categoryId: $categoryId, thumbnailImageUrl: $thumbnailImageUrl, foodLabelImageUrl: $foodLabelImageUrl, galleryImages: $galleryImages, descriptionImages: $descriptionImages, options: $options, deliveryMethods: $deliveryMethods, deliveryDays: $deliveryDays, isSameDayShipping: $isSameDayShipping, shippingLeadTime: $shippingLeadTime, shippingCutoffTime: $shippingCutoffTime, isWeekendShipping: $isWeekendShipping, directDeliveryDistricts: $directDeliveryDistricts, isVariableWeight: $isVariableWeight, shippingFee: $shippingFee, isRemoteAreaUnavailable: $isRemoteAreaUnavailable, remoteAreaShippingFee: $remoteAreaShippingFee, isJejuUnavailable: $isJejuUnavailable, jejuShippingFee: $jejuShippingFee, freeShippingThreshold: $freeShippingThreshold, shippingNotice: $shippingNotice, storageMethod: $storageMethod, distributionNotice: $distributionNotice, handlingPrecaution: $handlingPrecaution, isTaxable: $isTaxable, isHaccpCertified: $isHaccpCertified, saleStartAt: $saleStartAt, saleEndAt: $saleEndAt)';
}


}

/// @nodoc
abstract mixin class $MyProductDetailModelCopyWith<$Res>  {
  factory $MyProductDetailModelCopyWith(MyProductDetailModel value, $Res Function(MyProductDetailModel) _then) = _$MyProductDetailModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description, int parentCategoryId, int categoryId, String thumbnailImageUrl, String foodLabelImageUrl,@JsonKey(name: 'galleryImageUrls', fromJson: _imageUrlsFromJson) List<String> galleryImages,@JsonKey(name: 'descriptionImageUrls', fromJson: _imageUrlsFromJson) List<String> descriptionImages, List<RequestProductOption> options, List<String> deliveryMethods,@JsonKey(fromJson: _intFromJson) int deliveryDays, bool isSameDayShipping,@JsonKey(fromJson: _intFromJson) int shippingLeadTime,@JsonKey(fromJson: _nullableStringFromJson) String? shippingCutoffTime, bool isWeekendShipping,@JsonKey(fromJson: _directDeliveryDistrictsFromJson, toJson: _directDeliveryDistrictsToJson) List<DirectDeliveryDistrict> directDeliveryDistricts, bool isVariableWeight,@JsonKey(fromJson: _intFromJson) int shippingFee, bool isRemoteAreaUnavailable,@JsonKey(fromJson: _intFromJson) int remoteAreaShippingFee, bool isJejuUnavailable,@JsonKey(fromJson: _intFromJson) int jejuShippingFee,@JsonKey(fromJson: _intFromJson) int freeShippingThreshold,@JsonKey(fromJson: _stringFromJson) String shippingNotice,@JsonKey(fromJson: _stringFromJson) String storageMethod,@JsonKey(fromJson: _stringFromJson) String distributionNotice,@JsonKey(fromJson: _stringFromJson) String handlingPrecaution,@JsonKey(name: 'isTaxable') bool isTaxable, bool isHaccpCertified,@JsonKey(fromJson: _nullableStringFromJson) String? saleStartAt,@JsonKey(fromJson: _nullableStringFromJson) String? saleEndAt
});




}
/// @nodoc
class _$MyProductDetailModelCopyWithImpl<$Res>
    implements $MyProductDetailModelCopyWith<$Res> {
  _$MyProductDetailModelCopyWithImpl(this._self, this._then);

  final MyProductDetailModel _self;
  final $Res Function(MyProductDetailModel) _then;

/// Create a copy of MyProductDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? parentCategoryId = null,Object? categoryId = null,Object? thumbnailImageUrl = null,Object? foodLabelImageUrl = null,Object? galleryImages = null,Object? descriptionImages = null,Object? options = null,Object? deliveryMethods = null,Object? deliveryDays = null,Object? isSameDayShipping = null,Object? shippingLeadTime = null,Object? shippingCutoffTime = freezed,Object? isWeekendShipping = null,Object? directDeliveryDistricts = null,Object? isVariableWeight = null,Object? shippingFee = null,Object? isRemoteAreaUnavailable = null,Object? remoteAreaShippingFee = null,Object? isJejuUnavailable = null,Object? jejuShippingFee = null,Object? freeShippingThreshold = null,Object? shippingNotice = null,Object? storageMethod = null,Object? distributionNotice = null,Object? handlingPrecaution = null,Object? isTaxable = null,Object? isHaccpCertified = null,Object? saleStartAt = freezed,Object? saleEndAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parentCategoryId: null == parentCategoryId ? _self.parentCategoryId : parentCategoryId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,thumbnailImageUrl: null == thumbnailImageUrl ? _self.thumbnailImageUrl : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
as String,foodLabelImageUrl: null == foodLabelImageUrl ? _self.foodLabelImageUrl : foodLabelImageUrl // ignore: cast_nullable_to_non_nullable
as String,galleryImages: null == galleryImages ? _self.galleryImages : galleryImages // ignore: cast_nullable_to_non_nullable
as List<String>,descriptionImages: null == descriptionImages ? _self.descriptionImages : descriptionImages // ignore: cast_nullable_to_non_nullable
as List<String>,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<RequestProductOption>,deliveryMethods: null == deliveryMethods ? _self.deliveryMethods : deliveryMethods // ignore: cast_nullable_to_non_nullable
as List<String>,deliveryDays: null == deliveryDays ? _self.deliveryDays : deliveryDays // ignore: cast_nullable_to_non_nullable
as int,isSameDayShipping: null == isSameDayShipping ? _self.isSameDayShipping : isSameDayShipping // ignore: cast_nullable_to_non_nullable
as bool,shippingLeadTime: null == shippingLeadTime ? _self.shippingLeadTime : shippingLeadTime // ignore: cast_nullable_to_non_nullable
as int,shippingCutoffTime: freezed == shippingCutoffTime ? _self.shippingCutoffTime : shippingCutoffTime // ignore: cast_nullable_to_non_nullable
as String?,isWeekendShipping: null == isWeekendShipping ? _self.isWeekendShipping : isWeekendShipping // ignore: cast_nullable_to_non_nullable
as bool,directDeliveryDistricts: null == directDeliveryDistricts ? _self.directDeliveryDistricts : directDeliveryDistricts // ignore: cast_nullable_to_non_nullable
as List<DirectDeliveryDistrict>,isVariableWeight: null == isVariableWeight ? _self.isVariableWeight : isVariableWeight // ignore: cast_nullable_to_non_nullable
as bool,shippingFee: null == shippingFee ? _self.shippingFee : shippingFee // ignore: cast_nullable_to_non_nullable
as int,isRemoteAreaUnavailable: null == isRemoteAreaUnavailable ? _self.isRemoteAreaUnavailable : isRemoteAreaUnavailable // ignore: cast_nullable_to_non_nullable
as bool,remoteAreaShippingFee: null == remoteAreaShippingFee ? _self.remoteAreaShippingFee : remoteAreaShippingFee // ignore: cast_nullable_to_non_nullable
as int,isJejuUnavailable: null == isJejuUnavailable ? _self.isJejuUnavailable : isJejuUnavailable // ignore: cast_nullable_to_non_nullable
as bool,jejuShippingFee: null == jejuShippingFee ? _self.jejuShippingFee : jejuShippingFee // ignore: cast_nullable_to_non_nullable
as int,freeShippingThreshold: null == freeShippingThreshold ? _self.freeShippingThreshold : freeShippingThreshold // ignore: cast_nullable_to_non_nullable
as int,shippingNotice: null == shippingNotice ? _self.shippingNotice : shippingNotice // ignore: cast_nullable_to_non_nullable
as String,storageMethod: null == storageMethod ? _self.storageMethod : storageMethod // ignore: cast_nullable_to_non_nullable
as String,distributionNotice: null == distributionNotice ? _self.distributionNotice : distributionNotice // ignore: cast_nullable_to_non_nullable
as String,handlingPrecaution: null == handlingPrecaution ? _self.handlingPrecaution : handlingPrecaution // ignore: cast_nullable_to_non_nullable
as String,isTaxable: null == isTaxable ? _self.isTaxable : isTaxable // ignore: cast_nullable_to_non_nullable
as bool,isHaccpCertified: null == isHaccpCertified ? _self.isHaccpCertified : isHaccpCertified // ignore: cast_nullable_to_non_nullable
as bool,saleStartAt: freezed == saleStartAt ? _self.saleStartAt : saleStartAt // ignore: cast_nullable_to_non_nullable
as String?,saleEndAt: freezed == saleEndAt ? _self.saleEndAt : saleEndAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyProductDetailModel].
extension MyProductDetailModelPatterns on MyProductDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyProductDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyProductDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyProductDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _MyProductDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyProductDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _MyProductDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description,  int parentCategoryId,  int categoryId,  String thumbnailImageUrl,  String foodLabelImageUrl, @JsonKey(name: 'galleryImageUrls', fromJson: _imageUrlsFromJson)  List<String> galleryImages, @JsonKey(name: 'descriptionImageUrls', fromJson: _imageUrlsFromJson)  List<String> descriptionImages,  List<RequestProductOption> options,  List<String> deliveryMethods, @JsonKey(fromJson: _intFromJson)  int deliveryDays,  bool isSameDayShipping, @JsonKey(fromJson: _intFromJson)  int shippingLeadTime, @JsonKey(fromJson: _nullableStringFromJson)  String? shippingCutoffTime,  bool isWeekendShipping, @JsonKey(fromJson: _directDeliveryDistrictsFromJson, toJson: _directDeliveryDistrictsToJson)  List<DirectDeliveryDistrict> directDeliveryDistricts,  bool isVariableWeight, @JsonKey(fromJson: _intFromJson)  int shippingFee,  bool isRemoteAreaUnavailable, @JsonKey(fromJson: _intFromJson)  int remoteAreaShippingFee,  bool isJejuUnavailable, @JsonKey(fromJson: _intFromJson)  int jejuShippingFee, @JsonKey(fromJson: _intFromJson)  int freeShippingThreshold, @JsonKey(fromJson: _stringFromJson)  String shippingNotice, @JsonKey(fromJson: _stringFromJson)  String storageMethod, @JsonKey(fromJson: _stringFromJson)  String distributionNotice, @JsonKey(fromJson: _stringFromJson)  String handlingPrecaution, @JsonKey(name: 'isTaxable')  bool isTaxable,  bool isHaccpCertified, @JsonKey(fromJson: _nullableStringFromJson)  String? saleStartAt, @JsonKey(fromJson: _nullableStringFromJson)  String? saleEndAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyProductDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.parentCategoryId,_that.categoryId,_that.thumbnailImageUrl,_that.foodLabelImageUrl,_that.galleryImages,_that.descriptionImages,_that.options,_that.deliveryMethods,_that.deliveryDays,_that.isSameDayShipping,_that.shippingLeadTime,_that.shippingCutoffTime,_that.isWeekendShipping,_that.directDeliveryDistricts,_that.isVariableWeight,_that.shippingFee,_that.isRemoteAreaUnavailable,_that.remoteAreaShippingFee,_that.isJejuUnavailable,_that.jejuShippingFee,_that.freeShippingThreshold,_that.shippingNotice,_that.storageMethod,_that.distributionNotice,_that.handlingPrecaution,_that.isTaxable,_that.isHaccpCertified,_that.saleStartAt,_that.saleEndAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description,  int parentCategoryId,  int categoryId,  String thumbnailImageUrl,  String foodLabelImageUrl, @JsonKey(name: 'galleryImageUrls', fromJson: _imageUrlsFromJson)  List<String> galleryImages, @JsonKey(name: 'descriptionImageUrls', fromJson: _imageUrlsFromJson)  List<String> descriptionImages,  List<RequestProductOption> options,  List<String> deliveryMethods, @JsonKey(fromJson: _intFromJson)  int deliveryDays,  bool isSameDayShipping, @JsonKey(fromJson: _intFromJson)  int shippingLeadTime, @JsonKey(fromJson: _nullableStringFromJson)  String? shippingCutoffTime,  bool isWeekendShipping, @JsonKey(fromJson: _directDeliveryDistrictsFromJson, toJson: _directDeliveryDistrictsToJson)  List<DirectDeliveryDistrict> directDeliveryDistricts,  bool isVariableWeight, @JsonKey(fromJson: _intFromJson)  int shippingFee,  bool isRemoteAreaUnavailable, @JsonKey(fromJson: _intFromJson)  int remoteAreaShippingFee,  bool isJejuUnavailable, @JsonKey(fromJson: _intFromJson)  int jejuShippingFee, @JsonKey(fromJson: _intFromJson)  int freeShippingThreshold, @JsonKey(fromJson: _stringFromJson)  String shippingNotice, @JsonKey(fromJson: _stringFromJson)  String storageMethod, @JsonKey(fromJson: _stringFromJson)  String distributionNotice, @JsonKey(fromJson: _stringFromJson)  String handlingPrecaution, @JsonKey(name: 'isTaxable')  bool isTaxable,  bool isHaccpCertified, @JsonKey(fromJson: _nullableStringFromJson)  String? saleStartAt, @JsonKey(fromJson: _nullableStringFromJson)  String? saleEndAt)  $default,) {final _that = this;
switch (_that) {
case _MyProductDetailModel():
return $default(_that.id,_that.name,_that.description,_that.parentCategoryId,_that.categoryId,_that.thumbnailImageUrl,_that.foodLabelImageUrl,_that.galleryImages,_that.descriptionImages,_that.options,_that.deliveryMethods,_that.deliveryDays,_that.isSameDayShipping,_that.shippingLeadTime,_that.shippingCutoffTime,_that.isWeekendShipping,_that.directDeliveryDistricts,_that.isVariableWeight,_that.shippingFee,_that.isRemoteAreaUnavailable,_that.remoteAreaShippingFee,_that.isJejuUnavailable,_that.jejuShippingFee,_that.freeShippingThreshold,_that.shippingNotice,_that.storageMethod,_that.distributionNotice,_that.handlingPrecaution,_that.isTaxable,_that.isHaccpCertified,_that.saleStartAt,_that.saleEndAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description,  int parentCategoryId,  int categoryId,  String thumbnailImageUrl,  String foodLabelImageUrl, @JsonKey(name: 'galleryImageUrls', fromJson: _imageUrlsFromJson)  List<String> galleryImages, @JsonKey(name: 'descriptionImageUrls', fromJson: _imageUrlsFromJson)  List<String> descriptionImages,  List<RequestProductOption> options,  List<String> deliveryMethods, @JsonKey(fromJson: _intFromJson)  int deliveryDays,  bool isSameDayShipping, @JsonKey(fromJson: _intFromJson)  int shippingLeadTime, @JsonKey(fromJson: _nullableStringFromJson)  String? shippingCutoffTime,  bool isWeekendShipping, @JsonKey(fromJson: _directDeliveryDistrictsFromJson, toJson: _directDeliveryDistrictsToJson)  List<DirectDeliveryDistrict> directDeliveryDistricts,  bool isVariableWeight, @JsonKey(fromJson: _intFromJson)  int shippingFee,  bool isRemoteAreaUnavailable, @JsonKey(fromJson: _intFromJson)  int remoteAreaShippingFee,  bool isJejuUnavailable, @JsonKey(fromJson: _intFromJson)  int jejuShippingFee, @JsonKey(fromJson: _intFromJson)  int freeShippingThreshold, @JsonKey(fromJson: _stringFromJson)  String shippingNotice, @JsonKey(fromJson: _stringFromJson)  String storageMethod, @JsonKey(fromJson: _stringFromJson)  String distributionNotice, @JsonKey(fromJson: _stringFromJson)  String handlingPrecaution, @JsonKey(name: 'isTaxable')  bool isTaxable,  bool isHaccpCertified, @JsonKey(fromJson: _nullableStringFromJson)  String? saleStartAt, @JsonKey(fromJson: _nullableStringFromJson)  String? saleEndAt)?  $default,) {final _that = this;
switch (_that) {
case _MyProductDetailModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.parentCategoryId,_that.categoryId,_that.thumbnailImageUrl,_that.foodLabelImageUrl,_that.galleryImages,_that.descriptionImages,_that.options,_that.deliveryMethods,_that.deliveryDays,_that.isSameDayShipping,_that.shippingLeadTime,_that.shippingCutoffTime,_that.isWeekendShipping,_that.directDeliveryDistricts,_that.isVariableWeight,_that.shippingFee,_that.isRemoteAreaUnavailable,_that.remoteAreaShippingFee,_that.isJejuUnavailable,_that.jejuShippingFee,_that.freeShippingThreshold,_that.shippingNotice,_that.storageMethod,_that.distributionNotice,_that.handlingPrecaution,_that.isTaxable,_that.isHaccpCertified,_that.saleStartAt,_that.saleEndAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyProductDetailModel implements MyProductDetailModel {
  const _MyProductDetailModel({this.id = 0, this.name = '', this.description = '', this.parentCategoryId = 0, this.categoryId = 0, this.thumbnailImageUrl = '', this.foodLabelImageUrl = '', @JsonKey(name: 'galleryImageUrls', fromJson: _imageUrlsFromJson) final  List<String> galleryImages = const <String>[], @JsonKey(name: 'descriptionImageUrls', fromJson: _imageUrlsFromJson) final  List<String> descriptionImages = const <String>[], final  List<RequestProductOption> options = const <RequestProductOption>[], final  List<String> deliveryMethods = const <String>[], @JsonKey(fromJson: _intFromJson) this.deliveryDays = 0, this.isSameDayShipping = false, @JsonKey(fromJson: _intFromJson) this.shippingLeadTime = 0, @JsonKey(fromJson: _nullableStringFromJson) this.shippingCutoffTime, this.isWeekendShipping = false, @JsonKey(fromJson: _directDeliveryDistrictsFromJson, toJson: _directDeliveryDistrictsToJson) final  List<DirectDeliveryDistrict> directDeliveryDistricts = const <DirectDeliveryDistrict>[], this.isVariableWeight = false, @JsonKey(fromJson: _intFromJson) this.shippingFee = 0, this.isRemoteAreaUnavailable = false, @JsonKey(fromJson: _intFromJson) this.remoteAreaShippingFee = 0, this.isJejuUnavailable = false, @JsonKey(fromJson: _intFromJson) this.jejuShippingFee = 0, @JsonKey(fromJson: _intFromJson) this.freeShippingThreshold = 0, @JsonKey(fromJson: _stringFromJson) this.shippingNotice = '', @JsonKey(fromJson: _stringFromJson) this.storageMethod = '', @JsonKey(fromJson: _stringFromJson) this.distributionNotice = '', @JsonKey(fromJson: _stringFromJson) this.handlingPrecaution = '', @JsonKey(name: 'isTaxable') this.isTaxable = false, this.isHaccpCertified = false, @JsonKey(fromJson: _nullableStringFromJson) this.saleStartAt, @JsonKey(fromJson: _nullableStringFromJson) this.saleEndAt}): _galleryImages = galleryImages,_descriptionImages = descriptionImages,_options = options,_deliveryMethods = deliveryMethods,_directDeliveryDistricts = directDeliveryDistricts;
  factory _MyProductDetailModel.fromJson(Map<String, dynamic> json) => _$MyProductDetailModelFromJson(json);

@override@JsonKey() final  int id;
// 상품명
@override@JsonKey() final  String name;
// 상품 설명
@override@JsonKey() final  String description;
// 대분류 카테고리 아이디
@override@JsonKey() final  int parentCategoryId;
// 소분류 카테고리 아이디
@override@JsonKey() final  int categoryId;
@override@JsonKey() final  String thumbnailImageUrl;
@override@JsonKey() final  String foodLabelImageUrl;
 final  List<String> _galleryImages;
@override@JsonKey(name: 'galleryImageUrls', fromJson: _imageUrlsFromJson) List<String> get galleryImages {
  if (_galleryImages is EqualUnmodifiableListView) return _galleryImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_galleryImages);
}

 final  List<String> _descriptionImages;
@override@JsonKey(name: 'descriptionImageUrls', fromJson: _imageUrlsFromJson) List<String> get descriptionImages {
  if (_descriptionImages is EqualUnmodifiableListView) return _descriptionImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_descriptionImages);
}

// 옵션
 final  List<RequestProductOption> _options;
// 옵션
@override@JsonKey() List<RequestProductOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

// 배송 방식
 final  List<String> _deliveryMethods;
// 배송 방식
@override@JsonKey() List<String> get deliveryMethods {
  if (_deliveryMethods is EqualUnmodifiableListView) return _deliveryMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deliveryMethods);
}

// 배송기간
@override@JsonKey(fromJson: _intFromJson) final  int deliveryDays;
// 당일 출고 가능 여부
@override@JsonKey() final  bool isSameDayShipping;
// 배송 소요 시간
@override@JsonKey(fromJson: _intFromJson) final  int shippingLeadTime;
// 배송 마감 시간
@override@JsonKey(fromJson: _nullableStringFromJson) final  String? shippingCutoffTime;
@override@JsonKey() final  bool isWeekendShipping;
 final  List<DirectDeliveryDistrict> _directDeliveryDistricts;
@override@JsonKey(fromJson: _directDeliveryDistrictsFromJson, toJson: _directDeliveryDistrictsToJson) List<DirectDeliveryDistrict> get directDeliveryDistricts {
  if (_directDeliveryDistricts is EqualUnmodifiableListView) return _directDeliveryDistricts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_directDeliveryDistricts);
}

@override@JsonKey() final  bool isVariableWeight;
// 배송비
@override@JsonKey(fromJson: _intFromJson) final  int shippingFee;
// 도서산간 배송 불가능 여부
@override@JsonKey() final  bool isRemoteAreaUnavailable;
// 도서산간 배송비
@override@JsonKey(fromJson: _intFromJson) final  int remoteAreaShippingFee;
// 제주도 배송 불가능 여부
@override@JsonKey() final  bool isJejuUnavailable;
// 제주도 배송비
@override@JsonKey(fromJson: _intFromJson) final  int jejuShippingFee;
// 무료배송 기준
@override@JsonKey(fromJson: _intFromJson) final  int freeShippingThreshold;
// 배송 안내
@override@JsonKey(fromJson: _stringFromJson) final  String shippingNotice;
// 보관방법
@override@JsonKey(fromJson: _stringFromJson) final  String storageMethod;
// 유통 안내
@override@JsonKey(fromJson: _stringFromJson) final  String distributionNotice;
// 취급주의
@override@JsonKey(fromJson: _stringFromJson) final  String handlingPrecaution;
// 과세 여부
@override@JsonKey(name: 'isTaxable') final  bool isTaxable;
@override@JsonKey() final  bool isHaccpCertified;
// 판매 시작
@override@JsonKey(fromJson: _nullableStringFromJson) final  String? saleStartAt;
// 판매 종료
@override@JsonKey(fromJson: _nullableStringFromJson) final  String? saleEndAt;

/// Create a copy of MyProductDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyProductDetailModelCopyWith<_MyProductDetailModel> get copyWith => __$MyProductDetailModelCopyWithImpl<_MyProductDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyProductDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyProductDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.parentCategoryId, parentCategoryId) || other.parentCategoryId == parentCategoryId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.thumbnailImageUrl, thumbnailImageUrl) || other.thumbnailImageUrl == thumbnailImageUrl)&&(identical(other.foodLabelImageUrl, foodLabelImageUrl) || other.foodLabelImageUrl == foodLabelImageUrl)&&const DeepCollectionEquality().equals(other._galleryImages, _galleryImages)&&const DeepCollectionEquality().equals(other._descriptionImages, _descriptionImages)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other._deliveryMethods, _deliveryMethods)&&(identical(other.deliveryDays, deliveryDays) || other.deliveryDays == deliveryDays)&&(identical(other.isSameDayShipping, isSameDayShipping) || other.isSameDayShipping == isSameDayShipping)&&(identical(other.shippingLeadTime, shippingLeadTime) || other.shippingLeadTime == shippingLeadTime)&&(identical(other.shippingCutoffTime, shippingCutoffTime) || other.shippingCutoffTime == shippingCutoffTime)&&(identical(other.isWeekendShipping, isWeekendShipping) || other.isWeekendShipping == isWeekendShipping)&&const DeepCollectionEquality().equals(other._directDeliveryDistricts, _directDeliveryDistricts)&&(identical(other.isVariableWeight, isVariableWeight) || other.isVariableWeight == isVariableWeight)&&(identical(other.shippingFee, shippingFee) || other.shippingFee == shippingFee)&&(identical(other.isRemoteAreaUnavailable, isRemoteAreaUnavailable) || other.isRemoteAreaUnavailable == isRemoteAreaUnavailable)&&(identical(other.remoteAreaShippingFee, remoteAreaShippingFee) || other.remoteAreaShippingFee == remoteAreaShippingFee)&&(identical(other.isJejuUnavailable, isJejuUnavailable) || other.isJejuUnavailable == isJejuUnavailable)&&(identical(other.jejuShippingFee, jejuShippingFee) || other.jejuShippingFee == jejuShippingFee)&&(identical(other.freeShippingThreshold, freeShippingThreshold) || other.freeShippingThreshold == freeShippingThreshold)&&(identical(other.shippingNotice, shippingNotice) || other.shippingNotice == shippingNotice)&&(identical(other.storageMethod, storageMethod) || other.storageMethod == storageMethod)&&(identical(other.distributionNotice, distributionNotice) || other.distributionNotice == distributionNotice)&&(identical(other.handlingPrecaution, handlingPrecaution) || other.handlingPrecaution == handlingPrecaution)&&(identical(other.isTaxable, isTaxable) || other.isTaxable == isTaxable)&&(identical(other.isHaccpCertified, isHaccpCertified) || other.isHaccpCertified == isHaccpCertified)&&(identical(other.saleStartAt, saleStartAt) || other.saleStartAt == saleStartAt)&&(identical(other.saleEndAt, saleEndAt) || other.saleEndAt == saleEndAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,parentCategoryId,categoryId,thumbnailImageUrl,foodLabelImageUrl,const DeepCollectionEquality().hash(_galleryImages),const DeepCollectionEquality().hash(_descriptionImages),const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(_deliveryMethods),deliveryDays,isSameDayShipping,shippingLeadTime,shippingCutoffTime,isWeekendShipping,const DeepCollectionEquality().hash(_directDeliveryDistricts),isVariableWeight,shippingFee,isRemoteAreaUnavailable,remoteAreaShippingFee,isJejuUnavailable,jejuShippingFee,freeShippingThreshold,shippingNotice,storageMethod,distributionNotice,handlingPrecaution,isTaxable,isHaccpCertified,saleStartAt,saleEndAt]);

@override
String toString() {
  return 'MyProductDetailModel(id: $id, name: $name, description: $description, parentCategoryId: $parentCategoryId, categoryId: $categoryId, thumbnailImageUrl: $thumbnailImageUrl, foodLabelImageUrl: $foodLabelImageUrl, galleryImages: $galleryImages, descriptionImages: $descriptionImages, options: $options, deliveryMethods: $deliveryMethods, deliveryDays: $deliveryDays, isSameDayShipping: $isSameDayShipping, shippingLeadTime: $shippingLeadTime, shippingCutoffTime: $shippingCutoffTime, isWeekendShipping: $isWeekendShipping, directDeliveryDistricts: $directDeliveryDistricts, isVariableWeight: $isVariableWeight, shippingFee: $shippingFee, isRemoteAreaUnavailable: $isRemoteAreaUnavailable, remoteAreaShippingFee: $remoteAreaShippingFee, isJejuUnavailable: $isJejuUnavailable, jejuShippingFee: $jejuShippingFee, freeShippingThreshold: $freeShippingThreshold, shippingNotice: $shippingNotice, storageMethod: $storageMethod, distributionNotice: $distributionNotice, handlingPrecaution: $handlingPrecaution, isTaxable: $isTaxable, isHaccpCertified: $isHaccpCertified, saleStartAt: $saleStartAt, saleEndAt: $saleEndAt)';
}


}

/// @nodoc
abstract mixin class _$MyProductDetailModelCopyWith<$Res> implements $MyProductDetailModelCopyWith<$Res> {
  factory _$MyProductDetailModelCopyWith(_MyProductDetailModel value, $Res Function(_MyProductDetailModel) _then) = __$MyProductDetailModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description, int parentCategoryId, int categoryId, String thumbnailImageUrl, String foodLabelImageUrl,@JsonKey(name: 'galleryImageUrls', fromJson: _imageUrlsFromJson) List<String> galleryImages,@JsonKey(name: 'descriptionImageUrls', fromJson: _imageUrlsFromJson) List<String> descriptionImages, List<RequestProductOption> options, List<String> deliveryMethods,@JsonKey(fromJson: _intFromJson) int deliveryDays, bool isSameDayShipping,@JsonKey(fromJson: _intFromJson) int shippingLeadTime,@JsonKey(fromJson: _nullableStringFromJson) String? shippingCutoffTime, bool isWeekendShipping,@JsonKey(fromJson: _directDeliveryDistrictsFromJson, toJson: _directDeliveryDistrictsToJson) List<DirectDeliveryDistrict> directDeliveryDistricts, bool isVariableWeight,@JsonKey(fromJson: _intFromJson) int shippingFee, bool isRemoteAreaUnavailable,@JsonKey(fromJson: _intFromJson) int remoteAreaShippingFee, bool isJejuUnavailable,@JsonKey(fromJson: _intFromJson) int jejuShippingFee,@JsonKey(fromJson: _intFromJson) int freeShippingThreshold,@JsonKey(fromJson: _stringFromJson) String shippingNotice,@JsonKey(fromJson: _stringFromJson) String storageMethod,@JsonKey(fromJson: _stringFromJson) String distributionNotice,@JsonKey(fromJson: _stringFromJson) String handlingPrecaution,@JsonKey(name: 'isTaxable') bool isTaxable, bool isHaccpCertified,@JsonKey(fromJson: _nullableStringFromJson) String? saleStartAt,@JsonKey(fromJson: _nullableStringFromJson) String? saleEndAt
});




}
/// @nodoc
class __$MyProductDetailModelCopyWithImpl<$Res>
    implements _$MyProductDetailModelCopyWith<$Res> {
  __$MyProductDetailModelCopyWithImpl(this._self, this._then);

  final _MyProductDetailModel _self;
  final $Res Function(_MyProductDetailModel) _then;

/// Create a copy of MyProductDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? parentCategoryId = null,Object? categoryId = null,Object? thumbnailImageUrl = null,Object? foodLabelImageUrl = null,Object? galleryImages = null,Object? descriptionImages = null,Object? options = null,Object? deliveryMethods = null,Object? deliveryDays = null,Object? isSameDayShipping = null,Object? shippingLeadTime = null,Object? shippingCutoffTime = freezed,Object? isWeekendShipping = null,Object? directDeliveryDistricts = null,Object? isVariableWeight = null,Object? shippingFee = null,Object? isRemoteAreaUnavailable = null,Object? remoteAreaShippingFee = null,Object? isJejuUnavailable = null,Object? jejuShippingFee = null,Object? freeShippingThreshold = null,Object? shippingNotice = null,Object? storageMethod = null,Object? distributionNotice = null,Object? handlingPrecaution = null,Object? isTaxable = null,Object? isHaccpCertified = null,Object? saleStartAt = freezed,Object? saleEndAt = freezed,}) {
  return _then(_MyProductDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parentCategoryId: null == parentCategoryId ? _self.parentCategoryId : parentCategoryId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,thumbnailImageUrl: null == thumbnailImageUrl ? _self.thumbnailImageUrl : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
as String,foodLabelImageUrl: null == foodLabelImageUrl ? _self.foodLabelImageUrl : foodLabelImageUrl // ignore: cast_nullable_to_non_nullable
as String,galleryImages: null == galleryImages ? _self._galleryImages : galleryImages // ignore: cast_nullable_to_non_nullable
as List<String>,descriptionImages: null == descriptionImages ? _self._descriptionImages : descriptionImages // ignore: cast_nullable_to_non_nullable
as List<String>,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<RequestProductOption>,deliveryMethods: null == deliveryMethods ? _self._deliveryMethods : deliveryMethods // ignore: cast_nullable_to_non_nullable
as List<String>,deliveryDays: null == deliveryDays ? _self.deliveryDays : deliveryDays // ignore: cast_nullable_to_non_nullable
as int,isSameDayShipping: null == isSameDayShipping ? _self.isSameDayShipping : isSameDayShipping // ignore: cast_nullable_to_non_nullable
as bool,shippingLeadTime: null == shippingLeadTime ? _self.shippingLeadTime : shippingLeadTime // ignore: cast_nullable_to_non_nullable
as int,shippingCutoffTime: freezed == shippingCutoffTime ? _self.shippingCutoffTime : shippingCutoffTime // ignore: cast_nullable_to_non_nullable
as String?,isWeekendShipping: null == isWeekendShipping ? _self.isWeekendShipping : isWeekendShipping // ignore: cast_nullable_to_non_nullable
as bool,directDeliveryDistricts: null == directDeliveryDistricts ? _self._directDeliveryDistricts : directDeliveryDistricts // ignore: cast_nullable_to_non_nullable
as List<DirectDeliveryDistrict>,isVariableWeight: null == isVariableWeight ? _self.isVariableWeight : isVariableWeight // ignore: cast_nullable_to_non_nullable
as bool,shippingFee: null == shippingFee ? _self.shippingFee : shippingFee // ignore: cast_nullable_to_non_nullable
as int,isRemoteAreaUnavailable: null == isRemoteAreaUnavailable ? _self.isRemoteAreaUnavailable : isRemoteAreaUnavailable // ignore: cast_nullable_to_non_nullable
as bool,remoteAreaShippingFee: null == remoteAreaShippingFee ? _self.remoteAreaShippingFee : remoteAreaShippingFee // ignore: cast_nullable_to_non_nullable
as int,isJejuUnavailable: null == isJejuUnavailable ? _self.isJejuUnavailable : isJejuUnavailable // ignore: cast_nullable_to_non_nullable
as bool,jejuShippingFee: null == jejuShippingFee ? _self.jejuShippingFee : jejuShippingFee // ignore: cast_nullable_to_non_nullable
as int,freeShippingThreshold: null == freeShippingThreshold ? _self.freeShippingThreshold : freeShippingThreshold // ignore: cast_nullable_to_non_nullable
as int,shippingNotice: null == shippingNotice ? _self.shippingNotice : shippingNotice // ignore: cast_nullable_to_non_nullable
as String,storageMethod: null == storageMethod ? _self.storageMethod : storageMethod // ignore: cast_nullable_to_non_nullable
as String,distributionNotice: null == distributionNotice ? _self.distributionNotice : distributionNotice // ignore: cast_nullable_to_non_nullable
as String,handlingPrecaution: null == handlingPrecaution ? _self.handlingPrecaution : handlingPrecaution // ignore: cast_nullable_to_non_nullable
as String,isTaxable: null == isTaxable ? _self.isTaxable : isTaxable // ignore: cast_nullable_to_non_nullable
as bool,isHaccpCertified: null == isHaccpCertified ? _self.isHaccpCertified : isHaccpCertified // ignore: cast_nullable_to_non_nullable
as bool,saleStartAt: freezed == saleStartAt ? _self.saleStartAt : saleStartAt // ignore: cast_nullable_to_non_nullable
as String?,saleEndAt: freezed == saleEndAt ? _self.saleEndAt : saleEndAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
