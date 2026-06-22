import 'package:moding_president_web/core/network/entities/response_model.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/entities/preparing_order_model.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/entities/tracking_validation_result.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/entities/variable_weight_delivery_item_request.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/enums/delivery_method.dart';

import '../entities/carrier_model.dart';

abstract class PreparingRepository {
  Future<PreparingOrderModel> getMyOrderDetail(String? orderId);

  Future<ResponseModel> postDeliveryShip(String? orderId,
      DeliveryMethod deliveryMethod,
      String? courierCode,
      String? trackingNumber,);

  Future<ResponseModel> postDeliveryHanjin(
    String? orderId,
    String svcCatCd,
    String boxType,
    String payType,
  );

  Future<TrackingValidationResult> postTrackingValidation(
    String? orderId,
    String courierCode,
    String trackingNumber,
  );

  Future<ResponseModel> postDeliveryComplete(String? orderId);

  Future<ResponseModel> postDeliveryCompleteVariableWeight(
    String? orderId,
    List<VariableWeightDeliveryItemRequest> items,
  );

  Future<List<CarrierModel>> getCarrierList();
}
