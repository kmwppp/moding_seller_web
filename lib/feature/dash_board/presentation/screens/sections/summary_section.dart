import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/dash_board/presentation/providers/dash_board_viewmodel.dart';
import 'package:moding_seller_web/feature/main/presentation/main_page.dart';
import 'package:moding_seller_web/feature/main/presentation/providers/main_viewmodel.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_responsive_layout.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/utils/string_util.dart';
import '../../../../settlement/domain/enums/settlement_tab.dart';
import '../../../../settlement/presentation/providers/settlement_viewmodel.dart';
import '../models/summary_item.dart';

class SummarySection extends ConsumerWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashBoardViewModelProvider);

    final items = [
      SummaryItem(
        title: AppStrings.sales,
        value:
            "${StringUtil.formatCurrency(state.dashboardInfo?.data.operationStats.thisMonthSales)}원",
        menu: MainMenu.settlement,
      ),

      /// 정산 완료 → completed 탭
      SummaryItem(
        title: AppStrings.settlementCompleted,
        value:
            "${StringUtil.formatCurrency(state.dashboardInfo?.data.operationStats.confirmedSettlementAmount)}원",
        menu: MainMenu.settlement,
        tab: SettlementTab.completed,
      ),

      /// 정산 예정 → expected 탭
      SummaryItem(
        title: AppStrings.settlementScheduled,
        value:
            "${StringUtil.formatCurrency(state.dashboardInfo?.data.operationStats.scheduledSettlementAmount)}원",
        menu: MainMenu.settlement,
        tab: SettlementTab.pending,
      ),

      SummaryItem(
        title: AppStrings.waitingForShipment,
        value: '${state.dashboardInfo?.data.operationStats.readyToShipCount}건',
        menu: MainMenu.order,
      ),
    ];

    final mainNotifier = ref.read(mainViewModelProvider.notifier);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompactWidth = constraints.maxWidth < 600;
        final spacing = 10.0;

        return Container(
          width: double.infinity,
          decoration: AppBoxStyles.borderBox.copyWith(
            color: const Color(0xFFFCFDFC),
          ),
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '운영 요약',
                      style: context.bodyLarge.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF7EF),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      '핵심 지표',
                      style: context.bodySmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              if (isCompactWidth)
                LayoutBuilder(
                  builder: (context, mobileConstraints) {
                    final tileWidth =
                        (mobileConstraints.maxWidth - spacing) / 2;
                    return Wrap(
                      spacing: spacing,
                      runSpacing: spacing,
                      children: items.map((e) {
                        return SizedBox(
                          width: tileWidth,
                          child: _SummaryTile(
                            title: e.title,
                            value: e.value,
                            compact: true,
                            onTap: () async {
                              if (e.tab != null) {
                                await ref
                                    .read(settlementViewModelProvider.notifier)
                                    .changeTab(e.tab!);
                              }

                              mainNotifier.selectMenu(e.menu);
                            },
                          ),
                        );
                      }).toList(),
                    );
                  },
                )
              else
                Row(
                  children: items.asMap().entries.map((entry) {
                    final e = entry.value;
                    final isLast = entry.key == items.length - 1;

                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: isLast ? 0 : spacing),
                        child: _SummaryTile(
                          title: e.title,
                          value: e.value,
                          compact: false,
                          onTap: () async {
                            if (e.tab != null) {
                              await ref
                                  .read(settlementViewModelProvider.notifier)
                                  .changeTab(e.tab!);
                            }

                            mainNotifier.selectMenu(e.menu);
                          },
                        ),
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        );
      },
    );
  }

  double getChildAspectRatio(BuildContext context) {
    if (AppResponsiveLayout.isDesktop(context)) {
      if (AppResponsiveLayout.isDesktopDashBoardExcept(context)) {
        return 2.4;
      } else {
        return 3.6;
      }
    } else if (AppResponsiveLayout.isTablet(context)) {
      return 3.6;
    } else {
      // 모바일 환경
      return 2.2;
    }
  }
}

class _SummaryTile extends StatelessWidget {
  const _SummaryTile({
    required this.title,
    required this.value,
    required this.onTap,
    required this.compact,
  });

  final String title;
  final String value;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(compact ? 12 : 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5ECE5)),
        ),
        child: compact
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.bodySmall.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        value,
                        textAlign: TextAlign.right,
                        style: context.body.copyWith(
                          color: AppColors.pointColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: context.body.copyWith(color: AppColors.darkGrey),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        value,
                        textAlign: TextAlign.right,
                        style: context.bodyLarge.copyWith(
                          color: AppColors.pointColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
