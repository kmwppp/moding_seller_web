import 'package:flutter/material.dart';
import 'package:moding_president_web/core/network/entities/response_model.dart';
import 'package:moding_president_web/feature/claim/data/repositories/claim_repository_impl.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/entities/tracking_validation_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../preparing_delivery/domain/entities/carrier_model.dart';
import '../../../../preparing_delivery/domain/enums/delivery_method.dart';
import '../../../../preparing_delivery/presentation/enums/delivery_execute_tab.dart';
import '../../../../preparing_delivery/presentation/enums/hanjin_delivery_options.dart';
import '../../models/approve_type.dart';
import '../../models/reason_type.dart';
import 'claim_detail_state.dart';

part 'claim_detail_viewmodel.g.dart';

@Riverpod()
class ClaimDetailViewModel extends _$ClaimDetailViewModel {
  final TextEditingController etcController = TextEditingController();

  @override
  ClaimDetailState build(String? claimId) {
    // dispose 등록
    ref.onDispose(() {
      etcController.dispose();
    });

    if (claimId != null) {
      getCarriers();
      Future.microtask(() => getMyClaimDetail(claimId));
    }
    return ClaimDetailState.initial();
  }

  void selectReason(ReasonType type) {
    if (type != ReasonType.etc) {
      etcController.clear();
    }

    state = state.copyWith(
      selectedReason: type,
      etcText: type == ReasonType.etc ? state.etcText : "",
    );
  }

  void selectApprove(ApproveType type) {
    state = state.copyWith(selectApprove: type);
  }

  void updateEtcText(String value) {
    state = state.copyWith(etcText: value);
  }

  /// 이미지 인덱스 변경
  void changeImageCurrentIndex(int index) {
    state = state.copyWith(imageCurrentIndex: index);
  }

  void changeDeliveryMethod(DeliveryMethod method) {
    if (method == DeliveryMethod.DIRECT) {
      state = state.copyWith(courierCompany: null, invoice: '');
    }
    state = state.copyWith(deliveryMethod: method);
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
      invoice: isDirect ? '' : state.invoice,
    );
  }

  void changeCourier(CarrierModel courier) {
    state = state.copyWith(
      courierCompany: courier,
      isTrackingValidated: false,
      trackingValidationMessage: '',
    );
  }

  void changeInvoice(String invoice) {
    state = state.copyWith(
      invoice: invoice,
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

  Future<TrackingValidationResult> verifyInvoice(String claimId) async {
    if ((state.invoice ?? '').isEmpty) {
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
      final repository = ref.read(claimRepositoryProvider);
      final result = await repository.postClaimTrackingValidation(
        claimId,
        state.courierCompany!.code,
        state.invoice!,
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

      return result.copyWith(success: isValidated, message: responseMessage);
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

  Future<ResponseModel> patchClaimReject(String claimId) async {
    final reason = state.selectedReason != ReasonType.etc
        ? state.selectedReason?.label
        : etcController.text;

    if (reason == "" || reason == null) {
      return ResponseModel(success: false, message: "거절 사유를 입력해주세요.");
    }
    try {
      final repository = ref.read(claimRepositoryProvider);
      final response = await repository.patchClaimReject(claimId, reason);

      return response;
    } catch (e) {
      print(e);
      return ResponseModel(success: false, message: "알 수 없는 오류가 생겼습니다.");
    }
  }

  Future<ResponseModel> patchClaimApprove(String claimId) async {
    if (state.selectApprove == null) {
      return ResponseModel(success: false, message: "처리 방식을 선택해주세요.");
    }
    try {
      final repository = ref.read(claimRepositoryProvider);
      final response = await repository.patchClaimApprove(
        claimId,
        state.selectApprove!,
      );

      return response;
    } catch (e) {
      print(e);
      return ResponseModel(success: false, message: "알 수 없는 오류가 생겼습니다.");
    }
  }

  Future<ResponseModel> patchClaimReship(String claimId) async {
    if (state.selectedDeliveryTab == DeliveryExecuteTab.hanjinOneClick) {
      if (state.hanjinServiceCategory == null) {
        return ResponseModel(success: false, message: '운송장 처리 방식을 선택해주세요.');
      }
      if (state.hanjinBoxType == null) {
        return ResponseModel(success: false, message: '박스크기를 선택해주세요.');
      }
      if (state.hanjinPayType == null) {
        return ResponseModel(success: false, message: '지불조건을 선택해주세요.');
      }
    }

    if (state.selectedDeliveryTab == DeliveryExecuteTab.courier) {
      if (!state.isTrackingValidated) {
        return ResponseModel(success: false, message: '송장번호를 인증해주세요.');
      }
      if ((state.invoice ?? '').isEmpty) {
        return ResponseModel(success: false, message: "송장번호를 입력해주세요.");
      }
    }
    try {
      final repository = ref.read(claimRepositoryProvider);
      final response =
          state.selectedDeliveryTab == DeliveryExecuteTab.hanjinOneClick
          ? await repository.patchClaimReshipHanjin(
              claimId,
              state.hanjinServiceCategory!.code,
              state.hanjinBoxType!.code,
              state.hanjinPayType!.code,
            )
          : await repository.patchClaimReship(
              claimId,
              state.deliveryMethod!.name,
              state.deliveryMethod == DeliveryMethod.DIRECT
                  ? null
                  : state.courierCompany?.code,
              state.deliveryMethod == DeliveryMethod.DIRECT ? null : state.invoice,
            );

      return response;
    } catch (e) {
      print(e);
      return ResponseModel(success: false, message: "알 수 없는 오류가 생겼습니다.");
    }
  }

  Future<ResponseModel> patchClaimReshipComplete(String claimId) async {
    try {
      final repository = ref.read(claimRepositoryProvider);
      final response = await repository.patchClaimReshipComplete(claimId);

      return response;
    } catch (e) {
      print(e);
      return ResponseModel(success: false, message: "알 수 없는 오류가 생겼습니다.");
    }
  }

  Future<void> getMyClaimDetail(String claimId) async {
    try {
      final repository = ref.read(claimRepositoryProvider);
      final response = await repository.getMyClaimDetail(claimId);
      final availableTabs = _allDeliveryTabs;
      final selectedTab = _resolveInitialTab(response.productDeliveryMethods ?? []);
      final effectiveDeliveryMethod = selectedTab == DeliveryExecuteTab.direct
          ? DeliveryMethod.DIRECT
          : DeliveryMethod.COURIER;
      final initialCourier = selectedTab == DeliveryExecuteTab.hanjinOneClick
          ? (_findHanjinCarrier(state.courierCompanyList) ?? state.courierCompany)
          : state.courierCompany;

      state = state.copyWith(
        isLoading: false,
        model: response,
        deliveryMethodList: response.productDeliveryMethods,
        availableDeliveryTabs: availableTabs,
        selectedDeliveryTab: selectedTab,
        deliveryMethod: effectiveDeliveryMethod,
        courierCompany: initialCourier,
        invoice: '',
        isTrackingValidated: false,
        trackingValidationMessage: '',
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCarriers() async {
    try {
      final repository = ref.read(claimRepositoryProvider);
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

  List<DeliveryExecuteTab> get _allDeliveryTabs => const [
    DeliveryExecuteTab.hanjinOneClick,
    DeliveryExecuteTab.courier,
    DeliveryExecuteTab.direct,
  ];

  DeliveryExecuteTab _resolveInitialTab(
    List<DeliveryMethod> productDeliveryMethods,
  ) {
    if (productDeliveryMethods.contains(DeliveryMethod.COURIER)) {
      return DeliveryExecuteTab.hanjinOneClick;
    }
    return DeliveryExecuteTab.direct;
  }

  bool _isTabEnabled(DeliveryExecuteTab tab) {
    final deliveryMethods = state.deliveryMethodList ?? const <DeliveryMethod>[];
    final hasCourier = deliveryMethods.contains(DeliveryMethod.COURIER);
    final hasDirect = deliveryMethods.contains(DeliveryMethod.DIRECT);

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
