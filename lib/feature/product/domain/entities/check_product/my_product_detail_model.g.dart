// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyProductDetailModel _$MyProductDetailModelFromJson(
  Map<String, dynamic> json,
) => _MyProductDetailModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  parentCategoryId: (json['parentCategoryId'] as num?)?.toInt() ?? 0,
  categoryId: (json['categoryId'] as num?)?.toInt() ?? 0,
  thumbnailImageUrl: json['thumbnailImageUrl'] as String? ?? '',
  foodLabelImageUrl: json['foodLabelImageUrl'] as String? ?? '',
  galleryImages: json['galleryImageUrls'] == null
      ? const <String>[]
      : _imageUrlsFromJson(json['galleryImageUrls']),
  descriptionImages: json['descriptionImageUrls'] == null
      ? const <String>[]
      : _imageUrlsFromJson(json['descriptionImageUrls']),
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => RequestProductOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <RequestProductOption>[],
  deliveryMethods:
      (json['deliveryMethods'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  deliveryDays: json['deliveryDays'] == null
      ? 0
      : _intFromJson(json['deliveryDays']),
  isSameDayShipping: json['isSameDayShipping'] as bool? ?? false,
  shippingLeadTime: json['shippingLeadTime'] == null
      ? 0
      : _intFromJson(json['shippingLeadTime']),
  shippingCutoffTime: _nullableStringFromJson(json['shippingCutoffTime']),
  isWeekendShipping: json['isWeekendShipping'] as bool? ?? false,
  directDeliveryDistricts: json['directDeliveryDistricts'] == null
      ? const <DirectDeliveryDistrict>[]
      : _directDeliveryDistrictsFromJson(json['directDeliveryDistricts']),
  isVariableWeight: json['isVariableWeight'] as bool? ?? false,
  shippingFee: json['shippingFee'] == null
      ? 0
      : _intFromJson(json['shippingFee']),
  isRemoteAreaUnavailable: json['isRemoteAreaUnavailable'] as bool? ?? false,
  remoteAreaShippingFee: json['remoteAreaShippingFee'] == null
      ? 0
      : _intFromJson(json['remoteAreaShippingFee']),
  isJejuUnavailable: json['isJejuUnavailable'] as bool? ?? false,
  jejuShippingFee: json['jejuShippingFee'] == null
      ? 0
      : _intFromJson(json['jejuShippingFee']),
  freeShippingThreshold: json['freeShippingThreshold'] == null
      ? 0
      : _intFromJson(json['freeShippingThreshold']),
  shippingNotice: json['shippingNotice'] == null
      ? ''
      : _stringFromJson(json['shippingNotice']),
  storageMethod: json['storageMethod'] == null
      ? ''
      : _stringFromJson(json['storageMethod']),
  distributionNotice: json['distributionNotice'] == null
      ? ''
      : _stringFromJson(json['distributionNotice']),
  handlingPrecaution: json['handlingPrecaution'] == null
      ? ''
      : _stringFromJson(json['handlingPrecaution']),
  isTaxable: json['isTaxable'] as bool? ?? false,
  isHaccpCertified: json['isHaccpCertified'] as bool? ?? false,
  saleStartAt: _nullableStringFromJson(json['saleStartAt']),
  saleEndAt: _nullableStringFromJson(json['saleEndAt']),
);

Map<String, dynamic> _$MyProductDetailModelToJson(
  _MyProductDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'parentCategoryId': instance.parentCategoryId,
  'categoryId': instance.categoryId,
  'thumbnailImageUrl': instance.thumbnailImageUrl,
  'foodLabelImageUrl': instance.foodLabelImageUrl,
  'galleryImageUrls': instance.galleryImages,
  'descriptionImageUrls': instance.descriptionImages,
  'options': instance.options,
  'deliveryMethods': instance.deliveryMethods,
  'deliveryDays': instance.deliveryDays,
  'isSameDayShipping': instance.isSameDayShipping,
  'shippingLeadTime': instance.shippingLeadTime,
  'shippingCutoffTime': instance.shippingCutoffTime,
  'isWeekendShipping': instance.isWeekendShipping,
  'directDeliveryDistricts': _directDeliveryDistrictsToJson(
    instance.directDeliveryDistricts,
  ),
  'isVariableWeight': instance.isVariableWeight,
  'shippingFee': instance.shippingFee,
  'isRemoteAreaUnavailable': instance.isRemoteAreaUnavailable,
  'remoteAreaShippingFee': instance.remoteAreaShippingFee,
  'isJejuUnavailable': instance.isJejuUnavailable,
  'jejuShippingFee': instance.jejuShippingFee,
  'freeShippingThreshold': instance.freeShippingThreshold,
  'shippingNotice': instance.shippingNotice,
  'storageMethod': instance.storageMethod,
  'distributionNotice': instance.distributionNotice,
  'handlingPrecaution': instance.handlingPrecaution,
  'isTaxable': instance.isTaxable,
  'isHaccpCertified': instance.isHaccpCertified,
  'saleStartAt': instance.saleStartAt,
  'saleEndAt': instance.saleEndAt,
};
