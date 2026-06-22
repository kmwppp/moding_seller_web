import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/constants/app_responsive_layout.dart';
import 'package:moding_president_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/evidence/presentation/providers/evidence_management_viewmodel.dart';
import 'package:moding_president_web/feature/notification/presentation/widgets/notification_bell_button.dart';

import 'sections/evidence_list_section.dart';
import 'sections/evidence_period_selector_section.dart';
import 'sections/evidence_summary_top_section.dart';

class EvidenceManagementPage extends ConsumerWidget {
  const EvidenceManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(evidenceManagementViewModelProvider);
    final vm = ref.read(evidenceManagementViewModelProvider.notifier);

    final isWide = AppResponsiveLayout.isDesktop(context);

    if (state.isMainLoading) {
      return const LoadingIndicator();
    }

    return SafeArea(
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels >=
              notification.metrics.maxScrollExtent - 300) {
            vm.loadMore();
          }
          return false;
        },
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
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
                          "계산서관리",
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

                  EvidenceSummaryTopSection(
                    selectedFilterType: state.selectedFilterType,
                    totalCount: state.totalCount,
                    sellerToBuyerCount: state.sellerToBuyerCount,
                    modingToSellerCount: state.modingToSellerCount,
                    onSelect: vm.selectFilter,
                  ),
                  const SizedBox(height: 12),

                  EvidencePeriodSelectorSection(
                    startDate: state.startDate,
                    endDate: state.endDate,
                    onRangeSelected: vm.updatePeriod,
                  ),

                  const SizedBox(height: 12),

                  EvidenceListSection(
                    isLoading: state.isLoading,
                    isLoadingMore: state.isLoadingMore,
                    cards: state.cards,
                    onPressedTaxInvoiceView: (orderId) async {
                      final url = await vm.getTaxInvoiceUrl(orderId);
                      return url;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
