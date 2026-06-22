// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateProductModel _$CreateProductModelFromJson(
  Map<String, dynamic> json,
) => _CreateProductModel(
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  categoryId: (json['categoryId'] as num?)?.toInt() ?? 0,
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
  deliveryDays: (json['deliveryDays'] as num?)?.toInt() ?? 0,
  shippingLeadTime: (json['shippingLeadTime'] as num?)?.toInt() ?? 0,
  shippingCutoffTime: json['shippingCutoffTime'] as String? ?? null,
  isWeekendShipping: json['isWeekendShipping'] as bool? ?? false,
  directDeliveryCodes: (json['directDeliveryCodes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  shippingFee: (json['shippingFee'] as num?)?.toInt() ?? 0,
  isRemoteAreaUnavailable: json['isRemoteAreaUnavailable'] as bool? ?? false,
  remoteAreaShippingFee: (json['remoteAreaShippingFee'] as num?)?.toInt() ?? 0,
  isJejuUnavailable: json['isJejuUnavailable'] as bool? ?? false,
  jejuShippingFee: (json['jejuShippingFee'] as num?)?.toInt() ?? 0,
  shippingNotice: json['shippingNotice'] as String? ?? '',
  freeShippingThreshold: (json['freeShippingThreshold'] as num?)?.toInt() ?? 0,
  storageMethod: json['storageMethod'] as String? ?? '',
  distributionNotice: json['distributionNotice'] as String? ?? '',
  handlingPrecaution: json['handlingPrecaution'] as String? ?? '',
  isTaxable: json['isTaxable'] as bool? ?? false,
  isHaccpCertified: json['isHaccpCertified'] as bool? ?? false,
  isVariableWeight: json['isVariableWeight'] as bool? ?? false,
  saleStartAt: json['saleStartAt'] as String?,
  saleEndAt: json['saleEndAt'] as String?,
  sampleProvisionType: json['sampleProvisionType'] as String? ?? '',
  samplePrice: (json['samplePrice'] as num?)?.toInt() ?? 0,
  sampleShippingFee: (json['sampleShippingFee'] as num?)?.toInt() ?? 0,
  galleryImages: (json['galleryImages'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  descriptionImages: (json['descriptionImages'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CreateProductModelToJson(_CreateProductModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'options': instance.options,
      'deliveryMethods': instance.deliveryMethods,
      'deliveryDays': instance.deliveryDays,
      'shippingLeadTime': instance.shippingLeadTime,
      'shippingCutoffTime': instance.shippingCutoffTime,
      'isWeekendShipping': instance.isWeekendShipping,
      'directDeliveryCodes': ?instance.directDeliveryCodes,
      'shippingFee': instance.shippingFee,
      'isRemoteAreaUnavailable': instance.isRemoteAreaUnavailable,
      'remoteAreaShippingFee': instance.remoteAreaShippingFee,
      'isJejuUnavailable': instance.isJejuUnavailable,
      'jejuShippingFee': instance.jejuShippingFee,
      'shippingNotice': instance.shippingNotice,
      'freeShippingThreshold': instance.freeShippingThreshold,
      'storageMethod': instance.storageMethod,
      'distributionNotice': instance.distributionNotice,
      'handlingPrecaution': instance.handlingPrecaution,
      'isTaxable': instance.isTaxable,
      'isHaccpCertified': instance.isHaccpCertified,
      'isVariableWeight': instance.isVariableWeight,
      'saleStartAt': instance.saleStartAt,
      'saleEndAt': instance.saleEndAt,
      'sampleProvisionType': instance.sampleProvisionType,
      'samplePrice': instance.samplePrice,
      'sampleShippingFee': instance.sampleShippingFee,
      'galleryImages': ?instance.galleryImages,
      'descriptionImages': ?instance.descriptionImages,
    };
