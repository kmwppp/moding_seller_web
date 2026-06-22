import 'package:dio/dio.dart';
import 'package:moding_president_web/core/constants/app_http_urls.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/entities/variable_weight_delivery_item_request.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/enums/delivery_method.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/dio_client.dart';

part 'preparing_data_source.g.dart';

@riverpod
PreparingDataSource preparingDataSource(Ref ref) {
  return PreparingDataSource(ref.watch(dioProvider));
}

class PreparingDataSource {
  final Dio _dio;

  PreparingDataSource(this._dio);

  Future<Map<String, dynamic>> getMyOrderDetail(String? orderId) async {
    final response = await _dio.get(AppHttpUrls.getMyOrderDetail(orderId));
    return response.data;
  }

  Future<Map<String, dynamic>> postDeliveryShip(
    String? orderId,
    DeliveryMethod deliveryMethod,
    String? courierCode,
    String? trackingNumber,
  ) async {
    final isDirect = deliveryMethod == DeliveryMethod.DIRECT;

    final response = await _dio.post(
      AppHttpUrls.postOrderDeliveryShip(orderId),
      data: {
        "deliveryMethod": deliveryMethod.name,
        "courierCode": isDirect ? null : courierCode,
        "trackingNumber": isDirect ? null : trackingNumber,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postDeliveryHanjin(
    String? orderId,
    String svcCatCd,
    String boxType,
    String payType,
  ) async {
    final response = await _dio.post(
      AppHttpUrls.postOrderDeliveryHanjin(orderId),
      data: {
        "svcCatCd": svcCatCd,
        "boxType": boxType,
        "payType": payType,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postTrackingValidation(
    String? orderId,
    String courierCode,
    String trackingNumber,
  ) async {
    final response = await _dio.post(
      AppHttpUrls.postOrderTrackingValidation(orderId),
      data: {
        'courierCode': courierCode,
        'trackingNumber': trackingNumber,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postDeliveryComplete(String? orderId) async {
    final response = await _dio.post(
      AppHttpUrls.postOrderDeliveryComplete(orderId),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postDeliveryCompleteVariableWeight(
    String? orderId,
    List<VariableWeightDeliveryItemRequest> items,
  ) async {
    final response = await _dio.post(
      AppHttpUrls.postOrderDeliveryCompleteVariableWeight(orderId),
      data: {
        'items': items.map((item) => item.toJson()).toList(),
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getCarriers() async {
    final response = await _dio.get(AppHttpUrls.getCarriers());
    return response.data;
  }
}
