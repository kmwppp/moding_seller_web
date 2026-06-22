import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moding_president_web/feature/product/domain/entities/check_product/my_product_model.dart';
import 'package:moding_president_web/feature/product/domain/entities/check_product/my_product_summary_model.dart';

part 'product_management_state.freezed.dart';

@freezed
abstract class ProductManagementState with _$ProductManagementState {
  const ProductManagementState._();

  const factory ProductManagementState({
    required MyProductSummaryModel? summary,
    required String selectedStatus,
    required String searchWord,
    required bool isMainLoading,
    required bool isLoading,
    required bool isLoadingMore,
    required bool hasMore,
    required int page,
    required List<MyProductModel> productList,
    required List<MyProductModel> filteredProductList,
  }) = _ProductManagementState;

  factory ProductManagementState.initial() => ProductManagementState(
    summary: null,
    selectedStatus: '전체',
    searchWord: '',
    isMainLoading: true,
    isLoading: false,
    isLoadingMore: false,
    hasMore: true,
    page: 0,
    productList: [],
    filteredProductList: [],
  );
}
