import 'package:moding_seller_web/feature/order/data/data_source/order_data_source.dart';
import 'package:moding_seller_web/feature/order/domain/entities/order_list_page_result.dart';
import 'package:moding_seller_web/feature/order/domain/entities/order_model.dart';
import 'package:moding_seller_web/feature/order/domain/entities/order_summary_model.dart';
import 'package:moding_seller_web/feature/order/domain/enums/order_status_enum.dart';
import 'package:moding_seller_web/feature/order/domain/repositories/order_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/entities/response_model.dart';
import '../../../../core/presentation/widgets/new_order_check.dart';

part 'order_repository_impl.g.dart';

@riverpod
OrderRepository orderRepository(Ref ref) {
  final dataSource = ref.watch(orderDataSourceProvider);
  return OrderRepositoryImpl(dataSource);
}

class OrderRepositoryImpl implements OrderRepository {
  final OrderDataSource _dataSource;

  OrderRepositoryImpl(this._dataSource);

  /// ----------------------------------------
  /// 내 수신 주문 목록 조회
  /// ----------------------------------------
  @override
  Future<OrderListPageResult> getMyOrderList(
    List<OrderStatus>? status,
    String startDate,
    String endDate,
    int page, {
    int size = 20,
  }) async {
    final response = await _dataSource.getMyOrderList(
      status,
      startDate,
      endDate,
      page,
      size: size,
    );
    final data = Map<String, dynamic>.from(response['data'] as Map);
    final content = (data['content'] as List?) ?? const [];
    final orderList = content.map((item) {
      return OrderModel.fromJson(item);
    }).toList();

    return OrderListPageResult(
      items: orderList,
      page: (data['number'] as num?)?.toInt() ?? page,
      size: (data['size'] as num?)?.toInt() ?? size,
      totalPages: (data['totalPages'] as num?)?.toInt() ?? 0,
      totalElements:
          (data['totalElements'] as num?)?.toInt() ?? orderList.length,
    );
  }

  @override
  Future<OrderSummaryModel> getMyOrderSummary() async {
    final response = await _dataSource.getMyOrderSummary();
    final data = response['data'];
    return OrderSummaryModel.fromJson(data);
  }

  @override
  Future<ResponseModel> patchOrderConfirm(int orderId) async {
    final response = await _dataSource.patchOrderConfirm(orderId);
    return ResponseModel.fromJson(response);
  }

  @override
  Future<ResponseModel> patchOrderReject(
    int orderId,
    RejectModel rejectModel,
  ) async {
    final response = await _dataSource.patchOrderReject(orderId, rejectModel);
    return ResponseModel.fromJson(response);
  }
}
