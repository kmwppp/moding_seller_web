import 'package:moding_seller_web/feature/settlement/domain/entities/settlement_model.dart';

class SettlementListPageResult {
  const SettlementListPageResult({
    required this.items,
    required this.page,
    required this.size,
    required this.totalPages,
    required this.totalElements,
  });

  final List<SettlementModel> items;
  final int page;
  final int size;
  final int totalPages;
  final int totalElements;

  bool get hasMore => page + 1 < totalPages;
}
