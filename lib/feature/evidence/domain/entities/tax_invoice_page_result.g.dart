// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_invoice_page_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaxInvoicePageResult _$TaxInvoicePageResultFromJson(
  Map<String, dynamic> json,
) => _TaxInvoicePageResult(
  content:
      (json['content'] as List<dynamic>?)
          ?.map((e) => TaxInvoiceItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  number: (json['number'] as num?)?.toInt() ?? 0,
  size: (json['size'] as num?)?.toInt() ?? 20,
  totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TaxInvoicePageResultToJson(
  _TaxInvoicePageResult instance,
) => <String, dynamic>{
  'content': instance.content,
  'number': instance.number,
  'size': instance.size,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
};
