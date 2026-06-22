import 'dart:async';

import 'package:dio/dio.dart';
import 'package:moding_president_web/core/network/entities/response_model.dart';
import 'package:moding_president_web/feature/product/presentation/providers/product_management/product_management_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/product_repository_impl.dart';
import '../../../domain/entities/check_product/my_product_model.dart';
import '../../../domain/entities/enum/product_management_enum.dart';
import '../../screens/sections/quick_look_section.dart';

part 'product_management_viewmodel.g.dart';

@Riverpod()
class ProductManagementViewModel extends _$ProductManagementViewModel {
  Timer? _debounce;
  List<MyProductModel> _originList = [];

  @override
  ProductManagementState build() {
    _init();
    return ProductManagementState.initial();
  }

  void _init() async {
    await getProductSummary();
    await getMyProductList(_currentApiStatus(), isReset: true);
    state = state.copyWith(isLoading: false);
  }

  void setProductList(List<MyProductModel> list) {
    _originList = list;
    _applySearch(state.searchWord);
  }

  void changeSearchWord(String word) {
    state = state.copyWith(searchWord: word);

    // 기존 debounce 취소
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    // 새 debounce 실행
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _applySearch(word);
    });
  }

  void _applySearch(String word) {
    if (word.isEmpty) {
      state = state.copyWith(
        productList: _originList,
        filteredProductList: _originList,
      );
      return;
    }

    final filtered = _originList.where((product) {
      return product.name.toLowerCase().contains(word.toLowerCase());
    }).toList();

    state = state.copyWith(
      productList: filtered,
      filteredProductList: filtered,
    );
  }

  Future<ResponseModel> selectProductStatus({
    required int index,
    required String productId,
    required ProductStatus status,
  }) async {
    try {
      final repository = ref.read(productRepositoryProvider);

      final response = await repository.patchMyProductStatus(
        productId: productId,
        status: status, // ✅ 받은 값 그대로 서버로 전달
      );

      // ❗ 실패하면 바로 반환
      if (!response.success) {
        return response;
      }

      // ✅ 성공일 때만 상태 변경
      final targetId = state.productList[index].id;
      _originList = _originList
          .map(
            (item) =>
                item.id == targetId ? item.copyWith(status: status) : item,
          )
          .toList();
      _applySearch(state.searchWord);
      getProductSummary();

      return response;
    } on DioException catch (e) {
      final errorMessage = e.response?.data?['message'] ?? "에러가 발생하였습니다.";

      return ResponseModel(success: false, message: errorMessage);
    } catch (e) {
      return const ResponseModel(success: false, message: "알 수 없는 에러가 발생했습니다.");
    }
  }

  /// 선택 상태 변경
  Future<void> selectSearchStatus(String status) async {
    state = state.copyWith(
      selectedStatus: status,
      page: 0,
      hasMore: true,
      searchWord: '',
    );
    // 전체 조회
    if (status == ProductManagementStatus.all.label) {
      await getMyProductList('', isReset: true);
    } else {
      // 판매중 / 판매중지 조회
      await getMyProductList(
        status == ProductManagementStatus.selling.label
            ? ProductStatus.active.label
            : ProductStatus.inactive.label,
        isReset: true,
      );
    }
  }

  /// 메인 리스트 API
  Future<void> getMyProductList(String status, {required bool isReset}) async {
    if (!isReset &&
        (state.isLoading || state.isLoadingMore || !state.hasMore)) {
      return;
    }

    state = state.copyWith(isLoading: isReset, isLoadingMore: !isReset);
    try {
      final repository = ref.read(productRepositoryProvider);
      final result = await repository.getMyProductList(
        status,
        page: isReset ? 0 : state.page + 1,
      );
      final mergedList = isReset
          ? result.items
          : [..._originList, ...result.items];

      _originList = mergedList;
      state = state.copyWith(
        isMainLoading: false,
        isLoading: false,
        isLoadingMore: false,
        page: result.page,
        hasMore: result.hasMore,
      );
      setProductList(mergedList);
    } catch (e) {
      state = state.copyWith(isLoading: false, isLoadingMore: false);
    }
  }

  Future<void> loadMore() async {
    await getMyProductList(_currentApiStatus(), isReset: false);
  }

  String _currentApiStatus() {
    if (state.selectedStatus == ProductManagementStatus.selling.label) {
      return ProductStatus.active.label;
    }

    if (state.selectedStatus == ProductManagementStatus.stopped.label) {
      return ProductStatus.inactive.label;
    }

    return '';
  }

  Future<void> getProductSummary() async {
    try {
      final repository = ref.read(productRepositoryProvider);
      final response = await repository.getMyProductSummary();

      state = state.copyWith(summary: response);
    } catch (_) {}
  }
}
