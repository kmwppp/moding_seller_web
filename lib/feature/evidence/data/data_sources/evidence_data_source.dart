import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/constants/app_http_urls.dart';
import 'package:moding_president_web/core/network/dio_client.dart';

final evidenceDataSourceProvider = Provider<EvidenceDataSource>((ref) {
  return EvidenceDataSource(ref.watch(dioProvider));
});

class EvidenceDataSource {
  EvidenceDataSource(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> getTaxInvoices({
    List<String>? types,
    String? fromDate,
    String? toDate,
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dio.get(
      AppHttpUrls.getSellerTaxInvoices(
        types: types,
        fromDate: fromDate,
        toDate: toDate,
        page: page,
        size: size,
      ),
    );

    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> getOrderTaxInvoice(int orderId) async {
    final response = await _dio.get(AppHttpUrls.getOrderTaxInvoice(orderId));
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> getTaxSummary() async {
    final response = await _dio.get(AppHttpUrls.getSellerTaxInvoicesSummary);
    return Map<String, dynamic>.from(response.data as Map);
  }
}
