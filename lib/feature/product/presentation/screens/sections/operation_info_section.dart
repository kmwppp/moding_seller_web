import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/widgets/product_guide_info.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/widgets/product_label.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/theme/app_box_styles.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/presentation/date_picker/app_date_picker.dart';
import '../../providers/product_register/product_register_viewmodel.dart';

class OperationInfoSection extends ConsumerWidget {
  const OperationInfoSection({super.key, required this.productId});

  final String? productId;

  static const _taxMap = {'과세': true, '면세': false};
  static const _haccpMap = {'인증': true, '미인증': false};

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productRegisterViewModelProvider(productId));
    final vm = ref.read(productRegisterViewModelProvider(productId).notifier);

    final isPeriod = state.salePeriodType == '기간 설정';
    final isEditMode = state.productId.isNotEmpty;
    final canSetHaccpToCertified =
        !isEditMode || state.initialIsHaccpCertified;
    final taxTypes = ['과세', '면세'];
    final haccpTypes = ['인증', '미인증'];
    final salePeriodTypes = ['상시 판매', '기간 설정'];

    return Container(
      decoration: AppBoxStyles.borderBox,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductLabel(
              "운영 정보",
              isTitle: true,
              caption: "과세 여부와 판매기간을 설정해주세요.",
              guide: ProductGuideInfo(
                title: "과세/면세 여부와 판매기간을 설정하는 영역입니다.",
                body: [],
                caption: "※ 정산 및 세금 계산에 직접 반영됩니다.",
              ),
              learnMore: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProductGuideInfo(
                    title: "[과세/면세]",
                    body: ["과세: 부가세 포함 상품", "면세: 부가세 미적용 상품 (일부 식품)"],
                    caption: "※ 세금계산서 발행 기준이 됩니다.",
                  ),
                  const SizedBox(height: 10),
                  ProductGuideInfo(
                    title: "[HACCP 인증 여부]",
                    body: ["인증: HACCP 인증 상품", "미인증: HACCP 미인증 상품"],
                    caption: "※ 상품 수정 시 기존 미인증 상품은 인증으로 변경할 수 없습니다.",
                  ),
                  SizedBox(height: 10),
                  ProductGuideInfo(
                    title: "[판매 기간]",
                    body: ["상시판매: 기간 제한 없음", "기간설정: 특정 기간 동안만 판매"],
                    caption: "※ 기간 종료 시 자동으로 판매 중지됩니다.",
                  ),

                  ProductGuideInfo(
                    title: "",
                    body: [],
                    caption: "※ 잘못 설정할 경우 정산 오류 및 세금 문제가 발생할 수 있습니다.",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'HACCP 인증 여부',
              style: context.body.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: haccpTypes
                  .map(
                    (m) {
                      final targetValue = _haccpMap[m]!;
                      final isDisabled =
                          targetValue && !canSetHaccpToCertified;

                      return Expanded(
                        child: GestureDetector(
                          onTap: isDisabled
                              ? null
                              : () => vm.updateHaccpCertified(targetValue),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: state.isHaccpCertified == targetValue
                                  ? AppColors.pointColor
                                  : (isDisabled
                                        ? Colors.grey[100]
                                        : Colors.grey[200]),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              m,
                              style: context.body.copyWith(
                                color: state.isHaccpCertified == targetValue
                                    ? Colors.white
                                    : (isDisabled
                                          ? AppColors.boxBorderGrey
                                          : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                  .expand((widget) => [widget, const SizedBox(width: 8)])
                  .toList()
                ..removeLast(),
            ),

            const SizedBox(height: 16),

            /// 과세 여부
            Text(
              '과세 여부',
              style: context.body.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children:
                  taxTypes
                      .map(
                        (m) => Expanded(
                          child: GestureDetector(
                            onTap: () => vm.updateTaxType(_taxMap[m]!),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                color: state.taxType == _taxMap[m]
                                    ? AppColors.pointColor
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                m,
                                style: context.body.copyWith(
                                  color: state.taxType == _taxMap[m]
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .expand((widget) => [widget, const SizedBox(width: 8)])
                      .toList()
                    ..removeLast(),
            ),

            const SizedBox(height: 10),

            /// 판매 기간
            Text(
              '판매 기간',
              style: context.body.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children:
                  salePeriodTypes
                      .map(
                        (m) => Expanded(
                          child: GestureDetector(
                            onTap: () => vm.updateSalePeriodType(m),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                color: state.salePeriodType == m
                                    ? AppColors.pointColor
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                m,
                                style: context.body.copyWith(
                                  color: state.salePeriodType == m
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .expand((widget) => [widget, const SizedBox(width: 8)])
                      .toList()
                    ..removeLast(),
            ),

            if (isPeriod) ...[
              const SizedBox(height: 16),

              Row(
                children: [
                  /// 시작일
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '판매 시작일',
                          style: context.body.copyWith(
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),

                        InkWell(
                          onTap: () async {
                            final d = await AppDatePicker.show(
                              context,
                              initialDate: state.saleStartDate.isNotEmpty
                                  ? DateTime.parse(state.saleStartDate)
                                  : DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030),
                            );
                            if (d != null) {
                              vm.updateSaleStartDate(d);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.boxBorderGrey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              state.saleStartDate.isNotEmpty
                                  ? (() {
                                      final date = DateTime.parse(
                                        state.saleStartDate,
                                      );
                                      return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                                    })()
                                  : '날짜 선택',
                              style: context.body.copyWith(
                                color: state.saleStartDate.isNotEmpty
                                    ? null
                                    : AppColors.darkGrey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// 종료일
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '판매 종료일',
                          style: context.body.copyWith(
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),

                        InkWell(
                          onTap: () async {
                            final d = await AppDatePicker.show(
                              context,
                              initialDate: state.saleEndDate.isNotEmpty
                                  ? DateTime.parse(state.saleEndDate)
                                  : DateTime.now().add(
                                      const Duration(days: 30),
                                    ),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030),
                            );

                            if (d != null) {
                              vm.updateSaleEndDate(d);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.boxBorderGrey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              state.saleEndDate.isNotEmpty
                                  ? (() {
                                      final date = DateTime.parse(
                                        state.saleEndDate,
                                      );
                                      return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                                    })()
                                  : '날짜 선택',
                              style: context.body.copyWith(
                                color: state.saleEndDate.isNotEmpty
                                    ? null
                                    : AppColors.darkGrey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
