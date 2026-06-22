import 'package:moding_president_web/feature/order/domain/entities/order_list_page_result.dart';
import 'package:moding_president_web/feature/order/domain/entities/order_summary_model.dart';

import '../../../../core/network/entities/response_model.dart';
import '../../../../core/presentation/widgets/new_order_check.dart';
import '../enums/order_status_enum.dart';

abstract class OrderRepository {
  /// ----------------------------------------
  /// 내 주문 리스트 부분
  /// ----------------------------------------
  Future<OrderListPageResult> getMyOrderList(
    List<OrderStatus>? status,
    String startDate,
    String endDate,
    int page, {
    int size = 20,
  });

  /// ----------------------------------------
  /// 내 주문 상태별 건수 부분
  /// ----------------------------------------
  Future<OrderSummaryModel> getMyOrderSummary();

  Future<ResponseModel> patchOrderConfirm(int orderId);

  Future<ResponseModel> patchOrderReject(int orderId, RejectModel rejectModel);
}
