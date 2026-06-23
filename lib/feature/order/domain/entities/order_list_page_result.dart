import 'package:moding_seller_web/feature/order/domain/entities/order_model.dart';

class OrderListPageResult {
  const OrderListPageResult({
    required this.items,
    required this.page,
    required this.size,
    required this.totalPages,
    required this.totalElements,
  });

  final List<OrderModel> items;
  final int page;
  final int size;
  final int totalPages;
  final int totalElements;

  bool get hasMore => page + 1 < totalPages;
}
