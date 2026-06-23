import 'package:flutter/material.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/product/domain/entities/create_product/product_category_model.dart';

class CategorySelectorSheet extends StatelessWidget {
  const CategorySelectorSheet({
    super.key,
    required this.items,
    required this.selectedItem,
  });

  final List<ProductCategoryModel> items;
  final ProductCategoryModel? selectedItem;

  @override
  Widget build(BuildContext context) {
    final maxSheetHeight = MediaQuery.of(context).size.height * 0.5;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '항목을 선택해주세요.',
              style: context.body.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: maxSheetHeight,
                maxHeight: maxSheetHeight,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: items.length,
                separatorBuilder: (_, _) =>
                    const Divider(height: 1, color: Color(0xFFE8ECF2)),
                itemBuilder: (context, index) {
                  final item = items[index];
                  final isSelected = selectedItem?.id == item.id;

                  return ListTile(
                    onTap: () => Navigator.of(context).pop(item),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    title: Text(
                      item.name,
                      style: context.body.copyWith(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(
                            Icons.check_circle,
                            color: AppColors.primary,
                          )
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
