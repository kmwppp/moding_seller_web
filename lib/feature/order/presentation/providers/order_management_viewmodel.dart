import 'package:moding_seller_web/feature/order/data/repositories/order_repository_impl.dart';
import 'package:moding_seller_web/feature/order/presentation/providers/order_management_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/entities/response_model.dart';
import '../../../../core/presentation/widgets/new_order_check.dart';
import '../../domain/enums/order_status_enum.dart';

part 'order_management_viewmodel.g.dart';

@Riverpod()
class OrderManagementViewModel extends _$OrderManagementViewModel {
  @override
  OrderManagementState build() {
    Future.microtask(_init);
    return OrderManagementState.initial();
  }

  Future<void> _init() async {
    await getMyOrderList(isReset: true);
    await getOrderSummary();
    state = state.copyWith(isMainLoading: false);
  }

  Future<void> loadMore() async {
    if (state.isLoading || state.isLoadingMore || !state.hasMore) {
      return;
    }

    await getMyOrderList(isReset: false);
  }

  Future<void> resetToStatus(OrderStatus status) async {
    state = state.copyWith(selectedStatus: status);
    await Future.wait([getMyOrderList(isReset: true), getOrderSummary()]);
    state = state.copyWith(isMainLoading: false);
  }

  void selectStatus(OrderStatus? status) {
    state = state.copyWith(
      isLoading: true,
      isLoadingMore: false,
      hasMore: true,
      pageNum: 0,
      selectedStatus: status,
      saleStartDate: '',
      saleEndDate: '',
    );
    getMyOrderList(isReset: true);
  }

  Future<void> getOrderSummary() async {
    try {
      final repository = ref.read(orderRepositoryProvider);
      final response = await repository.getMyOrderSummary();

      state = state.copyWith(summary: response);
    } catch (e) {
      print(e);
    }
  }

  List<OrderStatus> _getArrayStatus(OrderStatus? status) {
    // 1. null이면 즉시 빈 배열 반환
    if (status == null) return [];

    switch (status) {
      case OrderStatus.DELIVERED:
        return [OrderStatus.DELIVERED, OrderStatus.PURCHASE_CONFIRMED];
      default:
        // 그 외의 경우 단일 요소를 가진 리스트 반환
        return [status];
    }
  }

  Future<void> getMyOrderList({required bool isReset}) async {
    if (!isReset &&
        (state.isLoading || state.isLoadingMore || !state.hasMore)) {
      return;
    }

    state = state.copyWith(isLoading: isReset, isLoadingMore: !isReset);

    try {
      final repository = ref.read(orderRepositoryProvider);

      final result = await repository.getMyOrderList(
        _getArrayStatus(state.selectedStatus),
        state.saleStartDate,
        state.saleEndDate,
        isReset ? 0 : state.pageNum + 1,
      );

      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        pageNum: result.page,
        hasMore: result.hasMore,
        orderList: isReset
            ? result.items
            : [...state.orderList, ...result.items],
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, isLoadingMore: false);
    }
  }

  /// 검색 시작일 선택 시 로직
  void updateSaleStartDate(DateTime? date) {
    if (date == null) {
      state = state.copyWith(saleStartDate: '');
      return;
    }

    final iso = '${date.toIso8601String().split('.').first}Z';

    state = state.copyWith(saleStartDate: iso);

    if (state.saleStartDate.isNotEmpty && state.saleEndDate.isNotEmpty) {
      state = state.copyWith(pageNum: 0, hasMore: true, isLoading: true);
      getMyOrderList(isReset: true);
    }
  }

  /// 검색 종료일 선택 시 로직
  void updateSaleEndDate(DateTime? date) {
    if (date == null) {
      state = state.copyWith(saleEndDate: '');
      return;
    }

    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    final iso = '${endOfDay.toIso8601String().split('.').first}Z';

    state = state.copyWith(saleEndDate: iso);

    if (state.saleStartDate.isNotEmpty && state.saleEndDate.isNotEmpty) {
      state = state.copyWith(pageNum: 0, hasMore: true, isLoading: true);
      getMyOrderList(isReset: true);
    }
  }

  Future<ResponseModel> patchOrderConfirm(int orderId) async {
    try {
      final repository = ref.read(orderRepositoryProvider);
      final response = await repository.patchOrderConfirm(orderId);

      if (response.success) {
        setButtonClickedAndList();
        getOrderSummary();
      }
      return response;
    } catch (e) {
      return ResponseModel(success: false, message: "오류가 발생하였습니다.");
    }
  }

  Future<ResponseModel> patchOrderReject(
    int orderId,
    RejectModel rejectModel,
  ) async {
    try {
      final repository = ref.read(orderRepositoryProvider);
      final response = await repository.patchOrderReject(orderId, rejectModel);

      if (response.success) {
        setButtonClickedAndList();
        getOrderSummary();
      }

      return response;
    } catch (e) {
      return ResponseModel(success: false, message: "오류가 발생하였습니다.");
    }
  }

  void setButtonClickedAndList() async {
    final prevPage = state.pageNum;

    // pageNum 초기화
    state = state.copyWith(pageNum: 0, hasMore: true);

    // 첫 호출 (리스트 리셋)
    await getMyOrderList(isReset: true);

    // 이전 pageNum 만큼 다시 호출
    for (int i = 0; i < prevPage && state.hasMore; i++) {
      await getMyOrderList(isReset: false);
    }
  }
}
