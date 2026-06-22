import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_http_urls.dart';
import '../../../../core/network/dio_client.dart';

part 'settlement_data_source.g.dart';

@riverpod
SettlementDataSource settlementDataSource(Ref ref) {
  return SettlementDataSource(ref.watch(dioProvider));
}

class SettlementDataSource {
  final Dio _dio;

  SettlementDataSource(this._dio);

  Future<Map<String, dynamic>> getMySettlementSummary() async {
    final response = await _dio.get(AppHttpUrls.getMySettlementSummary);
    return response.data;
  }

  Future<Map<String, dynamic>> getMySettlementList(
    List<String> statuses,
    String? fromDate,
    String? toDate, {
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dio.get(
      AppHttpUrls.getMySettlementList(
        statuses,
        fromDate,
        toDate,
        page: page,
        size: size,
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getMySettlementDetail(int settlementId) async {
    final response = await _dio.get(
      AppHttpUrls.getMySettlementDetail(settlementId),
    );
    return response.data;
  }
}
