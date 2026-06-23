import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/constants/app_responsive_layout.dart';
import 'package:moding_seller_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_seller_web/core/theme/app_box_styles.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/notification/presentation/widgets/notification_bell_button.dart';
import 'package:moding_seller_web/feature/review/presentation/providers/review_management_viewmodel.dart';
import 'package:moding_seller_web/feature/review/presentation/widgets/review_card.dart';
import 'package:moding_seller_web/feature/settlement/presentation/screens/sections/settlement_period_selector_section.dart';

class ReviewManagementPage extends ConsumerStatefulWidget {
  const ReviewManagementPage({super.key});

  @override
  ConsumerState<ReviewManagementPage> createState() =>
      _ReviewManagementPageState();
}

class _ReviewManagementPageState extends ConsumerState<ReviewManagementPage> {
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
      ref.read(reviewManagementViewModelProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final state = ref.watch(reviewManagementViewModelProvider);
    final vm = ref.read(reviewManagementViewModelProvider.notifier);
    final isDesktop = AppResponsiveLayout.isDesktop(context);

    if (state.isMainLoading) {
      return const LoadingIndicator();
    }

    return SafeArea(
      child: SingleChildScrollView(
        controller: _scrollController,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: isDesktop
                ? const EdgeInsets.all(24)
                : const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '리뷰관리',
                            style: context.title.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // const SizedBox(height: 8),
                          // Text(
                          //   '구매자 후기를 한곳에서 확인하고, 필요한 경우 카카오톡으로 삭제 요청을 진행할 수 있어요.',
                          //   style: context.body.copyWith(
                          //     color: AppColors.darkGrey,
                          //     height: 1.5,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    if (isDesktop)
                      const Column(
                        children: [
                          NotificationBellButton(),
                          SizedBox(height: 14),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 18),
                _SummaryCard(
                  totalElements: state.totalElements,
                  isDesktop: isDesktop,
                ),
                const SizedBox(height: 16),
                SettlementPeriodSelectorSection(
                  startDate: state.startDate,
                  endDate: state.endDate,
                  onRangeSelected: vm.updatePeriod,
                ),
                const SizedBox(height: 16),
                if (state.isLoading)
                  Padding(
                    padding: EdgeInsets.all(isDesktop ? 200 : 100),
                    child: const LoadingIndicator(),
                  )
                else if (state.items.isEmpty)
                  const _EmptyReviewState()
                else
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.items.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 14),
                    itemBuilder: (context, index) {
                      return ReviewCard(item: state.items[index]);
                    },
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
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.totalElements, required this.isDesktop});

  final int totalElements;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: AppBoxStyles.borderBox.copyWith(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFFF7FBF7), Color(0xFFFFFFFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.all(isDesktop ? 20 : 16),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 12,
        spacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '최근 등록된 구매자 리뷰',
                style: context.bodySmall.copyWith(color: AppColors.darkGrey),
              ),
              const SizedBox(height: 6),
              Text(
                '총 $totalElements건',
                style: context.bigTitle.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EmptyReviewState extends StatelessWidget {
  const _EmptyReviewState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
      decoration: AppBoxStyles.borderBox.copyWith(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: const BoxDecoration(
              color: Color(0xFFF2F6F2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.rate_review_outlined,
              color: AppColors.primary,
              size: 34,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '아직 등록된 리뷰가 없어요.',
            style: context.title.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '리뷰가 등록되면 이곳에서 상품별 후기를 바로 확인할 수 있어요.',
            textAlign: TextAlign.center,
            style: context.body.copyWith(
              color: AppColors.darkGrey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
