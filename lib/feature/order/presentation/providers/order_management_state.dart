import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moding_president_web/feature/order/domain/entities/order_summary_model.dart';

import '../../domain/entities/order_model.dart';
import '../../domain/enums/order_status_enum.dart';

part 'order_management_state.freezed.dart';

@freezed
abstract class OrderManagementState with _$OrderManagementState {
  const OrderManagementState._();

  const factory OrderManagementState({
    required bool isMainLoading,
    required bool isLoading,
    required bool isLoadingMore,
    required bool hasMore,
    required int pageNum,

    required OrderSummaryModel? summary,
    required OrderStatus? selectedStatus,
    required List<OrderModel> orderList,

    /// 검색 시작일 / 종료일
    required String saleStartDate,
    required String saleEndDate,
  }) = _OrderManagementState;

  factory OrderManagementState.initial() => OrderManagementState(
    isMainLoading: true,
    isLoading: false,
    isLoadingMore: false,
    hasMore: true,
    pageNum: 0,
    summary: null,
    selectedStatus: null,
    orderList: [],
    saleStartDate: '',
    saleEndDate: '',
  );
}
