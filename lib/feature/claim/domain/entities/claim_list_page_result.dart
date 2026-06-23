import 'package:moding_seller_web/feature/claim/domain/entities/claim_model.dart';

class ClaimListPageResult {
  const ClaimListPageResult({
    required this.items,
    required this.page,
    required this.size,
    required this.totalPages,
    required this.totalElements,
  });

  final List<ClaimModel> items;
  final int page;
  final int size;
  final int totalPages;
  final int totalElements;

  bool get hasMore => page + 1 < totalPages;
}
