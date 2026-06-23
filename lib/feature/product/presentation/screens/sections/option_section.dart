import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/feature/product/presentation/providers/product_register/product_register_viewmodel.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/widgets/product_guide_info.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/widgets/product_label.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/theme/app_box_styles.dart';
import '../../../../dash_board/presentation/screens/widgets/custom_button.dart';
import '../widgets/option_row.dart';

class OptionSection extends ConsumerWidget {
  const OptionSection({super.key, required this.productId});

  final String? productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productRegisterViewModelProvider(productId));
    final notifier = ref.read(
      productRegisterViewModelProvider(productId).notifier,
    );
    return Container(
      decoration: AppBoxStyles.borderBox,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductLabel(
            "옵션 추가 및 수정",
            isTitle: true,
            required: true,
            caption: "판매 단위와 가격을 입력해주세요.",
            guide: ProductGuideInfo(
              title: "상품의 판매 단위와 가격을 설정하는 영역입니다.",
              body: ["단위 기준으로 가격 비교가 이루어집니다.", "할인 금액 입력 시 자동으로 최종가가 계산됩니다."],
              caption: "※ 정확한 입력이 중요합니다.",
            ),
          ),

          /// ✅ 리스트
          if (state.options.isNotEmpty) ...[
            const SizedBox(height: 10),

            ...List.generate(state.options.length, (i) {
              return Column(
                children: [
                  OptionRow(index: i, productId: productId),
                  if (i != state.options.length - 1)
                    Column(
                      children: [
                        SizedBox(height: 10),
                        Divider(),
                        SizedBox(height: 10),
                      ],
                    ),
                ],
              );
            }),
          ],
          SizedBox(height: 10),

          /// ✅ 추가 버튼
          GestureDetector(
            onTap: () {
              notifier.addOption();
            },
            child: CustomButton(
              title: "+ 옵션 추가",
              boxColor: AppColors.primary,
              textColor: Colors.white,
              paddingVertical: 8,
            ),
          ),
        ],
      ),
    );
  }
}
