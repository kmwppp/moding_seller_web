import 'package:moding_president_web/core/network/entities/response_model.dart';
import 'package:moding_president_web/core/presentation/widgets/new_order_check.dart';
import 'package:moding_president_web/feature/dash_board/data/data_source/dash_board_data_source.dart';
import 'package:moding_president_web/feature/dash_board/domain/entities/dash_board_model.dart';
import 'package:moding_president_web/feature/dash_board/domain/repositories/dash_board_repository.dart';
import 'package:moding_president_web/feature/order/domain/entities/order_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dash_board_repository_impl.g.dart';

@riverpod
DashBoardRepository dashBoardRepository(Ref ref) {
  final dataSource = ref.watch(dashBoardDataSourceProvider);
  return DashBoardRepositoryImpl(dataSource);
}

class DashBoardRepositoryImpl implements DashBoardRepository {
  final DashBoardDataSource _dataSource;

  DashBoardRepositoryImpl(this._dataSource);

  @override
  Future<DashBoardModel> getMyDashboardInfo() async {
    final data = await _dataSource.getMyDashboardInfo();

    return DashBoardModel.fromJson(data);
  }

  @override
  Future<List<OrderModel>> getMyDashboardOrderList() async {
    final response = await _dataSource.getMyDashboardOrderList();
    final content = response['data']['content'] as List;
    final orderList = content.map((item) {
      return OrderModel.fromJson(item);
    }).toList();

    print("My Order List Length: ${orderList.length}");

    return orderList;
  }

  @override
  Future<List<OrderModel>> getMyDashboardDeliveryList() async {
    final response = await _dataSource.getMyDashboardDeliveryList();
    final content = response['data']['content'] as List;
    final orderList = content.map((item) {
      return OrderModel.fromJson(item);
    }).toList();

    print("My Order List Length: ${orderList.length}");

    return orderList;
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
