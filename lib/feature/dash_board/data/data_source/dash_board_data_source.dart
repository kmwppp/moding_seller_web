import 'package:dio/dio.dart';
import 'package:moding_seller_web/core/network/dio_client.dart';
import 'package:moding_seller_web/core/presentation/enums/order_reject_reason_enum.dart';
import 'package:moding_seller_web/core/presentation/widgets/new_order_check.dart';
import 'package:moding_seller_web/feature/order/domain/enums/order_status_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_http_urls.dart';

part 'dash_board_data_source.g.dart';

@riverpod
DashBoardDataSource dashBoardDataSource(Ref ref) {
  return DashBoardDataSource(ref.watch(dioProvider));
}

class DashBoardDataSource {
  final Dio _dio;

  DashBoardDataSource(this._dio);

  Future<Map<String, dynamic>> getMyDashboardInfo() async {
    final response = await _dio.get(AppHttpUrls.getMyDashboardInfo);
    return response.data;
  }

  Future<Map<String, dynamic>> getMyDashboardOrderList() async {
    final response = await _dio.get(
      AppHttpUrls.getMyOrderList([OrderStatus.ORDERED], null, null, 0),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getMyDashboardDeliveryList() async {
    final response = await _dio.get(
      AppHttpUrls.getMyOrderList([OrderStatus.CONFIRMED], null, null, 0),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> patchOrderConfirm(int orderId) async {
    final response = await _dio.patch(AppHttpUrls.patchOrderConfirm(orderId));
    return response.data;
  }

  Future<Map<String, dynamic>> patchOrderReject(
    int orderId,
    RejectModel rejectModel,
  ) async {
    final data = {"rejectionReason": rejectModel.reason.apiValue};

    if (rejectModel.reason == OrderRejectReasonEnum.other &&
        rejectModel.etcReason != null &&
        rejectModel.etcReason!.isNotEmpty) {
      data["rejectionReasonDetail"] = rejectModel.etcReason!;
    }

    final response = await _dio.patch(
      AppHttpUrls.patchOrderReject(orderId),
      data: data,
    );

    return response.data;
  }
}
