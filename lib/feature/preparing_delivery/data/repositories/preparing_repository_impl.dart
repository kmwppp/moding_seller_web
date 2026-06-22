import 'package:moding_president_web/core/network/entities/response_model.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/entities/preparing_order_model.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/entities/tracking_validation_result.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/entities/variable_weight_delivery_item_request.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/enums/delivery_method.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/carrier_model.dart';
import '../../domain/repositories/preparing_repository.dart';
import '../data_source/preparing_data_source.dart';

part 'preparing_repository_impl.g.dart';

@riverpod
PreparingRepository preparingRepository(Ref ref) {
  final dataSource = ref.watch(preparingDataSourceProvider);
  return PreparingRepositoryImpl(dataSource);
}

class PreparingRepositoryImpl implements PreparingRepository {
  final PreparingDataSource _dataSource;

  PreparingRepositoryImpl(this._dataSource);

  @override
  Future<PreparingOrderModel> getMyOrderDetail(String? orderId) async {
    final response = await _dataSource.getMyOrderDetail(orderId);
    final data = PreparingOrderModel.fromJson(response['data']);
    return data;
  }

  @override
  Future<ResponseModel> postDeliveryComplete(String? orderId) async {
    final response = await _dataSource.postDeliveryComplete(orderId);
    return ResponseModel.fromJson(response);
  }

  @override
  Future<ResponseModel> postDeliveryCompleteVariableWeight(
    String? orderId,
    List<VariableWeightDeliveryItemRequest> items,
  ) async {
    final response = await _dataSource.postDeliveryCompleteVariableWeight(
      orderId,
      items,
    );
    return ResponseModel.fromJson(response);
  }

  @override
  Future<ResponseModel> postDeliveryShip(
    String? orderId,
    DeliveryMethod deliveryMethod,
    String? courierCode,
    String? trackingNumber,
  ) async {
    final response = await _dataSource.postDeliveryShip(
      orderId,
      deliveryMethod,
      courierCode,
      trackingNumber,
    );
    return ResponseModel.fromJson(response);
  }

  @override
  Future<ResponseModel> postDeliveryHanjin(
    String? orderId,
    String svcCatCd,
    String boxType,
    String payType,
  ) async {
    final response = await _dataSource.postDeliveryHanjin(
      orderId,
      svcCatCd,
      boxType,
      payType,
    );
    return ResponseModel.fromJson(response);
  }

  @override
  Future<TrackingValidationResult> postTrackingValidation(
    String? orderId,
    String courierCode,
    String trackingNumber,
  ) async {
    final response = await _dataSource.postTrackingValidation(
      orderId,
      courierCode,
      trackingNumber,
    );
    return TrackingValidationResult.fromJson(response);
  }

  @override
  Future<List<CarrierModel>> getCarrierList() async {
    final response = await _dataSource.getCarriers();
    final data = response['data'] as List;

    return data
        .map((e) => CarrierModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
