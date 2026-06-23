import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moding_seller_web/feature/preparing_delivery/domain/entities/preparing_order_model.dart';
import 'package:moding_seller_web/feature/preparing_delivery/presentation/enums/delivery_execute_tab.dart';
import 'package:moding_seller_web/feature/preparing_delivery/presentation/enums/hanjin_delivery_options.dart';

import '../../domain/entities/carrier_model.dart';
import '../../domain/enums/delivery_method.dart';

part 'dash_delivery_state.freezed.dart';

@freezed
abstract class DashDeliveryState with _$DashDeliveryState {
  const DashDeliveryState._();

  const factory DashDeliveryState({
    required bool isLoading,
    required String orderCode,
    required String orderStatus,
    required String orderDate,
    required String recipientName,
    required String address,
    required String phone,
    required List<PreparingOrderItemModel> items,
    required String deliveryRequest,
    required bool isVariableWeight,

    required DeliveryMethod? deliveryMethod,
    required List<DeliveryMethod> deliveryMethodList,
    required List<DeliveryExecuteTab> availableDeliveryTabs,
    required DeliveryExecuteTab selectedDeliveryTab,

    required CarrierModel? courierCompany,
    required List<CarrierModel> courierCompanyList,
    required String invoice,
    required bool isTrackingValidated,
    required String trackingValidationMessage,
    required HanjinServiceCategory? hanjinServiceCategory,
    required HanjinBoxType? hanjinBoxType,
    required HanjinPayType? hanjinPayType,

    PreparingDeliveryModel? delivery,
    PreparingPaymentModel? payment,
  }) = _DashDeliveryState;

  factory DashDeliveryState.initial() => DashDeliveryState(
    isLoading: true,
    orderCode: '',
    orderStatus: '',
    orderDate: '',
    recipientName: '',
    address: '',
    phone: '',
    items: [],
    deliveryRequest: '',
    isVariableWeight: false,

    deliveryMethod: DeliveryMethod.COURIER,
    deliveryMethodList: [],
    availableDeliveryTabs: const [
      DeliveryExecuteTab.hanjinOneClick,
      DeliveryExecuteTab.courier,
      DeliveryExecuteTab.direct,
    ],
    selectedDeliveryTab: DeliveryExecuteTab.hanjinOneClick,
    courierCompany: null,
    courierCompanyList: [],
    invoice: '',
    isTrackingValidated: false,
    trackingValidationMessage: '',
    hanjinServiceCategory: null,
    hanjinBoxType: null,
    hanjinPayType: null,
    delivery: null,
    payment: null,
  );
}
