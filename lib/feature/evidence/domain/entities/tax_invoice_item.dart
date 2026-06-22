import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_invoice_item.freezed.dart';
part 'tax_invoice_item.g.dart';

@freezed
abstract class TaxInvoiceItem with _$TaxInvoiceItem {
  const factory TaxInvoiceItem({
    int? id,
    int? settlementId,
    int? orderId,
    String? settlementCode,
    String? invoiceType,
    String? supplierName,
    String? receiverName,
    num? supplyAmount,
    num? taxAmount,
    num? totalAmount,
    String? status,
    DateTime? issuedAt,
    String? externalInvoiceId,
  }) = _TaxInvoiceItem;

  factory TaxInvoiceItem.fromJson(Map<String, dynamic> json) =>
      _$TaxInvoiceItemFromJson(json);
}
