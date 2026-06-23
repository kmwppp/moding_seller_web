import 'package:moding_seller_web/feature/product/domain/entities/check_product/my_product_model.dart';

class ProductListPageResult {
  const ProductListPageResult({
    required this.items,
    required this.page,
    required this.size,
    required this.totalPages,
    required this.totalElements,
  });

  final List<MyProductModel> items;
  final int page;
  final int size;
  final int totalPages;
  final int totalElements;

  bool get hasMore => page + 1 < totalPages;
}
