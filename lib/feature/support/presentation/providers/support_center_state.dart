import 'package:moding_seller_web/feature/support/domain/entities/support_faq_item.dart';
import 'package:moding_seller_web/feature/support/domain/entities/support_notice_item.dart';
import 'package:moding_seller_web/feature/support/domain/enums/support_faq_category.dart';

class SupportCenterState {
  const SupportCenterState({
    required this.isLoading,
    required this.isLoadingMore,
    required this.hasMore,
    required this.page,
    required this.noticeItems,
    required this.faqItems,
    required this.expandedNoticeIds,
    required this.expandedFaqIds,
    required this.loadingNoticeContentIds,
    required this.loadingFaqContentIds,
    required this.selectedFaqCategory,
  });

  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final int page;
  final List<SupportNoticeItem> noticeItems;
  final List<SupportFaqItem> faqItems;
  final Set<int> expandedNoticeIds;
  final Set<int> expandedFaqIds;
  final Set<int> loadingNoticeContentIds;
  final Set<int> loadingFaqContentIds;
  final SupportFaqCategory selectedFaqCategory;

  factory SupportCenterState.initial() {
    return const SupportCenterState(
      isLoading: true,
      isLoadingMore: false,
      hasMore: true,
      page: 0,
      noticeItems: [],
      faqItems: [],
      expandedNoticeIds: <int>{},
      expandedFaqIds: <int>{},
      loadingNoticeContentIds: <int>{},
      loadingFaqContentIds: <int>{},
      selectedFaqCategory: SupportFaqCategory.all,
    );
  }

  SupportCenterState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    int? page,
    List<SupportNoticeItem>? noticeItems,
    List<SupportFaqItem>? faqItems,
    Set<int>? expandedNoticeIds,
    Set<int>? expandedFaqIds,
    Set<int>? loadingNoticeContentIds,
    Set<int>? loadingFaqContentIds,
    SupportFaqCategory? selectedFaqCategory,
  }) {
    return SupportCenterState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
      noticeItems: noticeItems ?? this.noticeItems,
      faqItems: faqItems ?? this.faqItems,
      expandedNoticeIds: expandedNoticeIds ?? this.expandedNoticeIds,
      expandedFaqIds: expandedFaqIds ?? this.expandedFaqIds,
      loadingNoticeContentIds:
          loadingNoticeContentIds ?? this.loadingNoticeContentIds,
      loadingFaqContentIds: loadingFaqContentIds ?? this.loadingFaqContentIds,
      selectedFaqCategory: selectedFaqCategory ?? this.selectedFaqCategory,
    );
  }
}
