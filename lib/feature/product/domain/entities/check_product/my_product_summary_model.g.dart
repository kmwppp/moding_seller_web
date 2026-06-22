// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_product_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyProductSummaryModel _$MyProductSummaryModelFromJson(
  Map<String, dynamic> json,
) => _MyProductSummaryModel(
  total: (json['total'] as num).toInt(),
  active: (json['active'] as num).toInt(),
  inactive: (json['inactive'] as num).toInt(),
);

Map<String, dynamic> _$MyProductSummaryModelToJson(
  _MyProductSummaryModel instance,
) => <String, dynamic>{
  'total': instance.total,
  'active': instance.active,
  'inactive': instance.inactive,
};
