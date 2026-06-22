// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductRegisterState {

 bool get isMainLoading;/// 상품 번호
 String get productId;/// 상품명
 String get productName;/// 상품 한줄 소개
 String get oneLineSummary; String get manufacturerMent;/// 메인 카테고리, 리스트
 ProductCategoryModel? get majorCategory; List<ProductCategoryModel> get majorCategoryList; ProductCategoryModel? get subCategory; List<ProductCategoryModel> get subCategoryList;/// 옵션 리스트
 List<RequestProductOption> get options; RequestProductOption get template;/// 식품 성분 표시 이미지
 dynamic get ingredientImage;/// 배송 방식
 List<String> get deliveryType;/// 배송 기간
 String get deliveryDays;/// 당일 출고 on/off
 bool get sameDayShip;/// 출고 소요일
 String get deliveryDate;/// 당일 출고 가능 시간
 String? get cutoffTime;/// 출고 가능한 요일
 List<Weekday> get weekdaySelected; bool get isWeekendShipping; List<DeliveryDistrictOption> get deliveryDistrictOptions; List<String> get directDeliveryCodes; bool get isNationwideDirectDelivery; bool get isVariableWeight;/// 배송비
 int get shippingFee;/// 도서산간 지역 배송 불가능 여부 false: 가능 / true: 불가능
 bool get isExtraImpossibleShipping;/// 도서산간 추가배송비
 int? get extraShippingFee;/// 제주 지역 배송 가능 여부 false: 가능 / true: 불가능
 bool get isJejuImpossibleShipping;/// 제주 추가배송비
 int? get jejuShippingFee;/// 무료 배송 최소 금액
 int get freeShippingThreshold;/// 배송 안내 문구
 String get shippingNotice;/// 반품 주소지
 String get returnAddress;/// 초도 배송비
 String get initialShippingFee;/// 반품 배송비
 String get returnShippingFee;/// 보관 방법
 String get storageMethod;/// 유통 안내
 String get distributionNotice;/// 취급 주의사항
 String get handleNotice;/// 과세 여부
 bool get taxType; bool get isHaccpCertified; bool get initialIsHaccpCertified;/// 판매 기간 타입 (상시 / 기간 설정)
 String get salePeriodType;/// 판매 시작일 / 종료일
 String get saleStartDate; String get saleEndDate;/// 대표 이미지
 dynamic get mainImage;/// 상품 설명 이미지 리스트
 List<dynamic> get descriptionImages;/// 상품 갤러리 이미지 리스트
 List<dynamic> get galleryImages;
/// Create a copy of ProductRegisterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductRegisterStateCopyWith<ProductRegisterState> get copyWith => _$ProductRegisterStateCopyWithImpl<ProductRegisterState>(this as ProductRegisterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductRegisterState&&(identical(other.isMainLoading, isMainLoading) || other.isMainLoading == isMainLoading)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.oneLineSummary, oneLineSummary) || other.oneLineSummary == oneLineSummary)&&(identical(other.manufacturerMent, manufacturerMent) || other.manufacturerMent == manufacturerMent)&&(identical(other.majorCategory, majorCategory) || other.majorCategory == majorCategory)&&const DeepCollectionEquality().equals(other.majorCategoryList, majorCategoryList)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&const DeepCollectionEquality().equals(other.subCategoryList, subCategoryList)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.template, template) || other.template == template)&&const DeepCollectionEquality().equals(other.ingredientImage, ingredientImage)&&const DeepCollectionEquality().equals(other.deliveryType, deliveryType)&&(identical(other.deliveryDays, deliveryDays) || other.deliveryDays == deliveryDays)&&(identical(other.sameDayShip, sameDayShip) || other.sameDayShip == sameDayShip)&&(identical(other.deliveryDate, deliveryDate) || other.deliveryDate == deliveryDate)&&(identical(other.cutoffTime, cutoffTime) || other.cutoffTime == cutoffTime)&&const DeepCollectionEquality().equals(other.weekdaySelected, weekdaySelected)&&(identical(other.isWeekendShipping, isWeekendShipping) || other.isWeekendShipping == isWeekendShipping)&&const DeepCollectionEquality().equals(other.deliveryDistrictOptions, deliveryDistrictOptions)&&const DeepCollectionEquality().equals(other.directDeliveryCodes, directDeliveryCodes)&&(identical(other.isNationwideDirectDelivery, isNationwideDirectDelivery) || other.isNationwideDirectDelivery == isNationwideDirectDelivery)&&(identical(other.isVariableWeight, isVariableWeight) || other.isVariableWeight == isVariableWeight)&&(identical(other.shippingFee, shippingFee) || other.shippingFee == shippingFee)&&(identical(other.isExtraImpossibleShipping, isExtraImpossibleShipping) || other.isExtraImpossibleShipping == isExtraImpossibleShipping)&&(identical(other.extraShippingFee, extraShippingFee) || other.extraShippingFee == extraShippingFee)&&(identical(other.isJejuImpossibleShipping, isJejuImpossibleShipping) || other.isJejuImpossibleShipping == isJejuImpossibleShipping)&&(identical(other.jejuShippingFee, jejuShippingFee) || other.jejuShippingFee == jejuShippingFee)&&(identical(other.freeShippingThreshold, freeShippingThreshold) || other.freeShippingThreshold == freeShippingThreshold)&&(identical(other.shippingNotice, shippingNotice) || other.shippingNotice == shippingNotice)&&(identical(other.returnAddress, returnAddress) || other.returnAddress == returnAddress)&&(identical(other.initialShippingFee, initialShippingFee) || other.initialShippingFee == initialShippingFee)&&(identical(other.returnShippingFee, returnShippingFee) || other.returnShippingFee == returnShippingFee)&&(identical(other.storageMethod, storageMethod) || other.storageMethod == storageMethod)&&(identical(other.distributionNotice, distributionNotice) || other.distributionNotice == distributionNotice)&&(identical(other.handleNotice, handleNotice) || other.handleNotice == handleNotice)&&(identical(other.taxType, taxType) || other.taxType == taxType)&&(identical(other.isHaccpCertified, isHaccpCertified) || other.isHaccpCertified == isHaccpCertified)&&(identical(other.initialIsHaccpCertified, initialIsHaccpCertified) || other.initialIsHaccpCertified == initialIsHaccpCertified)&&(identical(other.salePeriodType, salePeriodType) || other.salePeriodType == salePeriodType)&&(identical(other.saleStartDate, saleStartDate) || other.saleStartDate == saleStartDate)&&(identical(other.saleEndDate, saleEndDate) || other.saleEndDate == saleEndDate)&&const DeepCollectionEquality().equals(other.mainImage, mainImage)&&const DeepCollectionEquality().equals(other.descriptionImages, descriptionImages)&&const DeepCollectionEquality().equals(other.galleryImages, galleryImages));
}


@override
int get hashCode => Object.hashAll([runtimeType,isMainLoading,productId,productName,oneLineSummary,manufacturerMent,majorCategory,const DeepCollectionEquality().hash(majorCategoryList),subCategory,const DeepCollectionEquality().hash(subCategoryList),const DeepCollectionEquality().hash(options),template,const DeepCollectionEquality().hash(ingredientImage),const DeepCollectionEquality().hash(deliveryType),deliveryDays,sameDayShip,deliveryDate,cutoffTime,const DeepCollectionEquality().hash(weekdaySelected),isWeekendShipping,const DeepCollectionEquality().hash(deliveryDistrictOptions),const DeepCollectionEquality().hash(directDeliveryCodes),isNationwideDirectDelivery,isVariableWeight,shippingFee,isExtraImpossibleShipping,extraShippingFee,isJejuImpossibleShipping,jejuShippingFee,freeShippingThreshold,shippingNotice,returnAddress,initialShippingFee,returnShippingFee,storageMethod,distributionNotice,handleNotice,taxType,isHaccpCertified,initialIsHaccpCertified,salePeriodType,saleStartDate,saleEndDate,const DeepCollectionEquality().hash(mainImage),const DeepCollectionEquality().hash(descriptionImages),const DeepCollectionEquality().hash(galleryImages)]);

@override
String toString() {
  return 'ProductRegisterState(isMainLoading: $isMainLoading, productId: $productId, productName: $productName, oneLineSummary: $oneLineSummary, manufacturerMent: $manufacturerMent, majorCategory: $majorCategory, majorCategoryList: $majorCategoryList, subCategory: $subCategory, subCategoryList: $subCategoryList, options: $options, template: $template, ingredientImage: $ingredientImage, deliveryType: $deliveryType, deliveryDays: $deliveryDays, sameDayShip: $sameDayShip, deliveryDate: $deliveryDate, cutoffTime: $cutoffTime, weekdaySelected: $weekdaySelected, isWeekendShipping: $isWeekendShipping, deliveryDistrictOptions: $deliveryDistrictOptions, directDeliveryCodes: $directDeliveryCodes, isNationwideDirectDelivery: $isNationwideDirectDelivery, isVariableWeight: $isVariableWeight, shippingFee: $shippingFee, isExtraImpossibleShipping: $isExtraImpossibleShipping, extraShippingFee: $extraShippingFee, isJejuImpossibleShipping: $isJejuImpossibleShipping, jejuShippingFee: $jejuShippingFee, freeShippingThreshold: $freeShippingThreshold, shippingNotice: $shippingNotice, returnAddress: $returnAddress, initialShippingFee: $initialShippingFee, returnShippingFee: $returnShippingFee, storageMethod: $storageMethod, distributionNotice: $distributionNotice, handleNotice: $handleNotice, taxType: $taxType, isHaccpCertified: $isHaccpCertified, initialIsHaccpCertified: $initialIsHaccpCertified, salePeriodType: $salePeriodType, saleStartDate: $saleStartDate, saleEndDate: $saleEndDate, mainImage: $mainImage, descriptionImages: $descriptionImages, galleryImages: $galleryImages)';
}


}

/// @nodoc
abstract mixin class $ProductRegisterStateCopyWith<$Res>  {
  factory $ProductRegisterStateCopyWith(ProductRegisterState value, $Res Function(ProductRegisterState) _then) = _$ProductRegisterStateCopyWithImpl;
@useResult
$Res call({
 bool isMainLoading, String productId, String productName, String oneLineSummary, String manufacturerMent, ProductCategoryModel? majorCategory, List<ProductCategoryModel> majorCategoryList, ProductCategoryModel? subCategory, List<ProductCategoryModel> subCategoryList, List<RequestProductOption> options, RequestProductOption template, dynamic ingredientImage, List<String> deliveryType, String deliveryDays, bool sameDayShip, String deliveryDate, String? cutoffTime, List<Weekday> weekdaySelected, bool isWeekendShipping, List<DeliveryDistrictOption> deliveryDistrictOptions, List<String> directDeliveryCodes, bool isNationwideDirectDelivery, bool isVariableWeight, int shippingFee, bool isExtraImpossibleShipping, int? extraShippingFee, bool isJejuImpossibleShipping, int? jejuShippingFee, int freeShippingThreshold, String shippingNotice, String returnAddress, String initialShippingFee, String returnShippingFee, String storageMethod, String distributionNotice, String handleNotice, bool taxType, bool isHaccpCertified, bool initialIsHaccpCertified, String salePeriodType, String saleStartDate, String saleEndDate, dynamic mainImage, List<dynamic> descriptionImages, List<dynamic> galleryImages
});


$RequestProductOptionCopyWith<$Res> get template;

}
/// @nodoc
class _$ProductRegisterStateCopyWithImpl<$Res>
    implements $ProductRegisterStateCopyWith<$Res> {
  _$ProductRegisterStateCopyWithImpl(this._self, this._then);

  final ProductRegisterState _self;
  final $Res Function(ProductRegisterState) _then;

/// Create a copy of ProductRegisterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isMainLoading = null,Object? productId = null,Object? productName = null,Object? oneLineSummary = null,Object? manufacturerMent = null,Object? majorCategory = freezed,Object? majorCategoryList = null,Object? subCategory = freezed,Object? subCategoryList = null,Object? options = null,Object? template = null,Object? ingredientImage = freezed,Object? deliveryType = null,Object? deliveryDays = null,Object? sameDayShip = null,Object? deliveryDate = null,Object? cutoffTime = freezed,Object? weekdaySelected = null,Object? isWeekendShipping = null,Object? deliveryDistrictOptions = null,Object? directDeliveryCodes = null,Object? isNationwideDirectDelivery = null,Object? isVariableWeight = null,Object? shippingFee = null,Object? isExtraImpossibleShipping = null,Object? extraShippingFee = freezed,Object? isJejuImpossibleShipping = null,Object? jejuShippingFee = freezed,Object? freeShippingThreshold = null,Object? shippingNotice = null,Object? returnAddress = null,Object? initialShippingFee = null,Object? returnShippingFee = null,Object? storageMethod = null,Object? distributionNotice = null,Object? handleNotice = null,Object? taxType = null,Object? isHaccpCertified = null,Object? initialIsHaccpCertified = null,Object? salePeriodType = null,Object? saleStartDate = null,Object? saleEndDate = null,Object? mainImage = freezed,Object? descriptionImages = null,Object? galleryImages = null,}) {
  return _then(_self.copyWith(
isMainLoading: null == isMainLoading ? _self.isMainLoading : isMainLoading // ignore: cast_nullable_to_non_nullable
as bool,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,oneLineSummary: null == oneLineSummary ? _self.oneLineSummary : oneLineSummary // ignore: cast_nullable_to_non_nullable
as String,manufacturerMent: null == manufacturerMent ? _self.manufacturerMent : manufacturerMent // ignore: cast_nullable_to_non_nullable
as String,majorCategory: freezed == majorCategory ? _self.majorCategory : majorCategory // ignore: cast_nullable_to_non_nullable
as ProductCategoryModel?,majorCategoryList: null == majorCategoryList ? _self.majorCategoryList : majorCategoryList // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryModel>,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as ProductCategoryModel?,subCategoryList: null == subCategoryList ? _self.subCategoryList : subCategoryList // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryModel>,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<RequestProductOption>,template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as RequestProductOption,ingredientImage: freezed == ingredientImage ? _self.ingredientImage : ingredientImage // ignore: cast_nullable_to_non_nullable
as dynamic,deliveryType: null == deliveryType ? _self.deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as List<String>,deliveryDays: null == deliveryDays ? _self.deliveryDays : deliveryDays // ignore: cast_nullable_to_non_nullable
as String,sameDayShip: null == sameDayShip ? _self.sameDayShip : sameDayShip // ignore: cast_nullable_to_non_nullable
as bool,deliveryDate: null == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as String,cutoffTime: freezed == cutoffTime ? _self.cutoffTime : cutoffTime // ignore: cast_nullable_to_non_nullable
as String?,weekdaySelected: null == weekdaySelected ? _self.weekdaySelected : weekdaySelected // ignore: cast_nullable_to_non_nullable
as List<Weekday>,isWeekendShipping: null == isWeekendShipping ? _self.isWeekendShipping : isWeekendShipping // ignore: cast_nullable_to_non_nullable
as bool,deliveryDistrictOptions: null == deliveryDistrictOptions ? _self.deliveryDistrictOptions : deliveryDistrictOptions // ignore: cast_nullable_to_non_nullable
as List<DeliveryDistrictOption>,directDeliveryCodes: null == directDeliveryCodes ? _self.directDeliveryCodes : directDeliveryCodes // ignore: cast_nullable_to_non_nullable
as List<String>,isNationwideDirectDelivery: null == isNationwideDirectDelivery ? _self.isNationwideDirectDelivery : isNationwideDirectDelivery // ignore: cast_nullable_to_non_nullable
as bool,isVariableWeight: null == isVariableWeight ? _self.isVariableWeight : isVariableWeight // ignore: cast_nullable_to_non_nullable
as bool,shippingFee: null == shippingFee ? _self.shippingFee : shippingFee // ignore: cast_nullable_to_non_nullable
as int,isExtraImpossibleShipping: null == isExtraImpossibleShipping ? _self.isExtraImpossibleShipping : isExtraImpossibleShipping // ignore: cast_nullable_to_non_nullable
as bool,extraShippingFee: freezed == extraShippingFee ? _self.extraShippingFee : extraShippingFee // ignore: cast_nullable_to_non_nullable
as int?,isJejuImpossibleShipping: null == isJejuImpossibleShipping ? _self.isJejuImpossibleShipping : isJejuImpossibleShipping // ignore: cast_nullable_to_non_nullable
as bool,jejuShippingFee: freezed == jejuShippingFee ? _self.jejuShippingFee : jejuShippingFee // ignore: cast_nullable_to_non_nullable
as int?,freeShippingThreshold: null == freeShippingThreshold ? _self.freeShippingThreshold : freeShippingThreshold // ignore: cast_nullable_to_non_nullable
as int,shippingNotice: null == shippingNotice ? _self.shippingNotice : shippingNotice // ignore: cast_nullable_to_non_nullable
as String,returnAddress: null == returnAddress ? _self.returnAddress : returnAddress // ignore: cast_nullable_to_non_nullable
as String,initialShippingFee: null == initialShippingFee ? _self.initialShippingFee : initialShippingFee // ignore: cast_nullable_to_non_nullable
as String,returnShippingFee: null == returnShippingFee ? _self.returnShippingFee : returnShippingFee // ignore: cast_nullable_to_non_nullable
as String,storageMethod: null == storageMethod ? _self.storageMethod : storageMethod // ignore: cast_nullable_to_non_nullable
as String,distributionNotice: null == distributionNotice ? _self.distributionNotice : distributionNotice // ignore: cast_nullable_to_non_nullable
as String,handleNotice: null == handleNotice ? _self.handleNotice : handleNotice // ignore: cast_nullable_to_non_nullable
as String,taxType: null == taxType ? _self.taxType : taxType // ignore: cast_nullable_to_non_nullable
as bool,isHaccpCertified: null == isHaccpCertified ? _self.isHaccpCertified : isHaccpCertified // ignore: cast_nullable_to_non_nullable
as bool,initialIsHaccpCertified: null == initialIsHaccpCertified ? _self.initialIsHaccpCertified : initialIsHaccpCertified // ignore: cast_nullable_to_non_nullable
as bool,salePeriodType: null == salePeriodType ? _self.salePeriodType : salePeriodType // ignore: cast_nullable_to_non_nullable
as String,saleStartDate: null == saleStartDate ? _self.saleStartDate : saleStartDate // ignore: cast_nullable_to_non_nullable
as String,saleEndDate: null == saleEndDate ? _self.saleEndDate : saleEndDate // ignore: cast_nullable_to_non_nullable
as String,mainImage: freezed == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as dynamic,descriptionImages: null == descriptionImages ? _self.descriptionImages : descriptionImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,galleryImages: null == galleryImages ? _self.galleryImages : galleryImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}
/// Create a copy of ProductRegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestProductOptionCopyWith<$Res> get template {
  
  return $RequestProductOptionCopyWith<$Res>(_self.template, (value) {
    return _then(_self.copyWith(template: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductRegisterState].
extension ProductRegisterStatePatterns on ProductRegisterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductRegisterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductRegisterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductRegisterState value)  $default,){
final _that = this;
switch (_that) {
case _ProductRegisterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductRegisterState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductRegisterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isMainLoading,  String productId,  String productName,  String oneLineSummary,  String manufacturerMent,  ProductCategoryModel? majorCategory,  List<ProductCategoryModel> majorCategoryList,  ProductCategoryModel? subCategory,  List<ProductCategoryModel> subCategoryList,  List<RequestProductOption> options,  RequestProductOption template,  dynamic ingredientImage,  List<String> deliveryType,  String deliveryDays,  bool sameDayShip,  String deliveryDate,  String? cutoffTime,  List<Weekday> weekdaySelected,  bool isWeekendShipping,  List<DeliveryDistrictOption> deliveryDistrictOptions,  List<String> directDeliveryCodes,  bool isNationwideDirectDelivery,  bool isVariableWeight,  int shippingFee,  bool isExtraImpossibleShipping,  int? extraShippingFee,  bool isJejuImpossibleShipping,  int? jejuShippingFee,  int freeShippingThreshold,  String shippingNotice,  String returnAddress,  String initialShippingFee,  String returnShippingFee,  String storageMethod,  String distributionNotice,  String handleNotice,  bool taxType,  bool isHaccpCertified,  bool initialIsHaccpCertified,  String salePeriodType,  String saleStartDate,  String saleEndDate,  dynamic mainImage,  List<dynamic> descriptionImages,  List<dynamic> galleryImages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductRegisterState() when $default != null:
return $default(_that.isMainLoading,_that.productId,_that.productName,_that.oneLineSummary,_that.manufacturerMent,_that.majorCategory,_that.majorCategoryList,_that.subCategory,_that.subCategoryList,_that.options,_that.template,_that.ingredientImage,_that.deliveryType,_that.deliveryDays,_that.sameDayShip,_that.deliveryDate,_that.cutoffTime,_that.weekdaySelected,_that.isWeekendShipping,_that.deliveryDistrictOptions,_that.directDeliveryCodes,_that.isNationwideDirectDelivery,_that.isVariableWeight,_that.shippingFee,_that.isExtraImpossibleShipping,_that.extraShippingFee,_that.isJejuImpossibleShipping,_that.jejuShippingFee,_that.freeShippingThreshold,_that.shippingNotice,_that.returnAddress,_that.initialShippingFee,_that.returnShippingFee,_that.storageMethod,_that.distributionNotice,_that.handleNotice,_that.taxType,_that.isHaccpCertified,_that.initialIsHaccpCertified,_that.salePeriodType,_that.saleStartDate,_that.saleEndDate,_that.mainImage,_that.descriptionImages,_that.galleryImages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isMainLoading,  String productId,  String productName,  String oneLineSummary,  String manufacturerMent,  ProductCategoryModel? majorCategory,  List<ProductCategoryModel> majorCategoryList,  ProductCategoryModel? subCategory,  List<ProductCategoryModel> subCategoryList,  List<RequestProductOption> options,  RequestProductOption template,  dynamic ingredientImage,  List<String> deliveryType,  String deliveryDays,  bool sameDayShip,  String deliveryDate,  String? cutoffTime,  List<Weekday> weekdaySelected,  bool isWeekendShipping,  List<DeliveryDistrictOption> deliveryDistrictOptions,  List<String> directDeliveryCodes,  bool isNationwideDirectDelivery,  bool isVariableWeight,  int shippingFee,  bool isExtraImpossibleShipping,  int? extraShippingFee,  bool isJejuImpossibleShipping,  int? jejuShippingFee,  int freeShippingThreshold,  String shippingNotice,  String returnAddress,  String initialShippingFee,  String returnShippingFee,  String storageMethod,  String distributionNotice,  String handleNotice,  bool taxType,  bool isHaccpCertified,  bool initialIsHaccpCertified,  String salePeriodType,  String saleStartDate,  String saleEndDate,  dynamic mainImage,  List<dynamic> descriptionImages,  List<dynamic> galleryImages)  $default,) {final _that = this;
switch (_that) {
case _ProductRegisterState():
return $default(_that.isMainLoading,_that.productId,_that.productName,_that.oneLineSummary,_that.manufacturerMent,_that.majorCategory,_that.majorCategoryList,_that.subCategory,_that.subCategoryList,_that.options,_that.template,_that.ingredientImage,_that.deliveryType,_that.deliveryDays,_that.sameDayShip,_that.deliveryDate,_that.cutoffTime,_that.weekdaySelected,_that.isWeekendShipping,_that.deliveryDistrictOptions,_that.directDeliveryCodes,_that.isNationwideDirectDelivery,_that.isVariableWeight,_that.shippingFee,_that.isExtraImpossibleShipping,_that.extraShippingFee,_that.isJejuImpossibleShipping,_that.jejuShippingFee,_that.freeShippingThreshold,_that.shippingNotice,_that.returnAddress,_that.initialShippingFee,_that.returnShippingFee,_that.storageMethod,_that.distributionNotice,_that.handleNotice,_that.taxType,_that.isHaccpCertified,_that.initialIsHaccpCertified,_that.salePeriodType,_that.saleStartDate,_that.saleEndDate,_that.mainImage,_that.descriptionImages,_that.galleryImages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isMainLoading,  String productId,  String productName,  String oneLineSummary,  String manufacturerMent,  ProductCategoryModel? majorCategory,  List<ProductCategoryModel> majorCategoryList,  ProductCategoryModel? subCategory,  List<ProductCategoryModel> subCategoryList,  List<RequestProductOption> options,  RequestProductOption template,  dynamic ingredientImage,  List<String> deliveryType,  String deliveryDays,  bool sameDayShip,  String deliveryDate,  String? cutoffTime,  List<Weekday> weekdaySelected,  bool isWeekendShipping,  List<DeliveryDistrictOption> deliveryDistrictOptions,  List<String> directDeliveryCodes,  bool isNationwideDirectDelivery,  bool isVariableWeight,  int shippingFee,  bool isExtraImpossibleShipping,  int? extraShippingFee,  bool isJejuImpossibleShipping,  int? jejuShippingFee,  int freeShippingThreshold,  String shippingNotice,  String returnAddress,  String initialShippingFee,  String returnShippingFee,  String storageMethod,  String distributionNotice,  String handleNotice,  bool taxType,  bool isHaccpCertified,  bool initialIsHaccpCertified,  String salePeriodType,  String saleStartDate,  String saleEndDate,  dynamic mainImage,  List<dynamic> descriptionImages,  List<dynamic> galleryImages)?  $default,) {final _that = this;
switch (_that) {
case _ProductRegisterState() when $default != null:
return $default(_that.isMainLoading,_that.productId,_that.productName,_that.oneLineSummary,_that.manufacturerMent,_that.majorCategory,_that.majorCategoryList,_that.subCategory,_that.subCategoryList,_that.options,_that.template,_that.ingredientImage,_that.deliveryType,_that.deliveryDays,_that.sameDayShip,_that.deliveryDate,_that.cutoffTime,_that.weekdaySelected,_that.isWeekendShipping,_that.deliveryDistrictOptions,_that.directDeliveryCodes,_that.isNationwideDirectDelivery,_that.isVariableWeight,_that.shippingFee,_that.isExtraImpossibleShipping,_that.extraShippingFee,_that.isJejuImpossibleShipping,_that.jejuShippingFee,_that.freeShippingThreshold,_that.shippingNotice,_that.returnAddress,_that.initialShippingFee,_that.returnShippingFee,_that.storageMethod,_that.distributionNotice,_that.handleNotice,_that.taxType,_that.isHaccpCertified,_that.initialIsHaccpCertified,_that.salePeriodType,_that.saleStartDate,_that.saleEndDate,_that.mainImage,_that.descriptionImages,_that.galleryImages);case _:
  return null;

}
}

}

/// @nodoc


class _ProductRegisterState extends ProductRegisterState {
  const _ProductRegisterState({required this.isMainLoading, required this.productId, required this.productName, required this.oneLineSummary, required this.manufacturerMent, required this.majorCategory, required final  List<ProductCategoryModel> majorCategoryList, required this.subCategory, required final  List<ProductCategoryModel> subCategoryList, required final  List<RequestProductOption> options, required this.template, required this.ingredientImage, required final  List<String> deliveryType, required this.deliveryDays, required this.sameDayShip, required this.deliveryDate, required this.cutoffTime, required final  List<Weekday> weekdaySelected, required this.isWeekendShipping, required final  List<DeliveryDistrictOption> deliveryDistrictOptions, required final  List<String> directDeliveryCodes, required this.isNationwideDirectDelivery, required this.isVariableWeight, required this.shippingFee, required this.isExtraImpossibleShipping, required this.extraShippingFee, required this.isJejuImpossibleShipping, required this.jejuShippingFee, required this.freeShippingThreshold, required this.shippingNotice, required this.returnAddress, required this.initialShippingFee, required this.returnShippingFee, required this.storageMethod, required this.distributionNotice, required this.handleNotice, required this.taxType, required this.isHaccpCertified, required this.initialIsHaccpCertified, required this.salePeriodType, required this.saleStartDate, required this.saleEndDate, required this.mainImage, required final  List<dynamic> descriptionImages, required final  List<dynamic> galleryImages}): _majorCategoryList = majorCategoryList,_subCategoryList = subCategoryList,_options = options,_deliveryType = deliveryType,_weekdaySelected = weekdaySelected,_deliveryDistrictOptions = deliveryDistrictOptions,_directDeliveryCodes = directDeliveryCodes,_descriptionImages = descriptionImages,_galleryImages = galleryImages,super._();
  

@override final  bool isMainLoading;
/// 상품 번호
@override final  String productId;
/// 상품명
@override final  String productName;
/// 상품 한줄 소개
@override final  String oneLineSummary;
@override final  String manufacturerMent;
/// 메인 카테고리, 리스트
@override final  ProductCategoryModel? majorCategory;
 final  List<ProductCategoryModel> _majorCategoryList;
@override List<ProductCategoryModel> get majorCategoryList {
  if (_majorCategoryList is EqualUnmodifiableListView) return _majorCategoryList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_majorCategoryList);
}

@override final  ProductCategoryModel? subCategory;
 final  List<ProductCategoryModel> _subCategoryList;
@override List<ProductCategoryModel> get subCategoryList {
  if (_subCategoryList is EqualUnmodifiableListView) return _subCategoryList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subCategoryList);
}

/// 옵션 리스트
 final  List<RequestProductOption> _options;
/// 옵션 리스트
@override List<RequestProductOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  RequestProductOption template;
/// 식품 성분 표시 이미지
@override final  dynamic ingredientImage;
/// 배송 방식
 final  List<String> _deliveryType;
/// 배송 방식
@override List<String> get deliveryType {
  if (_deliveryType is EqualUnmodifiableListView) return _deliveryType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deliveryType);
}

/// 배송 기간
@override final  String deliveryDays;
/// 당일 출고 on/off
@override final  bool sameDayShip;
/// 출고 소요일
@override final  String deliveryDate;
/// 당일 출고 가능 시간
@override final  String? cutoffTime;
/// 출고 가능한 요일
 final  List<Weekday> _weekdaySelected;
/// 출고 가능한 요일
@override List<Weekday> get weekdaySelected {
  if (_weekdaySelected is EqualUnmodifiableListView) return _weekdaySelected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weekdaySelected);
}

@override final  bool isWeekendShipping;
 final  List<DeliveryDistrictOption> _deliveryDistrictOptions;
@override List<DeliveryDistrictOption> get deliveryDistrictOptions {
  if (_deliveryDistrictOptions is EqualUnmodifiableListView) return _deliveryDistrictOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deliveryDistrictOptions);
}

 final  List<String> _directDeliveryCodes;
@override List<String> get directDeliveryCodes {
  if (_directDeliveryCodes is EqualUnmodifiableListView) return _directDeliveryCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_directDeliveryCodes);
}

@override final  bool isNationwideDirectDelivery;
@override final  bool isVariableWeight;
/// 배송비
@override final  int shippingFee;
/// 도서산간 지역 배송 불가능 여부 false: 가능 / true: 불가능
@override final  bool isExtraImpossibleShipping;
/// 도서산간 추가배송비
@override final  int? extraShippingFee;
/// 제주 지역 배송 가능 여부 false: 가능 / true: 불가능
@override final  bool isJejuImpossibleShipping;
/// 제주 추가배송비
@override final  int? jejuShippingFee;
/// 무료 배송 최소 금액
@override final  int freeShippingThreshold;
/// 배송 안내 문구
@override final  String shippingNotice;
/// 반품 주소지
@override final  String returnAddress;
/// 초도 배송비
@override final  String initialShippingFee;
/// 반품 배송비
@override final  String returnShippingFee;
/// 보관 방법
@override final  String storageMethod;
/// 유통 안내
@override final  String distributionNotice;
/// 취급 주의사항
@override final  String handleNotice;
/// 과세 여부
@override final  bool taxType;
@override final  bool isHaccpCertified;
@override final  bool initialIsHaccpCertified;
/// 판매 기간 타입 (상시 / 기간 설정)
@override final  String salePeriodType;
/// 판매 시작일 / 종료일
@override final  String saleStartDate;
@override final  String saleEndDate;
/// 대표 이미지
@override final  dynamic mainImage;
/// 상품 설명 이미지 리스트
 final  List<dynamic> _descriptionImages;
/// 상품 설명 이미지 리스트
@override List<dynamic> get descriptionImages {
  if (_descriptionImages is EqualUnmodifiableListView) return _descriptionImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_descriptionImages);
}

/// 상품 갤러리 이미지 리스트
 final  List<dynamic> _galleryImages;
/// 상품 갤러리 이미지 리스트
@override List<dynamic> get galleryImages {
  if (_galleryImages is EqualUnmodifiableListView) return _galleryImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_galleryImages);
}


/// Create a copy of ProductRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductRegisterStateCopyWith<_ProductRegisterState> get copyWith => __$ProductRegisterStateCopyWithImpl<_ProductRegisterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductRegisterState&&(identical(other.isMainLoading, isMainLoading) || other.isMainLoading == isMainLoading)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.oneLineSummary, oneLineSummary) || other.oneLineSummary == oneLineSummary)&&(identical(other.manufacturerMent, manufacturerMent) || other.manufacturerMent == manufacturerMent)&&(identical(other.majorCategory, majorCategory) || other.majorCategory == majorCategory)&&const DeepCollectionEquality().equals(other._majorCategoryList, _majorCategoryList)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&const DeepCollectionEquality().equals(other._subCategoryList, _subCategoryList)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.template, template) || other.template == template)&&const DeepCollectionEquality().equals(other.ingredientImage, ingredientImage)&&const DeepCollectionEquality().equals(other._deliveryType, _deliveryType)&&(identical(other.deliveryDays, deliveryDays) || other.deliveryDays == deliveryDays)&&(identical(other.sameDayShip, sameDayShip) || other.sameDayShip == sameDayShip)&&(identical(other.deliveryDate, deliveryDate) || other.deliveryDate == deliveryDate)&&(identical(other.cutoffTime, cutoffTime) || other.cutoffTime == cutoffTime)&&const DeepCollectionEquality().equals(other._weekdaySelected, _weekdaySelected)&&(identical(other.isWeekendShipping, isWeekendShipping) || other.isWeekendShipping == isWeekendShipping)&&const DeepCollectionEquality().equals(other._deliveryDistrictOptions, _deliveryDistrictOptions)&&const DeepCollectionEquality().equals(other._directDeliveryCodes, _directDeliveryCodes)&&(identical(other.isNationwideDirectDelivery, isNationwideDirectDelivery) || other.isNationwideDirectDelivery == isNationwideDirectDelivery)&&(identical(other.isVariableWeight, isVariableWeight) || other.isVariableWeight == isVariableWeight)&&(identical(other.shippingFee, shippingFee) || other.shippingFee == shippingFee)&&(identical(other.isExtraImpossibleShipping, isExtraImpossibleShipping) || other.isExtraImpossibleShipping == isExtraImpossibleShipping)&&(identical(other.extraShippingFee, extraShippingFee) || other.extraShippingFee == extraShippingFee)&&(identical(other.isJejuImpossibleShipping, isJejuImpossibleShipping) || other.isJejuImpossibleShipping == isJejuImpossibleShipping)&&(identical(other.jejuShippingFee, jejuShippingFee) || other.jejuShippingFee == jejuShippingFee)&&(identical(other.freeShippingThreshold, freeShippingThreshold) || other.freeShippingThreshold == freeShippingThreshold)&&(identical(other.shippingNotice, shippingNotice) || other.shippingNotice == shippingNotice)&&(identical(other.returnAddress, returnAddress) || other.returnAddress == returnAddress)&&(identical(other.initialShippingFee, initialShippingFee) || other.initialShippingFee == initialShippingFee)&&(identical(other.returnShippingFee, returnShippingFee) || other.returnShippingFee == returnShippingFee)&&(identical(other.storageMethod, storageMethod) || other.storageMethod == storageMethod)&&(identical(other.distributionNotice, distributionNotice) || other.distributionNotice == distributionNotice)&&(identical(other.handleNotice, handleNotice) || other.handleNotice == handleNotice)&&(identical(other.taxType, taxType) || other.taxType == taxType)&&(identical(other.isHaccpCertified, isHaccpCertified) || other.isHaccpCertified == isHaccpCertified)&&(identical(other.initialIsHaccpCertified, initialIsHaccpCertified) || other.initialIsHaccpCertified == initialIsHaccpCertified)&&(identical(other.salePeriodType, salePeriodType) || other.salePeriodType == salePeriodType)&&(identical(other.saleStartDate, saleStartDate) || other.saleStartDate == saleStartDate)&&(identical(other.saleEndDate, saleEndDate) || other.saleEndDate == saleEndDate)&&const DeepCollectionEquality().equals(other.mainImage, mainImage)&&const DeepCollectionEquality().equals(other._descriptionImages, _descriptionImages)&&const DeepCollectionEquality().equals(other._galleryImages, _galleryImages));
}


@override
int get hashCode => Object.hashAll([runtimeType,isMainLoading,productId,productName,oneLineSummary,manufacturerMent,majorCategory,const DeepCollectionEquality().hash(_majorCategoryList),subCategory,const DeepCollectionEquality().hash(_subCategoryList),const DeepCollectionEquality().hash(_options),template,const DeepCollectionEquality().hash(ingredientImage),const DeepCollectionEquality().hash(_deliveryType),deliveryDays,sameDayShip,deliveryDate,cutoffTime,const DeepCollectionEquality().hash(_weekdaySelected),isWeekendShipping,const DeepCollectionEquality().hash(_deliveryDistrictOptions),const DeepCollectionEquality().hash(_directDeliveryCodes),isNationwideDirectDelivery,isVariableWeight,shippingFee,isExtraImpossibleShipping,extraShippingFee,isJejuImpossibleShipping,jejuShippingFee,freeShippingThreshold,shippingNotice,returnAddress,initialShippingFee,returnShippingFee,storageMethod,distributionNotice,handleNotice,taxType,isHaccpCertified,initialIsHaccpCertified,salePeriodType,saleStartDate,saleEndDate,const DeepCollectionEquality().hash(mainImage),const DeepCollectionEquality().hash(_descriptionImages),const DeepCollectionEquality().hash(_galleryImages)]);

@override
String toString() {
  return 'ProductRegisterState(isMainLoading: $isMainLoading, productId: $productId, productName: $productName, oneLineSummary: $oneLineSummary, manufacturerMent: $manufacturerMent, majorCategory: $majorCategory, majorCategoryList: $majorCategoryList, subCategory: $subCategory, subCategoryList: $subCategoryList, options: $options, template: $template, ingredientImage: $ingredientImage, deliveryType: $deliveryType, deliveryDays: $deliveryDays, sameDayShip: $sameDayShip, deliveryDate: $deliveryDate, cutoffTime: $cutoffTime, weekdaySelected: $weekdaySelected, isWeekendShipping: $isWeekendShipping, deliveryDistrictOptions: $deliveryDistrictOptions, directDeliveryCodes: $directDeliveryCodes, isNationwideDirectDelivery: $isNationwideDirectDelivery, isVariableWeight: $isVariableWeight, shippingFee: $shippingFee, isExtraImpossibleShipping: $isExtraImpossibleShipping, extraShippingFee: $extraShippingFee, isJejuImpossibleShipping: $isJejuImpossibleShipping, jejuShippingFee: $jejuShippingFee, freeShippingThreshold: $freeShippingThreshold, shippingNotice: $shippingNotice, returnAddress: $returnAddress, initialShippingFee: $initialShippingFee, returnShippingFee: $returnShippingFee, storageMethod: $storageMethod, distributionNotice: $distributionNotice, handleNotice: $handleNotice, taxType: $taxType, isHaccpCertified: $isHaccpCertified, initialIsHaccpCertified: $initialIsHaccpCertified, salePeriodType: $salePeriodType, saleStartDate: $saleStartDate, saleEndDate: $saleEndDate, mainImage: $mainImage, descriptionImages: $descriptionImages, galleryImages: $galleryImages)';
}


}

/// @nodoc
abstract mixin class _$ProductRegisterStateCopyWith<$Res> implements $ProductRegisterStateCopyWith<$Res> {
  factory _$ProductRegisterStateCopyWith(_ProductRegisterState value, $Res Function(_ProductRegisterState) _then) = __$ProductRegisterStateCopyWithImpl;
@override @useResult
$Res call({
 bool isMainLoading, String productId, String productName, String oneLineSummary, String manufacturerMent, ProductCategoryModel? majorCategory, List<ProductCategoryModel> majorCategoryList, ProductCategoryModel? subCategory, List<ProductCategoryModel> subCategoryList, List<RequestProductOption> options, RequestProductOption template, dynamic ingredientImage, List<String> deliveryType, String deliveryDays, bool sameDayShip, String deliveryDate, String? cutoffTime, List<Weekday> weekdaySelected, bool isWeekendShipping, List<DeliveryDistrictOption> deliveryDistrictOptions, List<String> directDeliveryCodes, bool isNationwideDirectDelivery, bool isVariableWeight, int shippingFee, bool isExtraImpossibleShipping, int? extraShippingFee, bool isJejuImpossibleShipping, int? jejuShippingFee, int freeShippingThreshold, String shippingNotice, String returnAddress, String initialShippingFee, String returnShippingFee, String storageMethod, String distributionNotice, String handleNotice, bool taxType, bool isHaccpCertified, bool initialIsHaccpCertified, String salePeriodType, String saleStartDate, String saleEndDate, dynamic mainImage, List<dynamic> descriptionImages, List<dynamic> galleryImages
});


@override $RequestProductOptionCopyWith<$Res> get template;

}
/// @nodoc
class __$ProductRegisterStateCopyWithImpl<$Res>
    implements _$ProductRegisterStateCopyWith<$Res> {
  __$ProductRegisterStateCopyWithImpl(this._self, this._then);

  final _ProductRegisterState _self;
  final $Res Function(_ProductRegisterState) _then;

/// Create a copy of ProductRegisterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isMainLoading = null,Object? productId = null,Object? productName = null,Object? oneLineSummary = null,Object? manufacturerMent = null,Object? majorCategory = freezed,Object? majorCategoryList = null,Object? subCategory = freezed,Object? subCategoryList = null,Object? options = null,Object? template = null,Object? ingredientImage = freezed,Object? deliveryType = null,Object? deliveryDays = null,Object? sameDayShip = null,Object? deliveryDate = null,Object? cutoffTime = freezed,Object? weekdaySelected = null,Object? isWeekendShipping = null,Object? deliveryDistrictOptions = null,Object? directDeliveryCodes = null,Object? isNationwideDirectDelivery = null,Object? isVariableWeight = null,Object? shippingFee = null,Object? isExtraImpossibleShipping = null,Object? extraShippingFee = freezed,Object? isJejuImpossibleShipping = null,Object? jejuShippingFee = freezed,Object? freeShippingThreshold = null,Object? shippingNotice = null,Object? returnAddress = null,Object? initialShippingFee = null,Object? returnShippingFee = null,Object? storageMethod = null,Object? distributionNotice = null,Object? handleNotice = null,Object? taxType = null,Object? isHaccpCertified = null,Object? initialIsHaccpCertified = null,Object? salePeriodType = null,Object? saleStartDate = null,Object? saleEndDate = null,Object? mainImage = freezed,Object? descriptionImages = null,Object? galleryImages = null,}) {
  return _then(_ProductRegisterState(
isMainLoading: null == isMainLoading ? _self.isMainLoading : isMainLoading // ignore: cast_nullable_to_non_nullable
as bool,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,oneLineSummary: null == oneLineSummary ? _self.oneLineSummary : oneLineSummary // ignore: cast_nullable_to_non_nullable
as String,manufacturerMent: null == manufacturerMent ? _self.manufacturerMent : manufacturerMent // ignore: cast_nullable_to_non_nullable
as String,majorCategory: freezed == majorCategory ? _self.majorCategory : majorCategory // ignore: cast_nullable_to_non_nullable
as ProductCategoryModel?,majorCategoryList: null == majorCategoryList ? _self._majorCategoryList : majorCategoryList // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryModel>,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as ProductCategoryModel?,subCategoryList: null == subCategoryList ? _self._subCategoryList : subCategoryList // ignore: cast_nullable_to_non_nullable
as List<ProductCategoryModel>,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<RequestProductOption>,template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as RequestProductOption,ingredientImage: freezed == ingredientImage ? _self.ingredientImage : ingredientImage // ignore: cast_nullable_to_non_nullable
as dynamic,deliveryType: null == deliveryType ? _self._deliveryType : deliveryType // ignore: cast_nullable_to_non_nullable
as List<String>,deliveryDays: null == deliveryDays ? _self.deliveryDays : deliveryDays // ignore: cast_nullable_to_non_nullable
as String,sameDayShip: null == sameDayShip ? _self.sameDayShip : sameDayShip // ignore: cast_nullable_to_non_nullable
as bool,deliveryDate: null == deliveryDate ? _self.deliveryDate : deliveryDate // ignore: cast_nullable_to_non_nullable
as String,cutoffTime: freezed == cutoffTime ? _self.cutoffTime : cutoffTime // ignore: cast_nullable_to_non_nullable
as String?,weekdaySelected: null == weekdaySelected ? _self._weekdaySelected : weekdaySelected // ignore: cast_nullable_to_non_nullable
as List<Weekday>,isWeekendShipping: null == isWeekendShipping ? _self.isWeekendShipping : isWeekendShipping // ignore: cast_nullable_to_non_nullable
as bool,deliveryDistrictOptions: null == deliveryDistrictOptions ? _self._deliveryDistrictOptions : deliveryDistrictOptions // ignore: cast_nullable_to_non_nullable
as List<DeliveryDistrictOption>,directDeliveryCodes: null == directDeliveryCodes ? _self._directDeliveryCodes : directDeliveryCodes // ignore: cast_nullable_to_non_nullable
as List<String>,isNationwideDirectDelivery: null == isNationwideDirectDelivery ? _self.isNationwideDirectDelivery : isNationwideDirectDelivery // ignore: cast_nullable_to_non_nullable
as bool,isVariableWeight: null == isVariableWeight ? _self.isVariableWeight : isVariableWeight // ignore: cast_nullable_to_non_nullable
as bool,shippingFee: null == shippingFee ? _self.shippingFee : shippingFee // ignore: cast_nullable_to_non_nullable
as int,isExtraImpossibleShipping: null == isExtraImpossibleShipping ? _self.isExtraImpossibleShipping : isExtraImpossibleShipping // ignore: cast_nullable_to_non_nullable
as bool,extraShippingFee: freezed == extraShippingFee ? _self.extraShippingFee : extraShippingFee // ignore: cast_nullable_to_non_nullable
as int?,isJejuImpossibleShipping: null == isJejuImpossibleShipping ? _self.isJejuImpossibleShipping : isJejuImpossibleShipping // ignore: cast_nullable_to_non_nullable
as bool,jejuShippingFee: freezed == jejuShippingFee ? _self.jejuShippingFee : jejuShippingFee // ignore: cast_nullable_to_non_nullable
as int?,freeShippingThreshold: null == freeShippingThreshold ? _self.freeShippingThreshold : freeShippingThreshold // ignore: cast_nullable_to_non_nullable
as int,shippingNotice: null == shippingNotice ? _self.shippingNotice : shippingNotice // ignore: cast_nullable_to_non_nullable
as String,returnAddress: null == returnAddress ? _self.returnAddress : returnAddress // ignore: cast_nullable_to_non_nullable
as String,initialShippingFee: null == initialShippingFee ? _self.initialShippingFee : initialShippingFee // ignore: cast_nullable_to_non_nullable
as String,returnShippingFee: null == returnShippingFee ? _self.returnShippingFee : returnShippingFee // ignore: cast_nullable_to_non_nullable
as String,storageMethod: null == storageMethod ? _self.storageMethod : storageMethod // ignore: cast_nullable_to_non_nullable
as String,distributionNotice: null == distributionNotice ? _self.distributionNotice : distributionNotice // ignore: cast_nullable_to_non_nullable
as String,handleNotice: null == handleNotice ? _self.handleNotice : handleNotice // ignore: cast_nullable_to_non_nullable
as String,taxType: null == taxType ? _self.taxType : taxType // ignore: cast_nullable_to_non_nullable
as bool,isHaccpCertified: null == isHaccpCertified ? _self.isHaccpCertified : isHaccpCertified // ignore: cast_nullable_to_non_nullable
as bool,initialIsHaccpCertified: null == initialIsHaccpCertified ? _self.initialIsHaccpCertified : initialIsHaccpCertified // ignore: cast_nullable_to_non_nullable
as bool,salePeriodType: null == salePeriodType ? _self.salePeriodType : salePeriodType // ignore: cast_nullable_to_non_nullable
as String,saleStartDate: null == saleStartDate ? _self.saleStartDate : saleStartDate // ignore: cast_nullable_to_non_nullable
as String,saleEndDate: null == saleEndDate ? _self.saleEndDate : saleEndDate // ignore: cast_nullable_to_non_nullable
as String,mainImage: freezed == mainImage ? _self.mainImage : mainImage // ignore: cast_nullable_to_non_nullable
as dynamic,descriptionImages: null == descriptionImages ? _self._descriptionImages : descriptionImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,galleryImages: null == galleryImages ? _self._galleryImages : galleryImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

/// Create a copy of ProductRegisterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestProductOptionCopyWith<$Res> get template {
  
  return $RequestProductOptionCopyWith<$Res>(_self.template, (value) {
    return _then(_self.copyWith(template: value));
  });
}
}

// dart format on
