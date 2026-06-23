import 'package:dio/dio.dart';
import 'package:moding_seller_web/core/network/dio_client.dart';
import 'package:moding_seller_web/feature/order/domain/enums/order_status_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_http_urls.dart';
import '../../../../core/presentation/enums/order_reject_reason_enum.dart';
import '../../../../core/presentation/widgets/new_order_check.dart';

part 'order_data_source.g.dart';

@riverpod
OrderDataSource orderDataSource(Ref ref) {
  return OrderDataSource(ref.watch(dioProvider));
}

class OrderDataSource {
  final Dio _dio;

  OrderDataSource(this._dio);

  /// ----------------------------------------
  /// 내 주문 상태별 건수 부분
  /// ----------------------------------------
  Future<Map<String, dynamic>> getMyOrderSummary() async {
    final response = await _dio.get(AppHttpUrls.getMyOrderSummary());
    return response.data;
  }

  Future<Map<String, dynamic>> getMyOrderList(
    List<OrderStatus>? status,
    String startDate,
    String endDate,
    int page, {
    int size = 20,
  }) async {
    final response = await _dio.get(
      AppHttpUrls.getMyOrderList(status, startDate, endDate, page, size: size),
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
