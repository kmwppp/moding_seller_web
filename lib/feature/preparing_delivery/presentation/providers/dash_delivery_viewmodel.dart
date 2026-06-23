import 'package:moding_seller_web/core/network/entities/response_model.dart';
import 'package:moding_seller_web/core/utils/app_enum.dart';
import 'package:moding_seller_web/feature/preparing_delivery/data/repositories/preparing_repository_impl.dart';
import 'package:moding_seller_web/feature/preparing_delivery/domain/entities/tracking_validation_result.dart';
import 'package:moding_seller_web/feature/preparing_delivery/domain/entities/variable_weight_delivery_item_request.dart';
import 'package:moding_seller_web/feature/preparing_delivery/presentation/enums/hanjin_delivery_options.dart';
import 'package:moding_seller_web/feature/preparing_delivery/presentation/providers/dash_delivery_state.dart';
import 'package:moding_seller_web/feature/preparing_delivery/presentation/enums/delivery_execute_tab.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/carrier_model.dart';
import '../../domain/enums/delivery_method.dart';

part 'dash_delivery_viewmodel.g.dart';

@Riverpod()
class DashDeliveryViewModel extends _$DashDeliveryViewModel {
  @override
  DashDeliveryState build(String? orderId) {
    if (orderId != null) {
      Future.microtask(() => getCarriers());
      Future.microtask(() => getMyOrderDetail());
    }
    return DashDeliveryState.initial();
  }

  void changeDeliveryExecutionTab(DeliveryExecuteTab tab) {
    if (!_isTabEnabled(tab)) {
      return;
    }

    final isDirect = tab == DeliveryExecuteTab.direct;
    final hanjinCarrier = _findHanjinCarrier(state.courierCompanyList);

    state = state.copyWith(
      selectedDeliveryTab: tab,
      deliveryMethod: isDirect ? DeliveryMethod.DIRECT : DeliveryMethod.COURIER,
      courierCompany: isDirect
          ? null
          : (tab == DeliveryExecuteTab.hanjinOneClick
                ? (hanjinCarrier ?? state.courierCompany)
                : state.courierCompany),
      isTrackingValidated: tab == DeliveryExecuteTab.courier
          ? state.isTrackingValidated
          : false,
      trackingValidationMessage: tab == DeliveryExecuteTab.courier
          ? state.trackingValidationMessage
          : '',
    );
  }

  void changeCourier(CarrierModel courier) {
    state = state.copyWith(
      courierCompany: courier,
      isTrackingValidated: false,
      trackingValidationMessage: '',
    );
  }

  void changeHanjinServiceCategory(HanjinServiceCategory value) {
    state = state.copyWith(hanjinServiceCategory: value);
  }

  void changeHanjinBoxType(HanjinBoxType value) {
    state = state.copyWith(hanjinBoxType: value);
  }

  void changeHanjinPayType(HanjinPayType value) {
    state = state.copyWith(hanjinPayType: value);
  }

  void changeInvoice(String invoice) {
    state = state.copyWith(
      invoice: invoice,
      isTrackingValidated: false,
      trackingValidationMessage: '',
    );
  }

  Future<TrackingValidationResult> verifyInvoice(String? orderId) async {
    if (state.invoice.isEmpty) {
      return const TrackingValidationResult(
        success: false,
        message: '송장번호를 입력해주세요.',
      );
    }
    if (state.courierCompany == null) {
      return const TrackingValidationResult(
        success: false,
        message: '택배사를 선택해주세요.',
      );
    }

    try {
      final repository = ref.read(preparingRepositoryProvider);
      final result = await repository.postTrackingValidation(
        orderId,
        state.courierCompany!.code,
        state.invoice,
      );

      if (!result.success) {
        state = state.copyWith(
          isTrackingValidated: false,
          trackingValidationMessage: result.message,
        );
        return result;
      }

      final validationState = result.data?.state ?? '';
      final responseMessage = _trackingStateMessage(validationState);
      final isValidated =
          validationState == 'REGISTERED' || validationState == 'PENDING';
      final isRecipientMismatch = result.data?.isRecipientMismatch ?? false;

      state = state.copyWith(
        isTrackingValidated: isValidated && !isRecipientMismatch,
        trackingValidationMessage: responseMessage,
      );

      return result.copyWith(
        success: isValidated,
        message: responseMessage,
      );
    } catch (e) {
      print(e);
      state = state.copyWith(
        isTrackingValidated: false,
        trackingValidationMessage: '일시적인 오류로 재인증 해주세요.',
      );
      return const TrackingValidationResult(
        success: false,
        message: '일시적인 오류로 재인증 해주세요.',
      );
    }
  }

  void completeTrackingValidation([String message = '송장번호를 확인하였습니다.']) {
    state = state.copyWith(
      isTrackingValidated: true,
      trackingValidationMessage: message,
    );
  }

  Future<ResponseModel> postOrderDeliveryShip(String? orderId) async {
    if (state.selectedDeliveryTab == DeliveryExecuteTab.courier &&
        !state.isTrackingValidated) {
      return ResponseModel(success: false, message: '송장번호를 인증해주세요.');
    }

    try {
      final repository = ref.read(preparingRepositoryProvider);
      final response = await repository.postDeliveryShip(
        orderId,
        state.deliveryMethod!,
        state.courierCompany?.code,
        state.invoice,
      );
      return response;
    } catch (e) {
      print(e);
    }
    return ResponseModel(success: false, message: "알 수 없는 오류가 발생했습니다.");
  }

  Future<ResponseModel> postOrderDeliveryHanjin(String? orderId) async {
    if (state.hanjinServiceCategory == null) {
      return ResponseModel(success: false, message: '운송장 처리 방식을 선택해주세요.');
    }
    if (state.hanjinBoxType == null) {
      return ResponseModel(success: false, message: '박스크기를 선택해주세요.');
    }
    if (state.hanjinPayType == null) {
      return ResponseModel(success: false, message: '지불조건을 선택해주세요.');
    }

    try {
      final repository = ref.read(preparingRepositoryProvider);
      final response = await repository.postDeliveryHanjin(
        orderId,
        state.hanjinServiceCategory!.code,
        state.hanjinBoxType!.code,
        state.hanjinPayType!.code,
      );
      return response;
    } catch (e) {
      print(e);
    }
    return ResponseModel(success: false, message: "알 수 없는 오류가 발생했습니다.");
  }

  Future<ResponseModel> postDeliveryComplete(String? orderId) async {
    try {
      final repository = ref.read(preparingRepositoryProvider);
      final response = await repository.postDeliveryComplete(orderId);
      return response;
    } catch (e) {
      print(e);
    }
    return ResponseModel(success: false, message: "알 수 없는 오류가 발생했습니다.");
  }

  Future<ResponseModel> postDeliveryCompleteVariableWeight(
    String? orderId,
    List<VariableWeightDeliveryItemRequest> items,
  ) async {
    try {
      final repository = ref.read(preparingRepositoryProvider);
      final response = await repository.postDeliveryCompleteVariableWeight(
        orderId,
        items,
      );
      return response;
    } catch (e) {
      print(e);
    }
    return ResponseModel(success: false, message: "알 수 없는 오류가 발생했습니다.");
  }

  Future<void> getCarriers() async {
    try {
      final repository = ref.read(preparingRepositoryProvider);
      final response = await repository.getCarrierList();
      final selectedCourier = state.selectedDeliveryTab ==
              DeliveryExecuteTab.hanjinOneClick
          ? (_findHanjinCarrier(response) ?? state.courierCompany)
          : state.courierCompany;

      state = state.copyWith(
        courierCompanyList: response,
        courierCompany: selectedCourier,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> getMyOrderDetail() async {
    try {
      final repository = ref.read(preparingRepositoryProvider);
      final response = await repository.getMyOrderDetail(orderId);
      final availableTabs = _allDeliveryTabs;
      final selectedTab = _resolveInitialTab(
        availableTabs,
        response.status,
        response.deliveryMethod,
        response.delivery,
        response.productDeliveryMethods,
      );
      final effectiveDeliveryMethod = selectedTab == DeliveryExecuteTab.direct
          ? DeliveryMethod.DIRECT
          : DeliveryMethod.COURIER;
      final initialCourier = selectedTab == DeliveryExecuteTab.hanjinOneClick
          ? (_findHanjinCarrier(state.courierCompanyList) ?? state.courierCompany)
          : state.courierCompany;

      state = state.copyWith(
        isLoading: false,
        orderCode: response.orderCode,
        orderStatus: response.status,
        orderDate: response.updatedAt.toDataAndTimeNoLineBreak,
        recipientName: response.recipientName,
        address: response.address,
        deliveryMethod: effectiveDeliveryMethod,
        deliveryMethodList: response.productDeliveryMethods
            .map((e) => DeliveryMethod.fromString(e.name))
            .toList(),
        availableDeliveryTabs: availableTabs,
        selectedDeliveryTab: selectedTab,
        courierCompany: initialCourier,
        invoice: response.delivery?.trackingNumber ?? '',
        isTrackingValidated: false,
        trackingValidationMessage: '',
        phone: response.phone,
        items: response.items,
        delivery: response.delivery,
        payment: response.payment,
        deliveryRequest: response.deliveryRequest ?? '',
        isVariableWeight: response.isVariableWeight,
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }

  List<DeliveryExecuteTab> get _allDeliveryTabs => const [
    DeliveryExecuteTab.hanjinOneClick,
    DeliveryExecuteTab.courier,
    DeliveryExecuteTab.direct,
  ];

  DeliveryExecuteTab _resolveInitialTab(
    List<DeliveryExecuteTab> tabs,
    String orderStatus,
    DeliveryMethod? deliveryMethod,
    dynamic delivery,
    List<DeliveryMethod> productDeliveryMethods,
  ) {
    final isConfirmed = orderStatus == 'CONFIRMED';

    if (isConfirmed) {
      if (productDeliveryMethods.contains(DeliveryMethod.COURIER)) {
        return DeliveryExecuteTab.hanjinOneClick;
      }
      return DeliveryExecuteTab.direct;
    }

    if (deliveryMethod == DeliveryMethod.DIRECT) {
      return DeliveryExecuteTab.direct;
    }

    if (deliveryMethod == DeliveryMethod.COURIER) {
      final courierName = delivery?.courierName?.toString() ?? '';
      final courierCode = delivery?.courierCode?.toString() ?? '';
      final isHanjin =
          courierName.contains('한진') || courierCode.toUpperCase().contains('HANJIN');

      if (isHanjin && tabs.contains(DeliveryExecuteTab.hanjinOneClick)) {
        return DeliveryExecuteTab.hanjinOneClick;
      }

      if (tabs.contains(DeliveryExecuteTab.courier)) {
        return DeliveryExecuteTab.courier;
      }
    }

    if (productDeliveryMethods.contains(DeliveryMethod.COURIER)) {
      return DeliveryExecuteTab.hanjinOneClick;
    }

    return DeliveryExecuteTab.direct;
  }

  bool _isTabEnabled(DeliveryExecuteTab tab) {
    final hasCourier = state.deliveryMethodList.contains(DeliveryMethod.COURIER);
    final hasDirect = state.deliveryMethodList.contains(DeliveryMethod.DIRECT);

    switch (tab) {
      case DeliveryExecuteTab.hanjinOneClick:
      case DeliveryExecuteTab.courier:
        return hasCourier;
      case DeliveryExecuteTab.direct:
        return hasDirect;
    }
  }

  CarrierModel? _findHanjinCarrier(List<CarrierModel> carriers) {
    for (final carrier in carriers) {
      final code = carrier.code.toUpperCase();
      final name = carrier.name;
      if (code.contains('HANJIN') || name.contains('한진')) {
        return carrier;
      }
    }
    return null;
  }

  String _trackingStateMessage(String state) {
    switch (state) {
      case 'REGISTERED':
      case 'PENDING':
        return '송장번호를 확인하였습니다.';
      case 'NOT_FOUND':
        return '송장번호를 확인해주세요.';
      case 'FORMAT_INVALID':
        return '송장번호 형식이 다릅니다.';
      case 'ALREADY_SHIPPED':
        return '이미출고된 송장번호입니다.';
      case 'UNAVAILABLE':
        return '일시적인 오류로 재인증 해주세요.';
      default:
        return '송장번호를 확인해주세요.';
    }
  }
}
