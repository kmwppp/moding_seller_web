import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_seller_web/core/presentation/widgets/modal/web_bottom_sheet.dart';
import 'package:moding_seller_web/feature/product/presentation/providers/product_register/product_register_viewmodel.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/widgets/delivery_region_selector_sheet.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/widgets/product_guide_info.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/widgets/product_label.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/theme/app_box_styles.dart';
import '../../../../../../core/theme/app_input_decoration.dart';
import '../../../../../../core/theme/app_text_styles.dart';

enum Weekday { mon, tue, wed, thu, fri, sat, sun }

class DeliveryInfoSection extends ConsumerWidget {
  const DeliveryInfoSection({super.key, required this.productId});

  final String? productId;

  static const _deliveryTypes = ['택배 배송', '직접 배송', '혼합 배송'];
  static const _days = ['1', '2', '3', '4', '5', '6', '7'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productRegisterViewModelProvider(productId));
    final notifier = ref.read(
      productRegisterViewModelProvider(productId).notifier,
    );
    final isEditMode = productId != null && productId!.isNotEmpty;
    final isVariableWeightLocked = isEditMode;
    final isDeliveryTypeLocked = isEditMode && state.isVariableWeight;

    final hasDirectDelivery = state.deliveryType.contains('DIRECT');
    final isDirectOnly =
        state.deliveryType.length == 1 && state.deliveryType.first == 'DIRECT';

    return Container(
      decoration: AppBoxStyles.borderBox,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductLabel(
            "배송정보",
            isTitle: true,
            caption: "배송 방식과 출고 기준, 직배송 조건을 설정해주세요.",
            guide: const ProductGuideInfo(
              title: "배송 방식과 출고 기준을 설정하는 영역입니다.",
              body: [
                "배송 소요일은 시스템에서 1일 기준으로 고정됩니다.",
                "당일 출고를 쓰지 않으면 출고 소요일만 설정하면 됩니다.",
              ],
              caption: "※ 직배송 상품은 지역 제한과 가변무게 여부를 함께 확인해주세요.",
            ),
            learnMore: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ProductGuideInfo(
                  title: "[배송 방식]",
                  body: [
                    "택배: 택배사 이용",
                    "직접 배송: 판매자 직배송",
                    "혼합 배송: 택배와 직배송 모두 가능",
                  ],
                  caption: "",
                ),
                SizedBox(height: 10),
                ProductGuideInfo(
                  title: "[직배송 설정]",
                  body: [
                    "전국 배송 가능이면 지역 선택 없이 저장됩니다.",
                    "지역 제한이 있으면 해당 지역만 직배송 가능하게 저장됩니다.",
                  ],
                  caption: "※ 가변무게 상품은 직배송 전용일 때만 설정할 수 있습니다.",
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          ProductLabel("배송 방식", required: true),
          const SizedBox(height: 8),
          Row(
            children: _deliveryTypes
                .map(
                  (type) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: isDeliveryTypeLocked
                            ? null
                            : () => notifier.updateDeliveryType(context, type),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: notifier.isSelected(type)
                                ? AppColors.pointColor
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            type,
                            style: context.body.copyWith(
                              color: notifier.isSelected(type)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _Label('당일 출고'),
              SizedBox(
                height: 30,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Switch(
                    value: state.sameDayShip,
                    onChanged: notifier.toggleSameDayShip,
                    activeThumbColor: AppColors.pointColor,
                    activeTrackColor: AppColors.pointColor.withValues(
                      alpha: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          if (state.sameDayShip)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Label("당일 출고 마감 시각"),
                const SizedBox(height: 8),
                TextFormField(
                  controller: notifier.cutoffTimeController,
                  readOnly: true,
                  decoration: AppInputDecoration.inputDecoration.copyWith(
                    hintText: "예: 12:00",
                  ),
                  onTap: () async {
                    final picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (picked != null) {
                      final time =
                          '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
                      notifier.updateCutoffTime(time);
                    }
                  },
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Label("출고 소요일"),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  dropdownColor: Colors.white,
                  menuMaxHeight: 200,
                  borderRadius: BorderRadius.circular(10),
                  initialValue: _days.contains(state.deliveryDate)
                      ? state.deliveryDate
                      : null,
                  items: _days
                      .map(
                        (day) =>
                            DropdownMenuItem(value: day, child: Text('$day일')),
                      )
                      .toList(),
                  onChanged: (value) => notifier.updateDeliveryDate(value!),
                  decoration: AppInputDecoration.inputDecoration,
                ),
              ],
            ),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _Label('주말 배송 가능 여부'),
              SizedBox(
                height: 30,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Switch(
                    value: state.isWeekendShipping,
                    onChanged: notifier.toggleWeekendShipping,
                    activeThumbColor: AppColors.pointColor,
                    activeTrackColor: AppColors.pointColor.withValues(
                      alpha: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),

          if (hasDirectDelivery) ...[
            const SizedBox(height: 16),
            ProductLabel(
              "직배송 가능 지역",
              required: true,
              caption: isDirectOnly
                  ? "전국 배송 가능을 끄면 선택한 지역만 직배송 가능하게 저장됩니다."
                  : "혼합배송 또는 택배배송에서는 전국 배송 가능으로 고정됩니다.",
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _Label('전국 배송 가능'),
                SizedBox(
                  height: 30,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Switch(
                      value: state.isNationwideDirectDelivery,
                      onChanged: isDirectOnly
                          ? notifier.toggleNationwideDirectDelivery
                          : null,
                      activeThumbColor: AppColors.pointColor,
                      activeTrackColor: AppColors.pointColor.withValues(
                        alpha: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (!state.isNationwideDirectDelivery) ...[
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () async {
                    if (state.deliveryDistrictOptions.isEmpty) {
                      await notifier.getDeliveryDistrictOptions();
                    }

                    final latestState = ref.read(
                      productRegisterViewModelProvider(productId),
                    );

                    if (latestState.deliveryDistrictOptions.isEmpty) {
                      if (context.mounted) {
                        await AppDialog.showError(
                          context,
                          "직배송 가능 지역 목록을 불러오지 못했습니다.",
                        );
                      }
                      return;
                    }

                    if (!context.mounted) return;

                    final selectedValues =
                        await WebBottomSheet.show<List<String>>(
                          context: context,
                          title: "직배송 가능 지역 선택",
                          child: DeliveryRegionSelectorSheet(
                            options: latestState.deliveryDistrictOptions,
                            initialSelectedValues:
                                latestState.directDeliveryCodes,
                          ),
                        );

                    if (selectedValues != null) {
                      notifier.setDirectDeliveryCodes(selectedValues);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    side: const BorderSide(color: AppColors.boxBorderGrey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  child: Text(
                    state.directDeliveryCodes.isEmpty
                        ? "지역 선택"
                        : "${state.directDeliveryCodes.length}개 지역 선택됨",
                    style: context.body.copyWith(
                      color: state.directDeliveryCodes.isEmpty
                          ? AppColors.darkGrey
                          : AppColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              if (state.directDeliveryCodes.isNotEmpty) ...[
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: state.deliveryDistrictOptions
                      .where(
                        (option) =>
                            state.directDeliveryCodes.contains(option.code),
                      )
                      .map(
                        (option) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F7FA),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: AppColors.boxBorderGrey),
                          ),
                          child: Text(
                            option.displayLabel,
                            style: context.bodySmall.copyWith(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ],
          ],

          if (isDirectOnly) ...[
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductLabel(
                  '가변무게 상품',
                  caption: isVariableWeightLocked
                      ? "가변무게 상품 설정을 변경할 수 없습니다."
                      : "직배송, 옵션 단위가 g/kg일 때 설정 가능합니다.",
                ),
                SizedBox(
                  height: 30,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Switch(
                      value: state.isVariableWeight,
                      onChanged: isVariableWeightLocked
                          ? null
                          : (value) =>
                                notifier.toggleVariableWeight(context, value),
                      activeThumbColor: AppColors.pointColor,
                      activeTrackColor: AppColors.pointColor.withValues(
                        alpha: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],

          const SizedBox(height: 16),
          const _Label("배송비"),
          const SizedBox(height: 4),
          TextField(
            controller: notifier.shippingFeeController,
            style: context.body,
            onChanged: notifier.updateShippingFee,
            decoration: AppInputDecoration.focusDecoration("ex) 3000"),
          ),

          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _Label('도서산간지역 배송 불가능'),
              SizedBox(
                height: 30,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Switch(
                    value: state.isExtraImpossibleShipping,
                    onChanged: notifier.toggleisExtraImpossibleShipping,
                    activeThumbColor: AppColors.pointColor,
                    activeTrackColor: AppColors.pointColor.withValues(
                      alpha: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          if (!state.isExtraImpossibleShipping) ...[
            const _Label("도서산간 추가배송비"),
            const SizedBox(height: 4),
            TextField(
              controller: notifier.extraShippingFeeController,
              style: context.body,
              onChanged: notifier.updateExtraShippingFee,
              decoration: AppInputDecoration.focusDecoration("ex) 5000"),
            ),
            const SizedBox(height: 12),
          ],

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _Label('제주도 배송 불가능'),
              SizedBox(
                height: 30,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Switch(
                    value: state.isJejuImpossibleShipping,
                    onChanged: notifier.toggleisJejuImpossibleShipping,
                    activeThumbColor: AppColors.pointColor,
                    activeTrackColor: AppColors.pointColor.withValues(
                      alpha: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          if (!state.isJejuImpossibleShipping) ...[
            const _Label("제주도 추가배송비"),
            const SizedBox(height: 4),
            TextField(
              controller: notifier.jejuShippingFeeController,
              style: context.body,
              onChanged: notifier.updateJejuShippingFee,
              decoration: AppInputDecoration.focusDecoration("ex) 5000"),
            ),
            const SizedBox(height: 12),
          ],

          const _Label("무료 배송 최소 금액"),
          const SizedBox(height: 4),
          TextField(
            controller: notifier.freeShippingThresholdController,
            style: context.body,
            onChanged: notifier.updateFreeShippingThreshold,
            decoration: AppInputDecoration.focusDecoration("ex) 30000"),
          ),

          const SizedBox(height: 12),
          const _Label("배송 안내 문구"),
          const SizedBox(height: 4),
          TextField(
            controller: notifier.shippingNoticeController,
            style: context.body,
            maxLines: 3,
            onChanged: notifier.updateShippingNotice,
            decoration: AppInputDecoration.focusDecoration("배송 안내 문구를 입력해주세요."),
          ),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.body.copyWith(
        color: AppColors.darkGrey,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
