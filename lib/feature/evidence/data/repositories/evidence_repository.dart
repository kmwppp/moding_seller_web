import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/feature/evidence/data/data_sources/evidence_data_source.dart';
import 'package:moding_president_web/feature/evidence/domain/entities/tax_invoice_page_result.dart';
import 'package:moding_president_web/feature/evidence/domain/entities/tax_summary_dto.dart';

final evidenceRepositoryProvider = Provider<EvidenceRepository>((ref) {
  return EvidenceRepository(ref.watch(evidenceDataSourceProvider));
});

class EvidenceRepository {
  EvidenceRepository(this._dataSource);

  final EvidenceDataSource _dataSource;

  Future<TaxInvoicePageResult> getTaxInvoices({
    List<String>? types,
    String? fromDate,
    String? toDate,
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dataSource.getTaxInvoices(
      types: types,
      fromDate: fromDate,
      toDate: toDate,
      page: page,
      size: size,
    );
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );

    return TaxInvoicePageResult.fromJson(data);
  }

  Future<String?> getOrderTaxInvoiceUrl(int orderId) async {
    final response = await _dataSource.getOrderTaxInvoice(orderId);
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );
    return data['url']?.toString();
  }

  Future<TaxSummaryDto> getTaxSummary() async {
    final response = await _dataSource.getTaxSummary();
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );
    return TaxSummaryDto.fromJson(data);
  }
}
