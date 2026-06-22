// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyProductModel _$MyProductModelFromJson(Map<String, dynamic> json) =>
    _MyProductModel(
      id: (json['id'] as num).toInt(),
      productCode: json['productCode'] as String? ?? '',
      name: json['name'] as String? ?? '',
      categoryFullPath: json['categoryFullPath'] as String? ?? '',
      status: ProductStatusX.from(json['status'] as String),
      approvalStatus: json['approvalStatus'] == null
          ? ProductApprovalStatus.pending
          : ProductApprovalStatusX.from(json['approvalStatus'] as String?),
      thumbnailImageUrl: json['thumbnailImageUrl'] as String? ?? '',
      lowestSellingPrice: (json['lowestSellingPrice'] as num?)?.toInt() ?? 0,
      stockQuantity: (json['lowestPriceStockQuantity'] as num?)?.toInt() ?? 0,
      updatedAt: _fromJsonDate(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MyProductModelToJson(
  _MyProductModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'productCode': instance.productCode,
  'name': instance.name,
  'categoryFullPath': instance.categoryFullPath,
  'status': _$ProductStatusEnumMap[instance.status]!,
  'approvalStatus': _$ProductApprovalStatusEnumMap[instance.approvalStatus]!,
  'thumbnailImageUrl': instance.thumbnailImageUrl,
  'lowestSellingPrice': instance.lowestSellingPrice,
  'lowestPriceStockQuantity': instance.stockQuantity,
  'updatedAt': _toJsonDate(instance.updatedAt),
};

const _$ProductStatusEnumMap = {
  ProductStatus.active: 'active',
  ProductStatus.inactive: 'inactive',
};

const _$ProductApprovalStatusEnumMap = {
  ProductApprovalStatus.pending: 'pending',
  ProductApprovalStatus.approved: 'approved',
  ProductApprovalStatus.rejected: 'rejected',
};
