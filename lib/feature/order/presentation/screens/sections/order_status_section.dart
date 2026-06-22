import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_responsive_layout.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../domain/enums/order_status_enum.dart';
import '../../providers/order_management_viewmodel.dart';
import '../models/status_item.dart';

class OrderStatusSection extends ConsumerWidget {
  const OrderStatusSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderManagementViewModelProvider);
    final vm = ref.read(orderManagementViewModelProvider.notifier);

    final items = [
      StatusItem(
        title: '전체',
        countText: '${state.summary!.total}건',
        status: null,
      ),
      StatusItem(
        title: '승인대기',
        countText: '${state.summary!.ordered}건',
        status: OrderStatus.ORDERED,
      ),
      StatusItem(
        title: '주문승인',
        countText: '${state.summary!.confirmed}건',
        status: OrderStatus.CONFIRMED,
      ),
      StatusItem(
        title: '배송중',
        countText: '${state.summary!.shipped}건',
        status: OrderStatus.SHIPPED,
      ),
      StatusItem(
        title: '배송완료',
        countText: '${state.summary!.delivered}건',
        status: OrderStatus.DELIVERED,
      ),
      StatusItem(
        title: '클레임 진행 중',
        countText: '${state.summary!.claimInProgress}건',
        status: OrderStatus.CLAIM_IN_PROGRESS,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = _getCrossAxisCount(context);
        const spacing = 10.0;

        final itemWidth =
            (constraints.maxWidth - ((crossAxisCount - 1) * spacing)) /
            crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: items.map((e) {
            final isSelected = state.selectedStatus == e.status;

            return SizedBox(
              width: itemWidth,
              child: ChoiceChip(
                selected: isSelected,
                onSelected: (_) => vm.selectStatus(e.status),
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
                    AppResponsiveLayout.isMobile(context) ? 10 : 14,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.title,
                        style: context.body.copyWith(
                          color: isSelected ? Colors.white : AppColors.darkGrey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          e.countText,
                          style:
                              (AppResponsiveLayout.isDesktop(context)
                                      ? context.bodyLarge
                                      : context.body)
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : AppColors.pointColor,
                                  ),
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

  int _getCrossAxisCount(BuildContext context) {
    if (AppResponsiveLayout.isDesktop(context)) {
      return 6;
    }

    if (AppResponsiveLayout.isTablet(context)) {
      return 3;
    }

    if (AppResponsiveLayout.isMobile(context)) {
      return 3;
    }

    return 3;
  }
}
