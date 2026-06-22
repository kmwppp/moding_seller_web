// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_invoice_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaxInvoiceItem _$TaxInvoiceItemFromJson(Map<String, dynamic> json) =>
    _TaxInvoiceItem(
      id: (json['id'] as num?)?.toInt(),
      settlementId: (json['settlementId'] as num?)?.toInt(),
      orderId: (json['orderId'] as num?)?.toInt(),
      settlementCode: json['settlementCode'] as String?,
      invoiceType: json['invoiceType'] as String?,
      supplierName: json['supplierName'] as String?,
      receiverName: json['receiverName'] as String?,
      supplyAmount: json['supplyAmount'] as num?,
      taxAmount: json['taxAmount'] as num?,
      totalAmount: json['totalAmount'] as num?,
      status: json['status'] as String?,
      issuedAt: json['issuedAt'] == null
          ? null
          : DateTime.parse(json['issuedAt'] as String),
      externalInvoiceId: json['externalInvoiceId'] as String?,
    );

Map<String, dynamic> _$TaxInvoiceItemToJson(_TaxInvoiceItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'settlementId': instance.settlementId,
      'orderId': instance.orderId,
      'settlementCode': instance.settlementCode,
      'invoiceType': instance.invoiceType,
      'supplierName': instance.supplierName,
      'receiverName': instance.receiverName,
      'supplyAmount': instance.supplyAmount,
      'taxAmount': instance.taxAmount,
      'totalAmount': instance.totalAmount,
      'status': instance.status,
      'issuedAt': instance.issuedAt?.toIso8601String(),
      'externalInvoiceId': instance.externalInvoiceId,
    };
