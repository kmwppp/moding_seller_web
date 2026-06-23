import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/product/presentation/providers/product_management/product_management_viewmodel.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_responsive_layout.dart';

class QuickLookItem {
  final ProductManagementStatus status;
  final String value;

  const QuickLookItem({required this.status, required this.value});
}

enum ProductManagementStatus { all, selling, stopped }

extension ProductManagementStatusX on ProductManagementStatus {
  String get label {
    switch (this) {
      case ProductManagementStatus.all:
        return "전체";
      case ProductManagementStatus.selling:
        return "판매중";
      case ProductManagementStatus.stopped:
        return "판매중지";
    }
  }
}

class QuickLookSection extends ConsumerWidget {
  const QuickLookSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productManagementViewModelProvider);
    final vm = ref.read(productManagementViewModelProvider.notifier);

    final items = [
      QuickLookItem(
        status: ProductManagementStatus.all,
        value: "${state.summary!.total}",
      ),
      QuickLookItem(
        status: ProductManagementStatus.selling,
        value: "${state.summary!.active}",
      ),
      QuickLookItem(
        status: ProductManagementStatus.stopped,
        value: "${state.summary!.inactive}",
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        const crossAxisCount = 3;
        const spacing = 10.0;

        final itemWidth =
            (constraints.maxWidth - ((crossAxisCount - 1) * spacing)) /
            crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: items.map((e) {
            final isSelected = state.selectedStatus == e.status.label;

            return SizedBox(
              width: itemWidth,
              child: ChoiceChip(
                selected: isSelected,
                onSelected: (bool selected) async {
                  await vm.selectSearchStatus(e.status.label);
                },
                showCheckmark: false,
                selectedColor: AppColors.primary,
                backgroundColor: Colors.white,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: AppColors.boxBorderGrey),
                ),
                label: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(
                    AppResponsiveLayout.isDesktop(context) ? 10 : 6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${e.status.label} :",
                        style: context.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : AppColors.darkGrey,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        e.value,
                        style: context.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? Colors.white
                              : AppColors.pointColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
