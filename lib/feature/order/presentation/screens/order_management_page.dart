import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/constants/app_responsive_layout.dart';
import 'package:moding_president_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/notification/presentation/widgets/notification_bell_button.dart';
import 'package:moding_president_web/feature/order/presentation/providers/order_management_viewmodel.dart';
import 'package:moding_president_web/feature/order/presentation/screens/sections/order_list_section.dart';
import 'package:moding_president_web/feature/order/presentation/screens/sections/order_status_section.dart';

import '../../../settlement/presentation/screens/sections/settlement_period_selector_section.dart';

class OrderManagementPage extends ConsumerStatefulWidget {
  const OrderManagementPage({super.key});

  @override
  ConsumerState<OrderManagementPage> createState() =>
      _OrderManagementPageState();
}

class _OrderManagementPageState extends ConsumerState<OrderManagementPage> {
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
      ref.read(orderManagementViewModelProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final size = MediaQuery.of(context).size;
    final isWide = AppResponsiveLayout.isDesktop(context);
    final state = ref.watch(orderManagementViewModelProvider);

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
                              "주문관리",
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
                      const OrderStatusSection(),
                      const SizedBox(height: 12),
                      SearchDateProduct(),
                      // 검색 섹션 (product_management_page와 동일 스타일)
                      const SizedBox(height: 12),
                      !state.isLoading
                          ? const OrderListSection()
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

class SearchDateProduct extends ConsumerWidget {
  const SearchDateProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderManagementViewModelProvider);
    final vm = ref.read(orderManagementViewModelProvider.notifier);

    final startDate = state.saleStartDate.isNotEmpty
        ? DateTime.parse(state.saleStartDate)
        : DateTime.now();

    final endDate = state.saleEndDate.isNotEmpty
        ? DateTime.parse(state.saleEndDate)
        : DateTime.now().add(const Duration(days: 30));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettlementPeriodSelectorSection(
          startDate: startDate,
          endDate: endDate,
          onRangeSelected: (start, end) {
            vm.updateSaleStartDate(start);
            vm.updateSaleEndDate(end);
          },
        ),
      ],
    );
  }
}
