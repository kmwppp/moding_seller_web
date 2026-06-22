import 'package:moding_president_web/core/network/entities/response_model.dart';
import 'package:moding_president_web/core/presentation/enums/select_delivery_method_enum.dart';
import 'package:moding_president_web/core/presentation/widgets/new_order_check.dart';
import 'package:moding_president_web/feature/dash_board/domain/entities/dash_board_model.dart';

import '../../../order/domain/entities/order_model.dart';

abstract class DashBoardRepository {
  Future<DashBoardModel> getMyDashboardInfo();

  Future<List<OrderModel>> getMyDashboardOrderList();

  Future<List<OrderModel>> getMyDashboardDeliveryList();

  Future<ResponseModel> patchOrderConfirm(int orderId);

  Future<ResponseModel> patchOrderReject(int orderId, RejectModel rejectModel);
}
