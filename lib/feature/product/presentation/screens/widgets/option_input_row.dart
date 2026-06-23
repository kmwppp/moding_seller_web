import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/feature/product/presentation/providers/product_register/product_register_viewmodel.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_input_decoration.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/enum/capacity_unit.dart';
import '../../../domain/entities/enum/quantity_unit.dart';

const quantityUnitMap = {'개': 'EA', '박스': 'BOX'};

const quantityUnitReverseMap = {'EA': '개', 'BOX': '박스'};

class OptionInputRow extends ConsumerWidget {
  const OptionInputRow({
    super.key,
    required this.index,
    required this.productId,
  });

  final int index;
  final String? productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productRegisterViewModelProvider(productId));
    final notifier = ref.read(
      productRegisterViewModelProvider(productId).notifier,
    );

    final option = state.options[index];

    final units =
        option.capacityUnitList ??
        (option.weightOptions == '개당 중량'
            ? [CapacityUnit.g, CapacityUnit.kg]
            : [CapacityUnit.ml, CapacityUnit.l]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 중량 옵션
        Text("중량 옵션", style: context.body.copyWith(color: AppColors.darkGrey)),
        SizedBox(height: 4),

        DropdownButtonFormField<String>(
          value: option.weightOptions,
          // ✅ 중요
          dropdownColor: Colors.white,
          menuMaxHeight: 200,
          borderRadius: BorderRadius.circular(10),
          decoration: AppInputDecoration.inputDecoration,
          items: ['개당 중량', '개당 용량']
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e, style: context.body),
                ),
              )
              .toList(),
          onChanged: (v) {
            if (v != null) {
              notifier.updateWeightOption(index, v);
            }
          },
        ),

        SizedBox(height: 8),

        Row(
          children: [
            /// 숫자 입력
            Expanded(
              flex: 2,
              child: TextFormField(
                controller: notifier.optionControllers[index]['capacity'],
                style: context.body,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (v) {
                  notifier.updateCapacity(index, v);
                },
                decoration: AppInputDecoration.focusDecoration('ex)100'),
              ),
            ),

            const SizedBox(width: 8),

            /// 단위 드롭다운
            Expanded(
              flex: 2,
              child: DropdownButtonFormField<CapacityUnit>(
                value: option.capacityUnit,
                dropdownColor: Colors.white,
                menuMaxHeight: 200,
                borderRadius: BorderRadius.circular(10),
                decoration: AppInputDecoration.inputDecoration,
                items: units
                    .map(
                      (e) => DropdownMenuItem<CapacityUnit>(
                        value: e,
                        child: Text(
                          e.label, // G, KG, ML, L
                          style: context.body,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (v) {
                  if (v != null) {
                    notifier.updateCapacityUnit(index, v);
                  }
                },
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        /// 수량 옵션
        Text("수량 옵션", style: context.body.copyWith(color: AppColors.darkGrey)),
        SizedBox(height: 4),

        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: notifier.optionControllers[index]['quantity'],
                style: context.body,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (v) {
                  notifier.updateQuantity(index, v);
                },
                decoration: AppInputDecoration.focusDecoration('수량'),
              ),
            ),

            const SizedBox(width: 8),

            SizedBox(
              width: 100,
              child: DropdownButtonFormField<QuantityUnit>(
                value: option.quantityUnit,
                dropdownColor: Colors.white,
                menuMaxHeight: 200,
                borderRadius: BorderRadius.circular(10),
                decoration: AppInputDecoration.inputDecoration,
                items: QuantityUnit.values
                    .map(
                      (e) => DropdownMenuItem<QuantityUnit>(
                        value: e,
                        child: Text(e.label, style: context.body),
                      ),
                    )
                    .toList(),
                onChanged: (v) {
                  if (v != null) {
                    notifier.updateQuantityUnit(index, v);
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
