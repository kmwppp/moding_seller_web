import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_seller_web/core/utils/app_enum.dart';
import 'package:moding_seller_web/core/utils/string_util.dart';
import 'package:moding_seller_web/feature/notification/presentation/widgets/notification_bell_button.dart';
import 'package:moding_seller_web/feature/settlement/presentation/screens/sections/settlement_calendar_summary_section.dart';
import 'package:moding_seller_web/feature/settlement/presentation/screens/sections/settlement_list_section.dart';
import 'package:moding_seller_web/feature/settlement/presentation/screens/sections/settlement_pending_risk_alert_section.dart';
import 'package:moding_seller_web/feature/settlement/presentation/screens/sections/settlement_period_selector_section.dart';
import 'package:moding_seller_web/feature/settlement/presentation/screens/sections/settlement_top_status_section.dart';

import '../../../../core/constants/app_responsive_layout.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../models/settlement_item.dart';
import '../providers/settlement_viewmodel.dart';

class SettlementManagementPage extends ConsumerStatefulWidget {
  const SettlementManagementPage({super.key});

  @override
  ConsumerState<SettlementManagementPage> createState() =>
      _SettlementManagementPageState();
}

class _SettlementManagementPageState
    extends ConsumerState<SettlementManagementPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }

    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 280) {
      ref.read(settlementViewModelProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final size = MediaQuery.of(context).size;
    final state = ref.watch(settlementViewModelProvider);
    final vm = ref.read(settlementViewModelProvider.notifier);

    final isWide = AppResponsiveLayout.isDesktop(context);

    final onHoldCount = state.summary?.onHoldCount ?? 0;

    return !state.isMainLoading
        ? SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: size.height),
                child: Padding(
                  padding: isWide
                      ? const EdgeInsets.all(24)
                      : const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "정산관리",
                              style: context.title.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (AppResponsiveLayout.isDesktop(context))
                            const Column(
                              children: [
                                NotificationBellButton(),
                                SizedBox(height: 14),
                              ],
                            ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      /// 상단 상태 카드
                      SettlementTopStatusSection(
                        selectedStatus: state.selectedTopStatus,
                        onSelectStatus: vm.selectTopStatus,
                        scheduledTotalText:
                            "${StringUtil.formatCurrency(state.summary?.pendingAmount ?? 0)}원",
                        holdTotalText:
                            "${StringUtil.formatCurrency(state.summary?.onHoldAmount ?? 0)}원",
                        completedTotalText:
                            "${StringUtil.formatCurrency(state.summary?.confirmedAmount ?? 0)}원",
                      ),

                      const SizedBox(height: 12),

                      SettlementCalendarSummarySection(
                        nextSettlementDateText:
                            state.summary?.nextSettledAt.toDateOnly ?? "",
                        nextSettlementCountText:
                            "${state.summary?.nextSettlementCount ?? 0}건",
                        scheduledAmountText:
                            "${StringUtil.formatCurrency(state.summary?.nextSettlementAmount ?? 0)}원",
                      ),

                      const SizedBox(height: 12),

                      if (onHoldCount > 0)
                        SettlementPendingRiskAlertSection(
                          holdCount: state.summary?.onHoldCount ?? 0,
                          holdTotalText:
                              "${StringUtil.formatCurrency(state.summary?.onHoldAmount)}원",
                          onTap: () =>
                              vm.selectTopStatus(SettlementStatusType.hold),
                        ),

                      const SizedBox(height: 12),

                      if (state.selectedTopStatus ==
                          SettlementStatusType.confirmed)
                        SettlementPeriodSelectorSection(
                          startDate: state.periodStart.isNotEmpty
                              ? DateTime.parse(state.periodStart)
                              : null,
                          endDate: state.periodEnd.isNotEmpty
                              ? DateTime.parse(state.periodEnd)
                              : null,
                          onRangeSelected: vm.selectPeriod,
                        ),

                      const SizedBox(height: 12),

                      /// 정산 리스트
                      !state.isLoading
                          ? SettlementListSection()
                          : Padding(
                              padding: EdgeInsets.all(isWide ? 200 : 100),
                              child: LoadingIndicator(),
                            ),
                      if (state.isLoadingMore)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(child: LoadingIndicator()),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : LoadingIndicator();
  }
}
