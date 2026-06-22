import 'package:moding_president_web/feature/settlement/domain/entities/settlement_detail_model.dart';
import 'package:moding_president_web/feature/settlement/domain/entities/settlement_list_page_result.dart';
import 'package:moding_president_web/feature/settlement/domain/entities/settlement_summary_model.dart';

abstract class SettlementRepository {
  Future<SettlementSummaryModel> getMySettlementSummary();

  Future<SettlementListPageResult> getMySettlementList(
    List<String> statuses,
    String? fromDate,
    String? toDate, {
    int page = 0,
    int size = 20,
  });

  Future<SettlementDetailModel> getMySettlementDetail(int settlementId);
}
