import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/presentation/widgets/modal/web_bottom_sheet.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/entities/carrier_model.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/enums/delivery_method.dart';
import 'package:moding_president_web/feature/preparing_delivery/presentation/enums/delivery_execute_tab.dart';
import 'package:moding_president_web/feature/preparing_delivery/presentation/enums/hanjin_delivery_options.dart';
import 'package:moding_president_web/feature/preparing_delivery/presentation/providers/dash_delivery_viewmodel.dart';
import 'package:moding_president_web/feature/preparing_delivery/presentation/widgets/delivery_option_selector_sheet.dart';
import 'package:moding_president_web/feature/product/presentation/screens/widgets/product_label.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/theme/app_text_styles.dart';

class DeliveryExecuteSection extends ConsumerWidget {
  const DeliveryExecuteSection({
    super.key,
    required this.orderId,
    required this.onVerifyTracking,
  });

  final String? orderId;
  final Future<void> Function() onVerifyTracking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashDeliveryViewModelProvider(orderId));
    final vm = ref.read(dashDeliveryViewModelProvider(orderId).notifier);

    final isOneClick =
        state.selectedDeliveryTab == DeliveryExecuteTab.hanjinOneClick;

    return Container(
      decoration: AppBoxStyles.borderBox.copyWith(
        color: const Color(0xFFFCFDFC),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '배송 실행',
                    style: context.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF7EF),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '출고 설정',
                    style: context.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              '배송 방법과 출고 옵션을 확인한 뒤 배송 시작을 눌러주세요.',
              style: context.body.copyWith(color: AppColors.darkGrey),
            ),
            const SizedBox(height: 14),

            /// 배송방법
            Text(
              '배송방법',
              style: context.body.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                ...List.generate(state.availableDeliveryTabs.length, (index) {
                  final tab = state.availableDeliveryTabs[index];
                  final isEnabled = _isTabEnabled(tab, state.deliveryMethodList);

                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 0 : 8),
                      child: _DeliveryMethodTabButton(
                        tab: tab,
                        isSelected: state.selectedDeliveryTab == tab,
                        isEnabled: isEnabled,
                        onTap: isEnabled
                            ? () => vm.changeDeliveryExecutionTab(tab)
                            : null,
                      ),
                    ),
                  );
                }),
              ],
            ),

            const SizedBox(height: 12),
            if (state.deliveryMethod == DeliveryMethod.COURIER) ...[
              if (isOneClick)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SelectionField(
                      title: '운송장 처리 방식',
                      value: state.hanjinServiceCategory?.label,
                      hintText: '운송장 처리 방식을 선택해주세요',
                      guide: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '운송장 자동 출력',
                            style: context.body.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '일반적인 경우로 주문 전송 후 고객이 한진 포커스 시스템에 접속하여 운송장을 출력 후 물품과 함께 담당 기사님에게 전달하여 출고하는 방식입니다.',
                            style: context.body.copyWith(
                              color: AppColors.darkGrey,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            '운송장 직접 출력',
                            style: context.body.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '원클릭 고객분이 운송장을 출력할 수 없는 상황인 경우, 고객을 담당하는 담당 기사님이 고객의 출고 물품에 대한 운송장을 출력하여 방문 집하하는 서비스입니다.',
                            style: context.body.copyWith(
                              color: AppColors.darkGrey,
                            ),
                          ),
                        ],
                      ),
                      onTap: () async {
                        final selected =
                            await WebBottomSheet.show<HanjinServiceCategory>(
                              context: context,
                              title: '운송장 처리 방식 선택',
                              child:
                                  DeliveryOptionSelectorSheet<
                                    HanjinServiceCategory
                                  >(
                                    selectedValue: state.hanjinServiceCategory,
                                    items: HanjinServiceCategory.values
                                        .map(
                                          (item) => DeliveryOptionItem(
                                            value: item,
                                            label: item.label,
                                          ),
                                        )
                                        .toList(),
                                  ),
                            );
                        if (selected != null) {
                          vm.changeHanjinServiceCategory(selected);
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    _SelectionField(
                      title: '박스크기 선택',
                      value: state.hanjinBoxType?.label,
                      hintText: '박스크기를 선택해주세요',
                      onTap: () async {
                        final selected =
                            await WebBottomSheet.show<HanjinBoxType>(
                              context: context,
                              title: '박스크기 선택',
                              child: DeliveryOptionSelectorSheet<HanjinBoxType>(
                                selectedValue: state.hanjinBoxType,
                                items: HanjinBoxType.values
                                    .map(
                                      (item) => DeliveryOptionItem(
                                        value: item,
                                        label: item.label,
                                      ),
                                    )
                                    .toList(),
                              ),
                            );
                        if (selected != null) {
                          vm.changeHanjinBoxType(selected);
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    _SelectionField(
                      title: '지불조건',
                      value: state.hanjinPayType?.label,
                      hintText: '지불조건을 선택해주세요',
                      onTap: () async {
                        final selected =
                            await WebBottomSheet.show<HanjinPayType>(
                              context: context,
                              title: '지불조건 선택',
                              child: DeliveryOptionSelectorSheet<HanjinPayType>(
                                selectedValue: state.hanjinPayType,
                                items: HanjinPayType.values
                                    .map(
                                      (item) => DeliveryOptionItem(
                                        value: item,
                                        label: item.label,
                                      ),
                                    )
                                    .toList(),
                              ),
                            );
                        if (selected != null) {
                          vm.changeHanjinPayType(selected);
                        }
                      },
                    ),
                  ],
                )
              else ...[
                _SelectionField(
                  title: '택배사 선택',
                  value: state.courierCompany?.name,
                  hintText: '택배사를 선택해주세요',
                  onTap: () async {
                    final selected = await WebBottomSheet.show<CarrierModel>(
                      context: context,
                      title: '택배사 선택',
                      child: DeliveryOptionSelectorSheet<CarrierModel>(
                        selectedValue: state.courierCompany,
                        items: state.courierCompanyList
                            .map(
                              (item) => DeliveryOptionItem(
                                value: item,
                                label: item.name,
                              ),
                            )
                            .toList(),
                      ),
                    );
                    if (selected != null) {
                      vm.changeCourier(selected);
                    }
                  },
                ),
              ],

              const SizedBox(height: 12),

              /// 송장번호
              if (!isOneClick) ...[
                _InvoiceField(
                  initialValue: state.invoice,
                  onChanged: vm.changeInvoice,
                  validationMessage: state.trackingValidationMessage,
                  isValidated: state.isTrackingValidated,
                  onVerify: onVerifyTracking,
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

bool _isTabEnabled(
  DeliveryExecuteTab tab,
  List<DeliveryMethod> deliveryMethodList,
) {
  final hasCourier = deliveryMethodList.contains(DeliveryMethod.COURIER);
  final hasDirect = deliveryMethodList.contains(DeliveryMethod.DIRECT);

  switch (tab) {
    case DeliveryExecuteTab.hanjinOneClick:
    case DeliveryExecuteTab.courier:
      return hasCourier;
    case DeliveryExecuteTab.direct:
      return hasDirect;
  }
}

class _SelectionField extends StatelessWidget {
  const _SelectionField({
    required this.title,
    required this.hintText,
    required this.onTap,
    this.value,
    this.guide,
  });

  final String title;
  final String hintText;
  final String? value;
  final Widget? guide;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasValue = value != null && value!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: context.body.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (guide != null) ...[
              const SizedBox(width: 4),
              AppTooltip(
                content: guide!,
                child: const Icon(
                  Icons.help_outline,
                  size: 18,
                  color: AppColors.pointColor,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.boxBorderGrey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    hasValue ? value! : hintText,
                    style: context.body.copyWith(
                      color: hasValue ? Colors.black87 : AppColors.darkGrey,
                      fontWeight: hasValue ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.darkGrey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DeliveryMethodTabButton extends StatelessWidget {
  const _DeliveryMethodTabButton({
    required this.tab,
    required this.isSelected,
    required this.isEnabled,
    required this.onTap,
  });

  final DeliveryExecuteTab tab;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : (isEnabled ? Colors.white : const Color(0xFFF4F6F4)),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : (isEnabled
                      ? AppColors.boxBorderGrey
                      : const Color(0xFFD9E0D9)),
          ),
        ),
        child: Text(
          tab.label,
          textAlign: TextAlign.center,
          style: context.body.copyWith(
            fontWeight: FontWeight.w700,
            color: isSelected
                ? Colors.white
                : (isEnabled ? Colors.black87 : AppColors.darkGrey),
          ),
        ),
      ),
    );
  }
}

class _InvoiceField extends StatelessWidget {
  const _InvoiceField({
    required this.initialValue,
    required this.onChanged,
    required this.validationMessage,
    required this.isValidated,
    required this.onVerify,
  });

  final String initialValue;
  final ValueChanged<String> onChanged;
  final String validationMessage;
  final bool isValidated;
  final Future<void> Function() onVerify;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '송장번호',
          style: context.body.copyWith(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.boxBorderGrey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: initialValue,
                  onChanged: onChanged,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: '송장번호를 입력/붙여넣기 해주세요',
                    border: InputBorder.none,
                    hintStyle: context.body.copyWith(
                      color: AppColors.darkGrey,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: context.body.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () async {
                  await onVerify();
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.pointColor),
                  foregroundColor: AppColors.pointColor,
                  backgroundColor: const Color(0xFFFFFBF5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  '인증',
                  style: context.body.copyWith(
                    color: AppColors.pointColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          validationMessage.isNotEmpty
              ? validationMessage
              : '송장번호를 인증해주세요.',
          style: context.bodySmall.copyWith(
            color: isValidated ? AppColors.primary : Colors.red,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
