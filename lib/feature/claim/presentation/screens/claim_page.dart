import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/constants/app_responsive_layout.dart';
import 'package:moding_president_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/settlement/presentation/screens/sections/settlement_period_selector_section.dart';
import 'package:moding_president_web/feature/notification/presentation/widgets/notification_bell_button.dart';
import 'package:moding_president_web/feature/claim/presentation/screens/sections/claim_list_section.dart';
import 'package:moding_president_web/feature/claim/presentation/screens/widgets/claim_widgets.dart';
import '../providers/claim_main/claim_main_viewmodel.dart';

class ClaimPage extends ConsumerStatefulWidget {
  const ClaimPage({super.key});

  @override
  ConsumerState<ClaimPage> createState() => _ClaimPageState();
}

class _ClaimPageState extends ConsumerState<ClaimPage> {
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
      ref.read(claimMainViewModelProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final size = MediaQuery.of(context).size;
    final state = ref.watch(claimMainViewModelProvider);
    final vm = ref.read(claimMainViewModelProvider.notifier);

    final isWide = AppResponsiveLayout.isDesktop(context);

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
                      /// 상단
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "클레임 관리",
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

                      /// 상태 섹션
                      ClaimStatusTopSection(),

                      const SizedBox(height: 12),

                      SettlementPeriodSelectorSection(
                        startDate: state.startDate,
                        endDate: state.endDate,
                        onRangeSelected: vm.updatePeriod,
                      ),

                      const SizedBox(height: 12),

                      /// 리스트
                      if (state.claimList.isNotEmpty)
                        !state.isLoading
                            ? const ClaimListSection()
                            : Padding(
                                padding: EdgeInsets.all(isWide ? 200 : 100),
                                child: const LoadingIndicator(),
                              ),

                      if (state.isLoadingMore)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Center(child: LoadingIndicator()),
                        ),

                      if (state.claimList.isEmpty)
                        const Center(child: Text("등록된 클레임이 없습니다.")),
                    ],
                  ),
                ),
              ),
            ),
          )
        : const LoadingIndicator();
  }
}
