import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/feature/order/presentation/providers/order_management_viewmodel.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_responsive_layout.dart';
import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../widgets/order_shipment_row.dart';

class OrderListSection extends ConsumerWidget {
  const OrderListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ShipmentSection과 동일한 구성 (헤더 + Row 위젯 재사용)
    final headerList = const [
      _HeaderItem(title: "주문번호", flex: 2),
      _HeaderItem(title: "날짜", flex: 2),
      _HeaderItem(title: "상품명", flex: 2),
      _HeaderItem(title: "수취인", flex: 2),
      _HeaderItem(title: "전화번호", flex: 2),
      _HeaderItem(title: "주소", flex: 3),
      _HeaderItem(title: "", flex: 2),
    ];

    final state = ref.watch(orderManagementViewModelProvider);
    final list = state.orderList;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = AppResponsiveLayout.isDesktop(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '주문 리스트',
                  style: context.title.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF6EA),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: const Color(0xFFD1E8D1)),
                  ),
                  child: Text(
                    '${list.length}건',
                    style: context.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (state.orderList.isNotEmpty)
              Container(
                decoration: AppBoxStyles.borderBox,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isDesktop)
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
                                children: headerList
                                    .map(
                                      (item) => Expanded(
                                        flex: item.flex,
                                        child: Text(
                                          item.title,
                                          style: context.bodySmall.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.darkGrey,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),

                      ///state.orderList의 item을 넘겨주도록 변경
                      ...list.asMap().entries.map((entry) {
                        final isLast = entry.key == list.length - 1;
                        final item = entry.value;

                        return Container(
                          margin: EdgeInsets.only(bottom: isLast ? 0 : 6),
                          padding: EdgeInsets.symmetric(
                            horizontal: isDesktop ? 6 : 0,
                            vertical: isDesktop ? 6 : 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: isDesktop
                                ? const Color(0xFFFDFEFD)
                                : Colors.transparent,
                          ),
                          child: Column(
                            children: [
                              OrderShipmentRow(item: item),
                              if (!isLast)
                                const Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Divider(height: 1),
                                ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            if (state.orderList.isEmpty)
              Container(
                width: double.infinity,
                decoration: AppBoxStyles.borderBox,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 32,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.inbox_rounded,
                      size: 34,
                      color: AppColors.mediumGrey,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "등록된 주문이 없습니다.",
                      style: context.body.copyWith(
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

class _HeaderItem {
  final String title;
  final int flex;

  const _HeaderItem({required this.title, required this.flex});
}
