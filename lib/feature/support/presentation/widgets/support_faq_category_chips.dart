import 'package:flutter/material.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/support/domain/enums/support_faq_category.dart';

class SupportFaqCategoryChips extends StatelessWidget {
  const SupportFaqCategoryChips({
    super.key,
    required this.selectedCategory,
    required this.onSelected,
  });

  final SupportFaqCategory selectedCategory;
  final ValueChanged<SupportFaqCategory> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: SupportFaqCategory.values.map((category) {
          final isSelected = category == selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(
                category.label,
                style: context.bodySmall.copyWith(
                  color: isSelected ? Colors.white : AppColors.textColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              selected: isSelected,
              backgroundColor: Colors.white,
              selectedColor: AppColors.primary,
              side: BorderSide(
                color: isSelected ? AppColors.primary : const Color(0xFFD9E2D9),
              ),
              onSelected: (_) => onSelected(category),
            ),
          );
        }).toList(),
      ),
    );
  }
}
