import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/utils/string_util.dart';
import 'package:moding_seller_web/feature/product/presentation/providers/product_management/product_management_viewmodel.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/widgets/product_status_confirm.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/presentation/widgets/modal/web_bottom_sheet.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_enum.dart';
import '../../../domain/entities/enum/product_management_enum.dart';

class ProductWebListTile extends ConsumerWidget {
  const ProductWebListTile({
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: _productWebRow(context, ref),
    );
  }

  Widget _productWebRow(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productManagementViewModelProvider);
    final product = state.productList[index];
    final canChangeSaleStatus =
        product.approvalStatus == ProductApprovalStatus.approved;
    return Row(
      children: [
        /// 이미지
        Expanded(
          flex: 2,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.thumbnailImageUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _imageFallback(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),

        /// 상품명
        Expanded(
          flex: 3,
          child: Text(
            state.productList[index].name,
            style: context.bodySmall.copyWith(fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 10),

        /// 상품 번호
        Expanded(
          flex: 3,
          child: Text(
            state.productList[index].productCode,
            style: context.bodySmall,
          ),
        ),
        SizedBox(width: 10),

        /// 카테고리
        Expanded(
          flex: 3,
          child: Text(
            state.productList[index].categoryFullPath,
            style: context.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 10),

        /// 판매가
        Expanded(
          flex: 3,
          child: Text(
            "${StringUtil.formatCurrency(state.productList[index].lowestSellingPrice)}원",
            style: context.bodySmall.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(width: 10),

        /// 재고
        Expanded(
          flex: 2,
          child: Text(
            "${state.productList[index].stockQuantity}개",
            style: context.bodySmall,
          ),
        ),
        SizedBox(width: 10),

        /// 상태
        Expanded(flex: 2, child: _saleStatusBadge(product.status)),
        SizedBox(width: 10),

        /// 승인상태
        Expanded(flex: 2, child: _approvalStatusBadge(product.approvalStatus)),
        SizedBox(width: 10),

        /// 수정일
        Expanded(
          flex: 3,
          child: Text(
            state.productList[index].updatedAt.toDataAndTimeNoLineBreak,
            // yyyy-MM-dd 같은 포맷
            style: context.bodySmall,
          ),
        ),
        SizedBox(width: 10),

        /// 관리 (드롭다운)
        Expanded(
          flex: 3,
          child: DropdownButtonFormField<bool>(
            initialValue:
                state.productList[index].status == ProductStatus.active,
            style: context.bodySmall.copyWith(
              color: canChangeSaleStatus
                  ? AppColors.textColor
                  : AppColors.darkGrey,
            ),
            dropdownColor: Colors.white,
            menuMaxHeight: 200,
            // 메뉴의 최대 높이 제한
            borderRadius: BorderRadius.circular(10),
            // value: product.isSelling,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
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
            ),
            items: [
              DropdownMenuItem(
                value: false,
                child: Text(
                  '판매중지',
                  style: context.bodySmall.copyWith(
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
                  style: context.bodySmall.copyWith(
                    color: canChangeSaleStatus
                        ? AppColors.textColor
                        : AppColors.darkGrey,
                  ),
                ),
              ),
            ],
            onChanged: canChangeSaleStatus
                ? (value) => _handleSaleStatusChanged(context, value)
                : null,
          ),
        ),
      ],
    );
  }

  void _handleSaleStatusChanged(BuildContext context, bool? value) {
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

  Widget _imageFallback() {
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
        size: 20,
      ),
    );
  }

  Widget _approvalStatusBadge(ProductApprovalStatus status) {
    final color = switch (status) {
      ProductApprovalStatus.pending => const Color(0xFF9A6A00),
      ProductApprovalStatus.approved => AppColors.primary,
      ProductApprovalStatus.rejected => AppColors.pointColor,
    };
    final backgroundColor = color.withValues(alpha: 0.1);

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          status.displayName,
          style: AppTextStyles.bodySmall.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _saleStatusBadge(ProductStatus status) {
    final isActive = status == ProductStatus.active;
    final color = isActive ? AppColors.primary : AppColors.darkGrey;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
      ),
    );
  }
}
