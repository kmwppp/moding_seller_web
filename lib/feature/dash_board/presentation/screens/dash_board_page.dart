import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/constants/app_responsive_layout.dart';
import 'package:moding_president_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_president_web/feature/dash_board/presentation/providers/dash_board_viewmodel.dart';
import 'package:moding_president_web/feature/dash_board/presentation/screens/sections/approval_section.dart';
import 'package:moding_president_web/feature/dash_board/presentation/screens/sections/delivery_process_section.dart';
import 'package:moding_president_web/feature/dash_board/presentation/screens/sections/now_order_section.dart';
import 'package:moding_president_web/feature/dash_board/presentation/screens/sections/shipment_section.dart';
import 'package:moding_president_web/feature/dash_board/presentation/screens/sections/summary_section.dart';
import 'package:moding_president_web/feature/notification/presentation/widgets/notification_bell_button.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_box_styles.dart';
import '../../../../core/theme/app_text_styles.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double sizedBoxHeight = AppResponsiveLayout.isDesktop(context)
        ? 16
        : 12;
    final state = ref.watch(dashBoardViewModelProvider);
    final notifier = ref.read(dashBoardViewModelProvider.notifier);

    return !state.isLoading
        ? SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    AppResponsiveLayout.isDesktop(context) ? 24 : 16,
                    AppResponsiveLayout.isDesktop(context) ? 24 : 16,
                    AppResponsiveLayout.isDesktop(context) ? 24 : 16,
                    AppResponsiveLayout.isDesktop(context) ? 40 : 20,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1600),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _DashboardHeroCard(
                              showBell: AppResponsiveLayout.isDesktop(context),
                            ),
                            SizedBox(height: sizedBoxHeight),
                            SummarySection(),
                            SizedBox(height: sizedBoxHeight),
                            GestureDetector(
                              onTap: () {
                                notifier.openUrl("https://www.naver.com");
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  color: AppColors.partnerBannerColor,
                                  width: double.infinity,
                                  height: 80,
                                  child: Image.asset(
                                    AppResponsiveLayout.isMobile(context)
                                        ? "assets/images/mobile_banner_partner.png"
                                        : "assets/images/web_banner_partner.png",
                                    width: double.infinity,
                                    height: 80,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: sizedBoxHeight),
                            NowOrderSection(),
                            SizedBox(height: sizedBoxHeight),
                            ApprovalSection(),
                            SizedBox(height: sizedBoxHeight),
                            ShipmentSection(),
                            SizedBox(height: sizedBoxHeight),
                            DeliveryProcessSection(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : LoadingIndicator();
  }
}

class _DashboardHeroCard extends StatelessWidget {
  const _DashboardHeroCard({required this.showBell});

  final bool showBell;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: AppBoxStyles.borderBox.copyWith(
        color: const Color(0xFFF8FBF8),
      ),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    '오늘의 운영 현황',
                    style: context.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  AppStrings.dashBoard,
                  style: context.title.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  '주문, 승인, 출고, 배송 진행 현황을 한 화면에서 빠르게 확인할 수 있어요.',
                  style: context.body.copyWith(color: AppColors.darkGrey),
                ),
              ],
            ),
          ),
          if (showBell) ...[
            const SizedBox(width: 16),
            const NotificationBellButton(),
          ],
        ],
      ),
    );
  }
}
