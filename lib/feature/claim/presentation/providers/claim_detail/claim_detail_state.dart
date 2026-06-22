import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moding_president_web/feature/claim/domain/entities/claim_detail/claim_detail_model.dart';
import 'package:moding_president_web/feature/claim/presentation/models/approve_type.dart';
import 'package:moding_president_web/feature/preparing_delivery/presentation/enums/delivery_execute_tab.dart';
import 'package:moding_president_web/feature/preparing_delivery/presentation/enums/hanjin_delivery_options.dart';

import '../../../../preparing_delivery/domain/entities/carrier_model.dart';
import '../../../../preparing_delivery/domain/enums/delivery_method.dart';
import '../../models/reason_type.dart';

part 'claim_detail_state.freezed.dart';

@freezed
abstract class ClaimDetailState with _$ClaimDetailState {
  const ClaimDetailState._();

  const factory ClaimDetailState({
    required bool isLoading,
    required int imageCurrentIndex,
    required ClaimDetailModel? model,
    required List<String> images,

    required ReasonType? selectedReason,
    required String etcText,

    required ApproveType? selectApprove,

    required DeliveryMethod? deliveryMethod,
    required List<DeliveryMethod>? deliveryMethodList,
    required List<DeliveryExecuteTab> availableDeliveryTabs,
    required DeliveryExecuteTab selectedDeliveryTab,

    required CarrierModel? courierCompany,
    required List<CarrierModel> courierCompanyList,
    required String? invoice,
    required bool isTrackingValidated,
    required String trackingValidationMessage,
    required HanjinServiceCategory? hanjinServiceCategory,
    required HanjinBoxType? hanjinBoxType,
    required HanjinPayType? hanjinPayType,
  }) = _ClaimDetailState;

  factory ClaimDetailState.initial() => ClaimDetailState(
    isLoading: true,
    imageCurrentIndex: 0,
    model: null,
    images: [
      'https://picsum.photos/250/250',
      'https://picsum.photos/250/250',
      'https://picsum.photos/250/250',
    ],
    selectedReason: null,
    etcText: "",
    selectApprove: null,
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
  );
}

class CourierCompany {
  final String code;
  final String name;

  CourierCompany({required this.code, required this.name});
}
