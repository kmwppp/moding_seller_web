import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/theme/app_input_decoration.dart';
import 'package:moding_president_web/feature/product/presentation/screens/widgets/product_guide_info.dart';
import 'package:moding_president_web/feature/product/presentation/screens/widgets/product_label.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/theme/app_box_styles.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../providers/product_register/product_register_viewmodel.dart';

class StorageInfoSection extends ConsumerWidget {
  const StorageInfoSection({super.key, required this.productId});

  final String? productId;

  static const _methods = ['냉장', '냉동', '상온'];

  static const _storageMap = {
    '냉장': 'REFRIGERATED',
    '냉동': 'FROZEN',
    '상온': 'ROOM_TEMP',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productRegisterViewModelProvider(productId));
    final vm = ref.read(productRegisterViewModelProvider(productId).notifier);

    return Container(
      decoration: AppBoxStyles.borderBox,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductLabel(
            "보관 및 취급 정보",
            isTitle: true,
            caption: "상품의 보관 방법과 취급 정보를 입력해주세요.",
            guide: ProductGuideInfo(
              title: "상품의 보관 상태 및 취급 주의사항을 설정하는 영역입니다.",
              body: [],
              caption: "※ 오입력 시 클레임 발생 가능성이 높습니다.",
            ),
            learnMore: ProductGuideInfo(
              title: '',
              body: [
                "보관 방법: 냉장 / 냉동 / 상온 선택",
                "유통 관련: 유통기한 또는 보관 기간 입력",
                "취급 주의: 해동 방법, 보관 방법 등",
              ],
              caption: "※ 입력된 정보는 구매자에게 그대로 전달됩니다.",
            ),
          ),

          const SizedBox(height: 16),

          /// 보관 방법
          Text(
            '보관방법',
            style: context.body.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children:
                _methods
                    .map(
                      (m) => Expanded(
                        child: GestureDetector(
                          onTap: () => vm.updateStorageMethod(m),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: state.storageMethod == _storageMap[m]
                                  ? AppColors.pointColor
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              m,
                              style: context.body.copyWith(
                                color: state.storageMethod == _storageMap[m]
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .expand(
                      (widget) => [widget, const SizedBox(width: 8)],
                    ) // 간격
                    .toList()
                  ..removeLast(),
          ),

          const SizedBox(height: 16),

          /// 유통 안내
          Text(
            '유통 관련 안내',
            style: context.body.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: vm.distributionNoticeController,
            style: context.body,
            maxLines: 2,
            onChanged: vm.updateDistributionNotice,
            decoration: AppInputDecoration.focusDecoration('유통 관련 안내를 입력하세요'),
          ),

          const SizedBox(height: 12),

          /// 취급 주의사항
          Text(
            '취급 주의사항',
            style: context.body.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: vm.handlingPrecautionController,
            style: context.body,
            maxLines: 2,
            onChanged: vm.updateHandleNotice,
            decoration: AppInputDecoration.focusDecoration('취급 주의사항을 입력하세요'),
          ),
        ],
      ),
    );
  }
}
