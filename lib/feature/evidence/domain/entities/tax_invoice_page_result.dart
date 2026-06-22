import 'package:freezed_annotation/freezed_annotation.dart';

import 'tax_invoice_item.dart';

part 'tax_invoice_page_result.freezed.dart';
part 'tax_invoice_page_result.g.dart';

@freezed
abstract class TaxInvoicePageResult with _$TaxInvoicePageResult {
  const TaxInvoicePageResult._();

  const factory TaxInvoicePageResult({
    @Default([]) List<TaxInvoiceItem> content,
    @Default(0) int number,
    @Default(20) int size,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
  }) = _TaxInvoicePageResult;

  bool get hasMore => number + 1 < totalPages;

  factory TaxInvoicePageResult.fromJson(Map<String, dynamic> json) =>
      _$TaxInvoicePageResultFromJson(json);
}
