import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/feature/product/presentation/providers/product_register/product_register_viewmodel.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/widgets/product_guide_info.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/widgets/product_label.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/theme/app_input_decoration.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/string_util.dart';
import 'option_input_row.dart';

class OptionRow extends ConsumerWidget {
  const OptionRow({super.key, required this.index, required this.productId});

  final int index;
  final String? productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productRegisterViewModelProvider(productId));
    final notifier = ref.read(
      productRegisterViewModelProvider(productId).notifier,
    );

    return Container(
      decoration: AppBoxStyles.borderBox,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 상단 타이틀 + 삭제
          Row(
            children: [
              Expanded(
                child: ProductLabel(
                  "옵션 ${index + 1}",
                  isTitle: true,
                  guide: ProductGuideInfo(
                    title: "입력 가이드",
                    body: [
                      "중량 옵션: g / kg / ml / L",
                      "예: 100g, 1kg, 500ml",
                      "",
                      "수량 옵션: 묶음 판매 시 사용",
                      "예: 1개, 10개, 20개",
                      "",
                      "가격: 실제 판매 금액 입력",
                      "할인 금액: 판매가에서 차감 방식",
                    ],
                    caption: "※ 단위 및 가격 오류 시 노출 및 비교에 영향을 줍니다.",
                  ),
                ),
              ),
              if (index != 0)
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    notifier.removeOption(index);
                  },
                ),
            ],
          ),

          const SizedBox(height: 12),

          /// ✅ 중량/용량 + 수량
          OptionInputRow(index: index, productId: productId),
          const SizedBox(height: 4),
          Text(
            "재고 입력",
            style: context.body.copyWith(color: AppColors.darkGrey),
          ),
          SizedBox(height: 4),

          TextFormField(
            controller: notifier.optionControllers[index]['stock'],
            onChanged: (String stockQuantity) {
              notifier.updateStockQuantity(index, stockQuantity);
            },
            decoration: AppInputDecoration.focusDecoration('재고'),
            style: context.body,
          ),

          const SizedBox(height: 12),

          /// ✅ 가격 영역
          _buildPriceRow(context, index, notifier),
          SizedBox(height: 4),
          Text(
            "최종 금액",
            style: context.body.copyWith(color: AppColors.darkGrey),
          ),
          SizedBox(height: 4),

          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.pointColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${StringUtil.formatCurrency(state.options[index].finalPrice)}원',
                    style: context.bodyLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
    BuildContext context,
    int index,
    ProductRegisterViewModel notifier,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "가격",
                style: context.body.copyWith(color: AppColors.darkGrey),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: notifier.optionControllers[index]['price'],
                      onChanged: (String price) {
                        notifier.updatePrice(index, price);
                      },
                      decoration: AppInputDecoration.focusDecoration(
                        'ex) 10000',
                      ),
                      style: context.body,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "할인 금액",
                style: context.body.copyWith(color: AppColors.darkGrey),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: notifier.optionControllers[index]['discount'],
                      onChanged: (String discountAmount) {
                        notifier.updateDiscountAmount(index, discountAmount);
                      },
                      decoration: AppInputDecoration.focusDecoration(
                        'ex) 2000',
                      ),
                      style: context.body,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
