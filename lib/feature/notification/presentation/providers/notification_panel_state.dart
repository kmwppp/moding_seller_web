import 'package:moding_president_web/feature/notification/domain/entities/notification_item.dart';

class NotificationPanelState {
  const NotificationPanelState({
    required this.isActivityLoading,
    required this.isActivityLoadingMore,
    required this.activityHasMore,
    required this.activityPage,
    required this.isNoticeLoading,
    required this.isNoticeLoadingMore,
    required this.noticeHasMore,
    required this.noticePage,
    required this.activityItems,
    required this.noticeItems,
  });

  factory NotificationPanelState.initial() {
    return const NotificationPanelState(
      isActivityLoading: false,
      isActivityLoadingMore: false,
      activityHasMore: true,
      activityPage: 0,
      isNoticeLoading: false,
      isNoticeLoadingMore: false,
      noticeHasMore: true,
      noticePage: 0,
      activityItems: [],
      noticeItems: [],
    );
  }

  final bool isActivityLoading;
  final bool isActivityLoadingMore;
  final bool activityHasMore;
  final int activityPage;
  final bool isNoticeLoading;
  final bool isNoticeLoadingMore;
  final bool noticeHasMore;
  final int noticePage;
  final List<NotificationItem> activityItems;
  final List<NotificationItem> noticeItems;

  NotificationPanelState copyWith({
    bool? isActivityLoading,
    bool? isActivityLoadingMore,
    bool? activityHasMore,
    int? activityPage,
    bool? isNoticeLoading,
    bool? isNoticeLoadingMore,
    bool? noticeHasMore,
    int? noticePage,
    List<NotificationItem>? activityItems,
    List<NotificationItem>? noticeItems,
  }) {
    return NotificationPanelState(
      isActivityLoading: isActivityLoading ?? this.isActivityLoading,
      isActivityLoadingMore:
          isActivityLoadingMore ?? this.isActivityLoadingMore,
      activityHasMore: activityHasMore ?? this.activityHasMore,
      activityPage: activityPage ?? this.activityPage,
      isNoticeLoading: isNoticeLoading ?? this.isNoticeLoading,
      isNoticeLoadingMore: isNoticeLoadingMore ?? this.isNoticeLoadingMore,
      noticeHasMore: noticeHasMore ?? this.noticeHasMore,
      noticePage: noticePage ?? this.noticePage,
      activityItems: activityItems ?? this.activityItems,
      noticeItems: noticeItems ?? this.noticeItems,
    );
  }
}
