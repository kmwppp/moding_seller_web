// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateProductModel {

 String get name; String get description; int get categoryId; List<RequestProductOption> get options; List<String> get deliveryMethods; int get deliveryDays; int get shippingLeadTime; String? get shippingCutoffTime; bool get isWeekendShipping;@JsonKey(includeIfNull: false) List<String>? get directDeliveryCodes; int get shippingFee; bool get isRemoteAreaUnavailable; int get remoteAreaShippingFee; bool get isJejuUnavailable; int get jejuShippingFee; String get shippingNotice; int get freeShippingThreshold;// @Default(0) int initialShippingFee,
// @Default(0) int returnShippingFee,
 String get storageMethod; String get distributionNotice; String get handlingPrecaution; bool get isTaxable; bool get isHaccpCertified; bool get isVariableWeight; String? get saleStartAt; String? get saleEndAt; String get sampleProvisionType; int get samplePrice; int get sampleShippingFee;@JsonKey(includeIfNull: false) List<String>? get galleryImages;@JsonKey(includeIfNull: false) List<String>? get descriptionImages;
/// Create a copy of CreateProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProductModelCopyWith<CreateProductModel> get copyWith => _$CreateProductModelCopyWithImpl<CreateProductModel>(this as CreateProductModel, _$identity);

  /// Serializes this CreateProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProductModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.deliveryMethods, deliveryMethods)&&(identical(other.deliveryDays, deliveryDays) || other.deliveryDays == deliveryDays)&&(identical(other.shippingLeadTime, shippingLeadTime) || other.shippingLeadTime == shippingLeadTime)&&(identical(other.shippingCutoffTime, shippingCutoffTime) || other.shippingCutoffTime == shippingCutoffTime)&&(identical(other.isWeekendShipping, isWeekendShipping) || other.isWeekendShipping == isWeekendShipping)&&const DeepCollectionEquality().equals(other.directDeliveryCodes, directDeliveryCodes)&&(identical(other.shippingFee, shippingFee) || other.shippingFee == shippingFee)&&(identical(other.isRemoteAreaUnavailable, isRemoteAreaUnavailable) || other.isRemoteAreaUnavailable == isRemoteAreaUnavailable)&&(identical(other.remoteAreaShippingFee, remoteAreaShippingFee) || other.remoteAreaShippingFee == remoteAreaShippingFee)&&(identical(other.isJejuUnavailable, isJejuUnavailable) || other.isJejuUnavailable == isJejuUnavailable)&&(identical(other.jejuShippingFee, jejuShippingFee) || other.jejuShippingFee == jejuShippingFee)&&(identical(other.shippingNotice, shippingNotice) || other.shippingNotice == shippingNotice)&&(identical(other.freeShippingThreshold, freeShippingThreshold) || other.freeShippingThreshold == freeShippingThreshold)&&(identical(other.storageMethod, storageMethod) || other.storageMethod == storageMethod)&&(identical(other.distributionNotice, distributionNotice) || other.distributionNotice == distributionNotice)&&(identical(other.handlingPrecaution, handlingPrecaution) || other.handlingPrecaution == handlingPrecaution)&&(identical(other.isTaxable, isTaxable) || other.isTaxable == isTaxable)&&(identical(other.isHaccpCertified, isHaccpCertified) || other.isHaccpCertified == isHaccpCertified)&&(identical(other.isVariableWeight, isVariableWeight) || other.isVariableWeight == isVariableWeight)&&(identical(other.saleStartAt, saleStartAt) || other.saleStartAt == saleStartAt)&&(identical(other.saleEndAt, saleEndAt) || other.saleEndAt == saleEndAt)&&(identical(other.sampleProvisionType, sampleProvisionType) || other.sampleProvisionType == sampleProvisionType)&&(identical(other.samplePrice, samplePrice) || other.samplePrice == samplePrice)&&(identical(other.sampleShippingFee, sampleShippingFee) || other.sampleShippingFee == sampleShippingFee)&&const DeepCollectionEquality().equals(other.galleryImages, galleryImages)&&const DeepCollectionEquality().equals(other.descriptionImages, descriptionImages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,description,categoryId,const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(deliveryMethods),deliveryDays,shippingLeadTime,shippingCutoffTime,isWeekendShipping,const DeepCollectionEquality().hash(directDeliveryCodes),shippingFee,isRemoteAreaUnavailable,remoteAreaShippingFee,isJejuUnavailable,jejuShippingFee,shippingNotice,freeShippingThreshold,storageMethod,distributionNotice,handlingPrecaution,isTaxable,isHaccpCertified,isVariableWeight,saleStartAt,saleEndAt,sampleProvisionType,samplePrice,sampleShippingFee,const DeepCollectionEquality().hash(galleryImages),const DeepCollectionEquality().hash(descriptionImages)]);

@override
String toString() {
  return 'CreateProductModel(name: $name, description: $description, categoryId: $categoryId, options: $options, deliveryMethods: $deliveryMethods, deliveryDays: $deliveryDays, shippingLeadTime: $shippingLeadTime, shippingCutoffTime: $shippingCutoffTime, isWeekendShipping: $isWeekendShipping, directDeliveryCodes: $directDeliveryCodes, shippingFee: $shippingFee, isRemoteAreaUnavailable: $isRemoteAreaUnavailable, remoteAreaShippingFee: $remoteAreaShippingFee, isJejuUnavailable: $isJejuUnavailable, jejuShippingFee: $jejuShippingFee, shippingNotice: $shippingNotice, freeShippingThreshold: $freeShippingThreshold, storageMethod: $storageMethod, distributionNotice: $distributionNotice, handlingPrecaution: $handlingPrecaution, isTaxable: $isTaxable, isHaccpCertified: $isHaccpCertified, isVariableWeight: $isVariableWeight, saleStartAt: $saleStartAt, saleEndAt: $saleEndAt, sampleProvisionType: $sampleProvisionType, samplePrice: $samplePrice, sampleShippingFee: $sampleShippingFee, galleryImages: $galleryImages, descriptionImages: $descriptionImages)';
}


}

/// @nodoc
abstract mixin class $CreateProductModelCopyWith<$Res>  {
  factory $CreateProductModelCopyWith(CreateProductModel value, $Res Function(CreateProductModel) _then) = _$CreateProductModelCopyWithImpl;
@useResult
$Res call({
 String name, String description, int categoryId, List<RequestProductOption> options, List<String> deliveryMethods, int deliveryDays, int shippingLeadTime, String? shippingCutoffTime, bool isWeekendShipping,@JsonKey(includeIfNull: false) List<String>? directDeliveryCodes, int shippingFee, bool isRemoteAreaUnavailable, int remoteAreaShippingFee, bool isJejuUnavailable, int jejuShippingFee, String shippingNotice, int freeShippingThreshold, String storageMethod, String distributionNotice, String handlingPrecaution, bool isTaxable, bool isHaccpCertified, bool isVariableWeight, String? saleStartAt, String? saleEndAt, String sampleProvisionType, int samplePrice, int sampleShippingFee,@JsonKey(includeIfNull: false) List<String>? galleryImages,@JsonKey(includeIfNull: false) List<String>? descriptionImages
});




}
/// @nodoc
class _$CreateProductModelCopyWithImpl<$Res>
    implements $CreateProductModelCopyWith<$Res> {
  _$CreateProductModelCopyWithImpl(this._self, this._then);

  final CreateProductModel _self;
  final $Res Function(CreateProductModel) _then;

/// Create a copy of CreateProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? categoryId = null,Object? options = null,Object? deliveryMethods = null,Object? deliveryDays = null,Object? shippingLeadTime = null,Object? shippingCutoffTime = freezed,Object? isWeekendShipping = null,Object? directDeliveryCodes = freezed,Object? shippingFee = null,Object? isRemoteAreaUnavailable = null,Object? remoteAreaShippingFee = null,Object? isJejuUnavailable = null,Object? jejuShippingFee = null,Object? shippingNotice = null,Object? freeShippingThreshold = null,Object? storageMethod = null,Object? distributionNotice = null,Object? handlingPrecaution = null,Object? isTaxable = null,Object? isHaccpCertified = null,Object? isVariableWeight = null,Object? saleStartAt = freezed,Object? saleEndAt = freezed,Object? sampleProvisionType = null,Object? samplePrice = null,Object? sampleShippingFee = null,Object? galleryImages = freezed,Object? descriptionImages = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<RequestProductOption>,deliveryMethods: null == deliveryMethods ? _self.deliveryMethods : deliveryMethods // ignore: cast_nullable_to_non_nullable
as List<String>,deliveryDays: null == deliveryDays ? _self.deliveryDays : deliveryDays // ignore: cast_nullable_to_non_nullable
as int,shippingLeadTime: null == shippingLeadTime ? _self.shippingLeadTime : shippingLeadTime // ignore: cast_nullable_to_non_nullable
as int,shippingCutoffTime: freezed == shippingCutoffTime ? _self.shippingCutoffTime : shippingCutoffTime // ignore: cast_nullable_to_non_nullable
as String?,isWeekendShipping: null == isWeekendShipping ? _self.isWeekendShipping : isWeekendShipping // ignore: cast_nullable_to_non_nullable
as bool,directDeliveryCodes: freezed == directDeliveryCodes ? _self.directDeliveryCodes : directDeliveryCodes // ignore: cast_nullable_to_non_nullable
as List<String>?,shippingFee: null == shippingFee ? _self.shippingFee : shippingFee // ignore: cast_nullable_to_non_nullable
as int,isRemoteAreaUnavailable: null == isRemoteAreaUnavailable ? _self.isRemoteAreaUnavailable : isRemoteAreaUnavailable // ignore: cast_nullable_to_non_nullable
as bool,remoteAreaShippingFee: null == remoteAreaShippingFee ? _self.remoteAreaShippingFee : remoteAreaShippingFee // ignore: cast_nullable_to_non_nullable
as int,isJejuUnavailable: null == isJejuUnavailable ? _self.isJejuUnavailable : isJejuUnavailable // ignore: cast_nullable_to_non_nullable
as bool,jejuShippingFee: null == jejuShippingFee ? _self.jejuShippingFee : jejuShippingFee // ignore: cast_nullable_to_non_nullable
as int,shippingNotice: null == shippingNotice ? _self.shippingNotice : shippingNotice // ignore: cast_nullable_to_non_nullable
as String,freeShippingThreshold: null == freeShippingThreshold ? _self.freeShippingThreshold : freeShippingThreshold // ignore: cast_nullable_to_non_nullable
as int,storageMethod: null == storageMethod ? _self.storageMethod : storageMethod // ignore: cast_nullable_to_non_nullable
as String,distributionNotice: null == distributionNotice ? _self.distributionNotice : distributionNotice // ignore: cast_nullable_to_non_nullable
as String,handlingPrecaution: null == handlingPrecaution ? _self.handlingPrecaution : handlingPrecaution // ignore: cast_nullable_to_non_nullable
as String,isTaxable: null == isTaxable ? _self.isTaxable : isTaxable // ignore: cast_nullable_to_non_nullable
as bool,isHaccpCertified: null == isHaccpCertified ? _self.isHaccpCertified : isHaccpCertified // ignore: cast_nullable_to_non_nullable
as bool,isVariableWeight: null == isVariableWeight ? _self.isVariableWeight : isVariableWeight // ignore: cast_nullable_to_non_nullable
as bool,saleStartAt: freezed == saleStartAt ? _self.saleStartAt : saleStartAt // ignore: cast_nullable_to_non_nullable
as String?,saleEndAt: freezed == saleEndAt ? _self.saleEndAt : saleEndAt // ignore: cast_nullable_to_non_nullable
as String?,sampleProvisionType: null == sampleProvisionType ? _self.sampleProvisionType : sampleProvisionType // ignore: cast_nullable_to_non_nullable
as String,samplePrice: null == samplePrice ? _self.samplePrice : samplePrice // ignore: cast_nullable_to_non_nullable
as int,sampleShippingFee: null == sampleShippingFee ? _self.sampleShippingFee : sampleShippingFee // ignore: cast_nullable_to_non_nullable
as int,galleryImages: freezed == galleryImages ? _self.galleryImages : galleryImages // ignore: cast_nullable_to_non_nullable
as List<String>?,descriptionImages: freezed == descriptionImages ? _self.descriptionImages : descriptionImages // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateProductModel].
extension CreateProductModelPatterns on CreateProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateProductModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  int categoryId,  List<RequestProductOption> options,  List<String> deliveryMethods,  int deliveryDays,  int shippingLeadTime,  String? shippingCutoffTime,  bool isWeekendShipping, @JsonKey(includeIfNull: false)  List<String>? directDeliveryCodes,  int shippingFee,  bool isRemoteAreaUnavailable,  int remoteAreaShippingFee,  bool isJejuUnavailable,  int jejuShippingFee,  String shippingNotice,  int freeShippingThreshold,  String storageMethod,  String distributionNotice,  String handlingPrecaution,  bool isTaxable,  bool isHaccpCertified,  bool isVariableWeight,  String? saleStartAt,  String? saleEndAt,  String sampleProvisionType,  int samplePrice,  int sampleShippingFee, @JsonKey(includeIfNull: false)  List<String>? galleryImages, @JsonKey(includeIfNull: false)  List<String>? descriptionImages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateProductModel() when $default != null:
return $default(_that.name,_that.description,_that.categoryId,_that.options,_that.deliveryMethods,_that.deliveryDays,_that.shippingLeadTime,_that.shippingCutoffTime,_that.isWeekendShipping,_that.directDeliveryCodes,_that.shippingFee,_that.isRemoteAreaUnavailable,_that.remoteAreaShippingFee,_that.isJejuUnavailable,_that.jejuShippingFee,_that.shippingNotice,_that.freeShippingThreshold,_that.storageMethod,_that.distributionNotice,_that.handlingPrecaution,_that.isTaxable,_that.isHaccpCertified,_that.isVariableWeight,_that.saleStartAt,_that.saleEndAt,_that.sampleProvisionType,_that.samplePrice,_that.sampleShippingFee,_that.galleryImages,_that.descriptionImages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  int categoryId,  List<RequestProductOption> options,  List<String> deliveryMethods,  int deliveryDays,  int shippingLeadTime,  String? shippingCutoffTime,  bool isWeekendShipping, @JsonKey(includeIfNull: false)  List<String>? directDeliveryCodes,  int shippingFee,  bool isRemoteAreaUnavailable,  int remoteAreaShippingFee,  bool isJejuUnavailable,  int jejuShippingFee,  String shippingNotice,  int freeShippingThreshold,  String storageMethod,  String distributionNotice,  String handlingPrecaution,  bool isTaxable,  bool isHaccpCertified,  bool isVariableWeight,  String? saleStartAt,  String? saleEndAt,  String sampleProvisionType,  int samplePrice,  int sampleShippingFee, @JsonKey(includeIfNull: false)  List<String>? galleryImages, @JsonKey(includeIfNull: false)  List<String>? descriptionImages)  $default,) {final _that = this;
switch (_that) {
case _CreateProductModel():
return $default(_that.name,_that.description,_that.categoryId,_that.options,_that.deliveryMethods,_that.deliveryDays,_that.shippingLeadTime,_that.shippingCutoffTime,_that.isWeekendShipping,_that.directDeliveryCodes,_that.shippingFee,_that.isRemoteAreaUnavailable,_that.remoteAreaShippingFee,_that.isJejuUnavailable,_that.jejuShippingFee,_that.shippingNotice,_that.freeShippingThreshold,_that.storageMethod,_that.distributionNotice,_that.handlingPrecaution,_that.isTaxable,_that.isHaccpCertified,_that.isVariableWeight,_that.saleStartAt,_that.saleEndAt,_that.sampleProvisionType,_that.samplePrice,_that.sampleShippingFee,_that.galleryImages,_that.descriptionImages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  int categoryId,  List<RequestProductOption> options,  List<String> deliveryMethods,  int deliveryDays,  int shippingLeadTime,  String? shippingCutoffTime,  bool isWeekendShipping, @JsonKey(includeIfNull: false)  List<String>? directDeliveryCodes,  int shippingFee,  bool isRemoteAreaUnavailable,  int remoteAreaShippingFee,  bool isJejuUnavailable,  int jejuShippingFee,  String shippingNotice,  int freeShippingThreshold,  String storageMethod,  String distributionNotice,  String handlingPrecaution,  bool isTaxable,  bool isHaccpCertified,  bool isVariableWeight,  String? saleStartAt,  String? saleEndAt,  String sampleProvisionType,  int samplePrice,  int sampleShippingFee, @JsonKey(includeIfNull: false)  List<String>? galleryImages, @JsonKey(includeIfNull: false)  List<String>? descriptionImages)?  $default,) {final _that = this;
switch (_that) {
case _CreateProductModel() when $default != null:
return $default(_that.name,_that.description,_that.categoryId,_that.options,_that.deliveryMethods,_that.deliveryDays,_that.shippingLeadTime,_that.shippingCutoffTime,_that.isWeekendShipping,_that.directDeliveryCodes,_that.shippingFee,_that.isRemoteAreaUnavailable,_that.remoteAreaShippingFee,_that.isJejuUnavailable,_that.jejuShippingFee,_that.shippingNotice,_that.freeShippingThreshold,_that.storageMethod,_that.distributionNotice,_that.handlingPrecaution,_that.isTaxable,_that.isHaccpCertified,_that.isVariableWeight,_that.saleStartAt,_that.saleEndAt,_that.sampleProvisionType,_that.samplePrice,_that.sampleShippingFee,_that.galleryImages,_that.descriptionImages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateProductModel implements CreateProductModel {
  const _CreateProductModel({this.name = '', this.description = '', this.categoryId = 0, final  List<RequestProductOption> options = const <RequestProductOption>[], final  List<String> deliveryMethods = const <String>[], this.deliveryDays = 0, this.shippingLeadTime = 0, this.shippingCutoffTime = null, this.isWeekendShipping = false, @JsonKey(includeIfNull: false) final  List<String>? directDeliveryCodes, this.shippingFee = 0, this.isRemoteAreaUnavailable = false, this.remoteAreaShippingFee = 0, this.isJejuUnavailable = false, this.jejuShippingFee = 0, this.shippingNotice = '', this.freeShippingThreshold = 0, this.storageMethod = '', this.distributionNotice = '', this.handlingPrecaution = '', this.isTaxable = false, this.isHaccpCertified = false, this.isVariableWeight = false, this.saleStartAt, this.saleEndAt, this.sampleProvisionType = '', this.samplePrice = 0, this.sampleShippingFee = 0, @JsonKey(includeIfNull: false) final  List<String>? galleryImages, @JsonKey(includeIfNull: false) final  List<String>? descriptionImages}): _options = options,_deliveryMethods = deliveryMethods,_directDeliveryCodes = directDeliveryCodes,_galleryImages = galleryImages,_descriptionImages = descriptionImages;
  factory _CreateProductModel.fromJson(Map<String, dynamic> json) => _$CreateProductModelFromJson(json);

@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override@JsonKey() final  int categoryId;
 final  List<RequestProductOption> _options;
@override@JsonKey() List<RequestProductOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

 final  List<String> _deliveryMethods;
@override@JsonKey() List<String> get deliveryMethods {
  if (_deliveryMethods is EqualUnmodifiableListView) return _deliveryMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deliveryMethods);
}

@override@JsonKey() final  int deliveryDays;
@override@JsonKey() final  int shippingLeadTime;
@override@JsonKey() final  String? shippingCutoffTime;
@override@JsonKey() final  bool isWeekendShipping;
 final  List<String>? _directDeliveryCodes;
@override@JsonKey(includeIfNull: false) List<String>? get directDeliveryCodes {
  final value = _directDeliveryCodes;
  if (value == null) return null;
  if (_directDeliveryCodes is EqualUnmodifiableListView) return _directDeliveryCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  int shippingFee;
@override@JsonKey() final  bool isRemoteAreaUnavailable;
@override@JsonKey() final  int remoteAreaShippingFee;
@override@JsonKey() final  bool isJejuUnavailable;
@override@JsonKey() final  int jejuShippingFee;
@override@JsonKey() final  String shippingNotice;
@override@JsonKey() final  int freeShippingThreshold;
// @Default(0) int initialShippingFee,
// @Default(0) int returnShippingFee,
@override@JsonKey() final  String storageMethod;
@override@JsonKey() final  String distributionNotice;
@override@JsonKey() final  String handlingPrecaution;
@override@JsonKey() final  bool isTaxable;
@override@JsonKey() final  bool isHaccpCertified;
@override@JsonKey() final  bool isVariableWeight;
@override final  String? saleStartAt;
@override final  String? saleEndAt;
@override@JsonKey() final  String sampleProvisionType;
@override@JsonKey() final  int samplePrice;
@override@JsonKey() final  int sampleShippingFee;
 final  List<String>? _galleryImages;
@override@JsonKey(includeIfNull: false) List<String>? get galleryImages {
  final value = _galleryImages;
  if (value == null) return null;
  if (_galleryImages is EqualUnmodifiableListView) return _galleryImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _descriptionImages;
@override@JsonKey(includeIfNull: false) List<String>? get descriptionImages {
  final value = _descriptionImages;
  if (value == null) return null;
  if (_descriptionImages is EqualUnmodifiableListView) return _descriptionImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CreateProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateProductModelCopyWith<_CreateProductModel> get copyWith => __$CreateProductModelCopyWithImpl<_CreateProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateProductModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other._deliveryMethods, _deliveryMethods)&&(identical(other.deliveryDays, deliveryDays) || other.deliveryDays == deliveryDays)&&(identical(other.shippingLeadTime, shippingLeadTime) || other.shippingLeadTime == shippingLeadTime)&&(identical(other.shippingCutoffTime, shippingCutoffTime) || other.shippingCutoffTime == shippingCutoffTime)&&(identical(other.isWeekendShipping, isWeekendShipping) || other.isWeekendShipping == isWeekendShipping)&&const DeepCollectionEquality().equals(other._directDeliveryCodes, _directDeliveryCodes)&&(identical(other.shippingFee, shippingFee) || other.shippingFee == shippingFee)&&(identical(other.isRemoteAreaUnavailable, isRemoteAreaUnavailable) || other.isRemoteAreaUnavailable == isRemoteAreaUnavailable)&&(identical(other.remoteAreaShippingFee, remoteAreaShippingFee) || other.remoteAreaShippingFee == remoteAreaShippingFee)&&(identical(other.isJejuUnavailable, isJejuUnavailable) || other.isJejuUnavailable == isJejuUnavailable)&&(identical(other.jejuShippingFee, jejuShippingFee) || other.jejuShippingFee == jejuShippingFee)&&(identical(other.shippingNotice, shippingNotice) || other.shippingNotice == shippingNotice)&&(identical(other.freeShippingThreshold, freeShippingThreshold) || other.freeShippingThreshold == freeShippingThreshold)&&(identical(other.storageMethod, storageMethod) || other.storageMethod == storageMethod)&&(identical(other.distributionNotice, distributionNotice) || other.distributionNotice == distributionNotice)&&(identical(other.handlingPrecaution, handlingPrecaution) || other.handlingPrecaution == handlingPrecaution)&&(identical(other.isTaxable, isTaxable) || other.isTaxable == isTaxable)&&(identical(other.isHaccpCertified, isHaccpCertified) || other.isHaccpCertified == isHaccpCertified)&&(identical(other.isVariableWeight, isVariableWeight) || other.isVariableWeight == isVariableWeight)&&(identical(other.saleStartAt, saleStartAt) || other.saleStartAt == saleStartAt)&&(identical(other.saleEndAt, saleEndAt) || other.saleEndAt == saleEndAt)&&(identical(other.sampleProvisionType, sampleProvisionType) || other.sampleProvisionType == sampleProvisionType)&&(identical(other.samplePrice, samplePrice) || other.samplePrice == samplePrice)&&(identical(other.sampleShippingFee, sampleShippingFee) || other.sampleShippingFee == sampleShippingFee)&&const DeepCollectionEquality().equals(other._galleryImages, _galleryImages)&&const DeepCollectionEquality().equals(other._descriptionImages, _descriptionImages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,description,categoryId,const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(_deliveryMethods),deliveryDays,shippingLeadTime,shippingCutoffTime,isWeekendShipping,const DeepCollectionEquality().hash(_directDeliveryCodes),shippingFee,isRemoteAreaUnavailable,remoteAreaShippingFee,isJejuUnavailable,jejuShippingFee,shippingNotice,freeShippingThreshold,storageMethod,distributionNotice,handlingPrecaution,isTaxable,isHaccpCertified,isVariableWeight,saleStartAt,saleEndAt,sampleProvisionType,samplePrice,sampleShippingFee,const DeepCollectionEquality().hash(_galleryImages),const DeepCollectionEquality().hash(_descriptionImages)]);

@override
String toString() {
  return 'CreateProductModel(name: $name, description: $description, categoryId: $categoryId, options: $options, deliveryMethods: $deliveryMethods, deliveryDays: $deliveryDays, shippingLeadTime: $shippingLeadTime, shippingCutoffTime: $shippingCutoffTime, isWeekendShipping: $isWeekendShipping, directDeliveryCodes: $directDeliveryCodes, shippingFee: $shippingFee, isRemoteAreaUnavailable: $isRemoteAreaUnavailable, remoteAreaShippingFee: $remoteAreaShippingFee, isJejuUnavailable: $isJejuUnavailable, jejuShippingFee: $jejuShippingFee, shippingNotice: $shippingNotice, freeShippingThreshold: $freeShippingThreshold, storageMethod: $storageMethod, distributionNotice: $distributionNotice, handlingPrecaution: $handlingPrecaution, isTaxable: $isTaxable, isHaccpCertified: $isHaccpCertified, isVariableWeight: $isVariableWeight, saleStartAt: $saleStartAt, saleEndAt: $saleEndAt, sampleProvisionType: $sampleProvisionType, samplePrice: $samplePrice, sampleShippingFee: $sampleShippingFee, galleryImages: $galleryImages, descriptionImages: $descriptionImages)';
}


}

/// @nodoc
abstract mixin class _$CreateProductModelCopyWith<$Res> implements $CreateProductModelCopyWith<$Res> {
  factory _$CreateProductModelCopyWith(_CreateProductModel value, $Res Function(_CreateProductModel) _then) = __$CreateProductModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, int categoryId, List<RequestProductOption> options, List<String> deliveryMethods, int deliveryDays, int shippingLeadTime, String? shippingCutoffTime, bool isWeekendShipping,@JsonKey(includeIfNull: false) List<String>? directDeliveryCodes, int shippingFee, bool isRemoteAreaUnavailable, int remoteAreaShippingFee, bool isJejuUnavailable, int jejuShippingFee, String shippingNotice, int freeShippingThreshold, String storageMethod, String distributionNotice, String handlingPrecaution, bool isTaxable, bool isHaccpCertified, bool isVariableWeight, String? saleStartAt, String? saleEndAt, String sampleProvisionType, int samplePrice, int sampleShippingFee,@JsonKey(includeIfNull: false) List<String>? galleryImages,@JsonKey(includeIfNull: false) List<String>? descriptionImages
});




}
/// @nodoc
class __$CreateProductModelCopyWithImpl<$Res>
    implements _$CreateProductModelCopyWith<$Res> {
  __$CreateProductModelCopyWithImpl(this._self, this._then);

  final _CreateProductModel _self;
  final $Res Function(_CreateProductModel) _then;

/// Create a copy of CreateProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? categoryId = null,Object? options = null,Object? deliveryMethods = null,Object? deliveryDays = null,Object? shippingLeadTime = null,Object? shippingCutoffTime = freezed,Object? isWeekendShipping = null,Object? directDeliveryCodes = freezed,Object? shippingFee = null,Object? isRemoteAreaUnavailable = null,Object? remoteAreaShippingFee = null,Object? isJejuUnavailable = null,Object? jejuShippingFee = null,Object? shippingNotice = null,Object? freeShippingThreshold = null,Object? storageMethod = null,Object? distributionNotice = null,Object? handlingPrecaution = null,Object? isTaxable = null,Object? isHaccpCertified = null,Object? isVariableWeight = null,Object? saleStartAt = freezed,Object? saleEndAt = freezed,Object? sampleProvisionType = null,Object? samplePrice = null,Object? sampleShippingFee = null,Object? galleryImages = freezed,Object? descriptionImages = freezed,}) {
  return _then(_CreateProductModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<RequestProductOption>,deliveryMethods: null == deliveryMethods ? _self._deliveryMethods : deliveryMethods // ignore: cast_nullable_to_non_nullable
as List<String>,deliveryDays: null == deliveryDays ? _self.deliveryDays : deliveryDays // ignore: cast_nullable_to_non_nullable
as int,shippingLeadTime: null == shippingLeadTime ? _self.shippingLeadTime : shippingLeadTime // ignore: cast_nullable_to_non_nullable
as int,shippingCutoffTime: freezed == shippingCutoffTime ? _self.shippingCutoffTime : shippingCutoffTime // ignore: cast_nullable_to_non_nullable
as String?,isWeekendShipping: null == isWeekendShipping ? _self.isWeekendShipping : isWeekendShipping // ignore: cast_nullable_to_non_nullable
as bool,directDeliveryCodes: freezed == directDeliveryCodes ? _self._directDeliveryCodes : directDeliveryCodes // ignore: cast_nullable_to_non_nullable
as List<String>?,shippingFee: null == shippingFee ? _self.shippingFee : shippingFee // ignore: cast_nullable_to_non_nullable
as int,isRemoteAreaUnavailable: null == isRemoteAreaUnavailable ? _self.isRemoteAreaUnavailable : isRemoteAreaUnavailable // ignore: cast_nullable_to_non_nullable
as bool,remoteAreaShippingFee: null == remoteAreaShippingFee ? _self.remoteAreaShippingFee : remoteAreaShippingFee // ignore: cast_nullable_to_non_nullable
as int,isJejuUnavailable: null == isJejuUnavailable ? _self.isJejuUnavailable : isJejuUnavailable // ignore: cast_nullable_to_non_nullable
as bool,jejuShippingFee: null == jejuShippingFee ? _self.jejuShippingFee : jejuShippingFee // ignore: cast_nullable_to_non_nullable
as int,shippingNotice: null == shippingNotice ? _self.shippingNotice : shippingNotice // ignore: cast_nullable_to_non_nullable
as String,freeShippingThreshold: null == freeShippingThreshold ? _self.freeShippingThreshold : freeShippingThreshold // ignore: cast_nullable_to_non_nullable
as int,storageMethod: null == storageMethod ? _self.storageMethod : storageMethod // ignore: cast_nullable_to_non_nullable
as String,distributionNotice: null == distributionNotice ? _self.distributionNotice : distributionNotice // ignore: cast_nullable_to_non_nullable
as String,handlingPrecaution: null == handlingPrecaution ? _self.handlingPrecaution : handlingPrecaution // ignore: cast_nullable_to_non_nullable
as String,isTaxable: null == isTaxable ? _self.isTaxable : isTaxable // ignore: cast_nullable_to_non_nullable
as bool,isHaccpCertified: null == isHaccpCertified ? _self.isHaccpCertified : isHaccpCertified // ignore: cast_nullable_to_non_nullable
as bool,isVariableWeight: null == isVariableWeight ? _self.isVariableWeight : isVariableWeight // ignore: cast_nullable_to_non_nullable
as bool,saleStartAt: freezed == saleStartAt ? _self.saleStartAt : saleStartAt // ignore: cast_nullable_to_non_nullable
as String?,saleEndAt: freezed == saleEndAt ? _self.saleEndAt : saleEndAt // ignore: cast_nullable_to_non_nullable
as String?,sampleProvisionType: null == sampleProvisionType ? _self.sampleProvisionType : sampleProvisionType // ignore: cast_nullable_to_non_nullable
as String,samplePrice: null == samplePrice ? _self.samplePrice : samplePrice // ignore: cast_nullable_to_non_nullable
as int,sampleShippingFee: null == sampleShippingFee ? _self.sampleShippingFee : sampleShippingFee // ignore: cast_nullable_to_non_nullable
as int,galleryImages: freezed == galleryImages ? _self._galleryImages : galleryImages // ignore: cast_nullable_to_non_nullable
as List<String>?,descriptionImages: freezed == descriptionImages ? _self._descriptionImages : descriptionImages // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
