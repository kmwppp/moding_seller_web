// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaxSummaryDto _$TaxSummaryDtoFromJson(Map<String, dynamic> json) =>
    _TaxSummaryDto(
      total: (json['total'] as num?)?.toInt() ?? 0,
      sellerToBuyerCount: (json['sellerToBuyerCount'] as num?)?.toInt() ?? 0,
      modingToSellerCount: (json['modingToSellerCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TaxSummaryDtoToJson(_TaxSummaryDto instance) =>
    <String, dynamic>{
      'total': instance.total,
      'sellerToBuyerCount': instance.sellerToBuyerCount,
      'modingToSellerCount': instance.modingToSellerCount,
    };
