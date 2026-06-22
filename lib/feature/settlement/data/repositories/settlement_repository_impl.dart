import 'package:moding_president_web/feature/settlement/domain/entities/settlement_detail_model.dart';
import 'package:moding_president_web/feature/settlement/domain/entities/settlement_list_page_result.dart';
import 'package:moding_president_web/feature/settlement/domain/entities/settlement_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/settlement_summary_model.dart';
import '../../domain/repositories/settlement_repository.dart';
import '../data_source/settlement_data_source.dart';

part 'settlement_repository_impl.g.dart';

@riverpod
SettlementRepository settlementRepository(Ref ref) {
  final dataSource = ref.watch(settlementDataSourceProvider);
  return SettlementRepositoryImpl(dataSource);
}

class SettlementRepositoryImpl implements SettlementRepository {
  final SettlementDataSource _dataSource;

  SettlementRepositoryImpl(this._dataSource);

  @override
  Future<SettlementSummaryModel> getMySettlementSummary() async {
    final response = await _dataSource.getMySettlementSummary();
    final data = response['data'];
    return SettlementSummaryModel.fromJson(data);
  }

  /// ----------------------------------------
  /// 내 정산 목록 조회
  /// ----------------------------------------
  @override
  Future<SettlementListPageResult> getMySettlementList(
    List<String> statuses,
    String? fromDate,
    String? toDate, {
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dataSource.getMySettlementList(
      statuses,
      fromDate,
      toDate,
      page: page,
      size: size,
    );
    final data = Map<String, dynamic>.from(response['data'] as Map);
    final content = (data['content'] as List?) ?? const [];
    final settlementList = content.map((item) {
      return SettlementModel.fromJson(item);
    }).toList();

    return SettlementListPageResult(
      items: settlementList,
      page: (data['number'] as num?)?.toInt() ?? page,
      size: (data['size'] as num?)?.toInt() ?? size,
      totalPages: (data['totalPages'] as num?)?.toInt() ?? 0,
      totalElements:
          (data['totalElements'] as num?)?.toInt() ?? settlementList.length,
    );
  }

  @override
  Future<SettlementDetailModel> getMySettlementDetail(int settlementId) async {
    final response = await _dataSource.getMySettlementDetail(settlementId);
    final data = response['data'];
    return SettlementDetailModel.fromJson(data);
  }
}
