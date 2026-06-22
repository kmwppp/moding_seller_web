import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_president_web/core/presentation/widgets/modal/web_bottom_sheet.dart';
import 'package:moding_president_web/core/theme/app_input_decoration.dart';
import 'package:moding_president_web/feature/product/presentation/providers/product_register/product_register_viewmodel.dart';
import 'package:moding_president_web/feature/product/presentation/screens/widgets/category_selector_sheet.dart';
import 'package:moding_president_web/feature/product/presentation/screens/widgets/product_guide_info.dart';
import 'package:moding_president_web/feature/product/presentation/screens/widgets/product_label.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/theme/app_box_styles.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/create_product/product_category_model.dart';

class BasicInfoSection extends ConsumerWidget {
  const BasicInfoSection({super.key, required this.productId});

  final String? productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(
      productRegisterViewModelProvider(productId).notifier,
    );

    return Container(
      decoration: AppBoxStyles.borderBox,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '기본정보',
            style: context.bodyLarge.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),

          /// 상품명
          ProductLabel(
            '상품명',
            required: true,
            caption: "상품명은 실제 판매되는 상품명을 그대로 작성해주세요.",
            guide: ProductGuideInfo(
              title: "상품명은 표지 이미지 및 실제 판매명과 동일하게 작성해야 합니다.",
              body: ["예: 맛있는 돈까스 1.2kg 10입 1봉"],
              caption: "※ 상품명 불일치 시 승인 반려될 수 있습니다.",
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: notifier.productNameController, // 컨트롤러 연결 확인
            onChanged: (String productName) {
              notifier.updateProductName(productName); // 입력할 때마다 state와 동기화
            },
            style: context.body,
            decoration: AppInputDecoration.focusDecoration('상품명을 입력하세요'),
          ),

          const SizedBox(height: 12),

          /// 한줄 소개
          ProductLabel('상품 한줄 소개'),
          const SizedBox(height: 6),
          TextFormField(
            controller: notifier.summaryController,
            onChanged: (String oneLineSummary) {
              notifier.updateOneLineSummary(oneLineSummary);
            },
            style: context.body,
            decoration: AppInputDecoration.focusDecoration('상품을 한 줄로 소개해 주세요.'),
          ),

          const SizedBox(height: 12),

          /// 카테고리
          ProductLabel(
            '카테고리',
            required: true,
            caption: "상품이 노출될 카테고리를 선택해주세요.",
            guide: ProductGuideInfo(
              title: "카테고리는 상품이 노출되는 영역을 의미힙니다.",
              body: ["대분류 / 소분류를 정확하게 선택해야 합니다.", "잘못된 카테고리는 승인 반려 사유가 됩니다."],
              caption: "※ 검색 및 추천 노출에 영향을 줍니다.",
            ),
          ),
          const SizedBox(height: 6),
          _buildCategoryWidget(context, ref),
        ],
      ),
    );
  }

  Widget _buildCategoryWidget(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productRegisterViewModelProvider(productId));
    final notifier = ref.read(
      productRegisterViewModelProvider(productId).notifier,
    );

    return Row(
      children: [
        Expanded(
          child: _CategorySelectField(
            title: state.majorCategory?.name ?? '대분류',
            isPlaceholder: state.majorCategory == null,
            onTap: () async {
              if (state.majorCategoryList.isEmpty) {
                await notifier.getProductMajorCategoryList();
              }

              if (!context.mounted) return;

              final latestState = ref.read(
                productRegisterViewModelProvider(productId),
              );

              if (latestState.majorCategoryList.isEmpty) {
                await AppDialog.showError(context, '대분류 목록을 불러오지 못했습니다.');
                return;
              }

              final selected = await WebBottomSheet.show<ProductCategoryModel>(
                context: context,
                title: '대분류 선택',
                child: CategorySelectorSheet(
                  items: latestState.majorCategoryList,
                  selectedItem: latestState.majorCategory,
                ),
              );

              if (selected != null && selected != latestState.majorCategory) {
                notifier.updateCategory1(selected);
              }
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _CategorySelectField(
            title: state.subCategory?.name ?? '소분류',
            isPlaceholder: state.subCategory == null,
            onTap: () async {
              if (state.majorCategory == null) {
                await AppDialog.showError(context, '대분류를 먼저 선택해주세요.');
                return;
              }

              if (state.subCategoryList.isEmpty) {
                await notifier.getProductSubCategoryList(
                  state.majorCategory!.id,
                );
              }

              if (!context.mounted) return;

              final latestState = ref.read(
                productRegisterViewModelProvider(productId),
              );

              if (latestState.subCategoryList.isEmpty) {
                await AppDialog.showError(context, '소분류 목록을 불러오지 못했습니다.');
                return;
              }

              final selected = await WebBottomSheet.show<ProductCategoryModel>(
                context: context,
                title: '소분류 선택',
                child: CategorySelectorSheet(
                  items: latestState.subCategoryList,
                  selectedItem: latestState.subCategory,
                ),
              );

              if (selected != null) {
                notifier.updateCategory2(selected);
              }
            },
          ),
        ),
      ],
    );
  }
}

class _CategorySelectField extends StatelessWidget {
  const _CategorySelectField({
    required this.title,
    required this.isPlaceholder,
    required this.onTap,
  });

  final String title;
  final bool isPlaceholder;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: InputDecorator(
        decoration: AppInputDecoration.inputDecoration.copyWith(
          hintText: isPlaceholder ? title : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: context.body.copyWith(
                  color: isPlaceholder
                      ? AppColors.darkGrey
                      : AppColors.textColor,
                ),
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: AppColors.darkGrey),
          ],
        ),
      ),
    );
  }
}
