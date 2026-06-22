import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/utils/app_enum.dart';
import 'package:moding_president_web/core/utils/string_util.dart';
import 'package:moding_president_web/feature/product/domain/entities/enum/product_management_enum.dart';
import 'package:moding_president_web/feature/product/presentation/providers/product_management/product_management_state.dart';
import 'package:moding_president_web/feature/product/presentation/providers/product_management/product_management_viewmodel.dart';
import 'package:moding_president_web/feature/product/presentation/screens/widgets/product_status_confirm.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/presentation/widgets/modal/web_bottom_sheet.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ProductMobileListTile extends ConsumerWidget {
  const ProductMobileListTile({
    super.key,
    required this.index,
    required this.isWide,
    required this.onTap,
  });

  final int index;
  final bool isWide;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productManagementViewModelProvider);
    final notifier = ref.read(productManagementViewModelProvider.notifier);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.boxBorderGrey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: _productMobileRow(context, index, state, notifier),
      ),
    );
  }

  Widget _productMobileRow(
    BuildContext context,
    int index,
    ProductManagementState state,
    ProductManagementViewModel notifier,
  ) {
    final product = state.productList[index];
    final canChangeSaleStatus =
        product.approvalStatus == ProductApprovalStatus.approved;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "최근 수정일: ${state.productList[index].updatedAt.toDataAndTimeNoLineBreak}",
          style: context.caption.copyWith(color: AppColors.darkGrey),
        ),
        SizedBox(height: 4),
        Text(
          state.productList[index].productCode,
          style: context.body.copyWith(color: AppColors.darkGrey),
        ),
        SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                state.productList[index].thumbnailImageUrl,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _placeholderThumb(context),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.productList[index].name,
                    style: context.body.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    state.productList[index].categoryFullPath,
                    style: context.caption.copyWith(color: AppColors.darkGrey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        "현재 재고: ${state.productList[index].stockQuantity}",
                        style: context.caption.copyWith(
                          color: AppColors.pointColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      Text(
                        "${StringUtil.formatCurrency(state.productList[index].lowestSellingPrice)}원",
                        style: context.body.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Wrap(
                spacing: 8,
                runSpacing: 6,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _saleStatusBadge(state.productList[index].status),
                  _approvalStatusBadge(state.productList[index].approvalStatus),
                ],
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 120,
              child: DropdownButtonFormField<bool>(
                // 1. 메뉴가 펼쳐지는 위치 조절 (Offset)
                initialValue:
                    state.productList[index].status == ProductStatus.active,
                style: context.body.copyWith(
                  color: canChangeSaleStatus
                      ? AppColors.textColor
                      : AppColors.darkGrey,
                ),
                dropdownColor: Colors.white,
                menuMaxHeight: 200,
                // 2. 메뉴의 모서리 둥글게 (BorderRadius)
                borderRadius: BorderRadius.circular(10),
                decoration: InputDecoration(
                  // 기존 데코레이션 유지
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: canChangeSaleStatus
                          ? AppColors.boxBorderGrey
                          : AppColors.lightGrey,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.lightGrey),
                  ),
                  filled: !canChangeSaleStatus,
                  fillColor: AppColors.lightGrey,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    value: false,
                    child: Text(
                      '판매중지',
                      style: context.body.copyWith(
                        color: canChangeSaleStatus
                            ? AppColors.textColor
                            : AppColors.darkGrey,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: true,
                    child: Text(
                      '판매시작',
                      style: context.body.copyWith(
                        color: canChangeSaleStatus
                            ? AppColors.textColor
                            : AppColors.darkGrey,
                      ),
                    ),
                  ),
                ],
                onChanged: canChangeSaleStatus
                    ? (value) => _handleSaleStatusChanged(context, index, value)
                    : null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _handleSaleStatusChanged(BuildContext context, int index, bool? value) {
    if (value == null) return;

    final status = value ? ProductStatus.active : ProductStatus.inactive;

    final nowStatus = value ? "[판매시작]으로" : "[판매중지]로";

    WebBottomSheet.show(
      context: context,
      title: value ? "판매시작" : "판매중지",
      child: ProductStatusConfirm(
        nowStatus: nowStatus,
        index: index,
        status: status,
      ),
    );
  }

  Widget _placeholderThumb(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.inventory_2_outlined,
        color: AppColors.darkGrey,
        size: 24,
      ),
    );
  }

  Widget _approvalStatusBadge(ProductApprovalStatus status) {
    final color = switch (status) {
      ProductApprovalStatus.pending => const Color(0xFF9A6A00),
      ProductApprovalStatus.approved => AppColors.primary,
      ProductApprovalStatus.rejected => AppColors.pointColor,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status.displayName,
        style: AppTextStyles.bodySmall.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _saleStatusBadge(ProductStatus status) {
    final isActive = status == ProductStatus.active;
    final color = isActive ? AppColors.primary : AppColors.darkGrey;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        isActive ? '판매중' : '판매중지',
        style: AppTextStyles.bodySmall.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
