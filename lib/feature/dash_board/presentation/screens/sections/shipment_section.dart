import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/dash_board/presentation/providers/dash_board_viewmodel.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_box_styles.dart';
import 'widgets/shipment_row.dart';

final List<HeaderItem> headerList = [
  HeaderItem(title: "주문번호", flex: 2),
  HeaderItem(title: "날짜", flex: 2),
  HeaderItem(title: "수취인", flex: 2),
  HeaderItem(title: "전화번호", flex: 2),
  HeaderItem(title: "주소", flex: 3),
  HeaderItem(title: "", flex: 2),
];

class ShipmentSection extends ConsumerWidget {
  const ShipmentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashBoardViewModelProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: AppBoxStyles.borderBox.copyWith(
                color: const Color(0xFFFCFDFC),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            AppStrings.outgoingWork,
                            style: context.bodyLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF4E8),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: const Color(0xFFFFE2BF)),
                          ),
                          child: Text(
                            '${state.deliveryList.length}건',
                            style: context.bodySmall.copyWith(
                              color: AppColors.pointColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    if (state.deliveryList.isNotEmpty) ...[
                      if (!isMobile)
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFBFCFB),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: headerList.map((HeaderItem item) {
                                  return Expanded(
                                    flex: item.flex,
                                    child: Text(
                                      item.title,
                                      style: context.body.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      Column(
                        children: [
                          for (
                            int i = 0;
                            i < state.deliveryList.length;
                            i++
                          ) ...[
                            ShipmentRow(item: state.deliveryList[i]),
                            if (i != state.deliveryList.length - 1)
                              const Divider(),
                          ],
                        ],
                      ),
                    ] else
                      Center(
                        child: Text(
                          "배송을 준비할 주문이 없습니다.",
                          style: context.body.copyWith(
                            color: AppColors.darkGrey,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class HeaderItem {
  final String title;
  final int flex;

  HeaderItem({required this.title, required this.flex});
}
