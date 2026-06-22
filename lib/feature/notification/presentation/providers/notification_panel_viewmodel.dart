import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/feature/notification/data/repositories/notification_repository.dart';
import 'package:moding_president_web/feature/notification/domain/enums/notification_filter.dart';
import 'package:moding_president_web/feature/notification/presentation/providers/notification_badge_viewmodel.dart';
import 'package:moding_president_web/feature/notification/presentation/providers/notification_panel_state.dart';

final notificationPanelViewModelProvider =
    NotifierProvider<NotificationPanelViewModel, NotificationPanelState>(
      NotificationPanelViewModel.new,
    );

class NotificationPanelViewModel extends Notifier<NotificationPanelState> {
  late final NotificationRepository _repository;

  @override
  NotificationPanelState build() {
    _repository = ref.read(notificationRepositoryProvider);
    return NotificationPanelState.initial();
  }

  Future<void> loadAll() async {
    await Future.wait([
      loadByFilter(NotificationFilter.activity, isReset: true),
      loadByFilter(NotificationFilter.notice, isReset: true),
    ]);
  }

  Future<void> loadByFilter(
    NotificationFilter filter, {
    required bool isReset,
  }) async {
    if (!isReset) {
      final isBlocked = filter == NotificationFilter.activity
          ? state.isActivityLoading ||
                state.isActivityLoadingMore ||
                !state.activityHasMore
          : state.isNoticeLoading ||
                state.isNoticeLoadingMore ||
                !state.noticeHasMore;

      if (isBlocked) {
        return;
      }
    }

    if (filter == NotificationFilter.activity) {
      state = state.copyWith(
        isActivityLoading: isReset,
        isActivityLoadingMore: !isReset,
      );
    } else {
      state = state.copyWith(
        isNoticeLoading: isReset,
        isNoticeLoadingMore: !isReset,
      );
    }

    try {
      final result = await _repository.getNotifications(
        filter: filter.code,
        page: filter == NotificationFilter.activity
            ? (isReset ? 0 : state.activityPage + 1)
            : (isReset ? 0 : state.noticePage + 1),
      );

      if (filter == NotificationFilter.activity) {
        state = state.copyWith(
          isActivityLoading: false,
          isActivityLoadingMore: false,
          activityHasMore: result.hasMore,
          activityPage: result.page,
          activityItems: isReset
              ? result.items
              : [...state.activityItems, ...result.items],
        );
      } else {
        state = state.copyWith(
          isNoticeLoading: false,
          isNoticeLoadingMore: false,
          noticeHasMore: result.hasMore,
          noticePage: result.page,
          noticeItems: isReset
              ? result.items
              : [...state.noticeItems, ...result.items],
        );
      }
    } catch (_) {
      if (filter == NotificationFilter.activity) {
        state = state.copyWith(
          isActivityLoading: false,
          isActivityLoadingMore: false,
          activityItems: isReset ? const [] : state.activityItems,
        );
      } else {
        state = state.copyWith(
          isNoticeLoading: false,
          isNoticeLoadingMore: false,
          noticeItems: isReset ? const [] : state.noticeItems,
        );
      }
    }
  }

  Future<void> loadMore(NotificationFilter filter) async {
    await loadByFilter(filter, isReset: false);
  }

  Future<void> markAsRead(int notificationId) async {
    final activityItems = state.activityItems
        .map(
          (item) =>
              item.id == notificationId ? item.copyWith(isRead: true) : item,
        )
        .toList();
    final noticeItems = state.noticeItems
        .map(
          (item) =>
              item.id == notificationId ? item.copyWith(isRead: true) : item,
        )
        .toList();

    state = state.copyWith(
      activityItems: activityItems,
      noticeItems: noticeItems,
    );

    final hasUnreadNotification =
        activityItems.any((item) => !item.isRead) ||
        noticeItems.any((item) => !item.isRead);
    ref
        .read(notificationBadgeViewModelProvider.notifier)
        .setHasUnreadNotification(hasUnreadNotification);

    try {
      await _repository.patchNotificationRead(notificationId);
      await ref.read(notificationBadgeViewModelProvider.notifier).refresh();
    } catch (_) {
      await ref.read(notificationBadgeViewModelProvider.notifier).refresh();
    }
  }

  Future<void> markAllAsRead() async {
    state = state.copyWith(
      activityItems: state.activityItems
          .map((item) => item.copyWith(isRead: true))
          .toList(),
      noticeItems: state.noticeItems
          .map((item) => item.copyWith(isRead: true))
          .toList(),
    );
    ref
        .read(notificationBadgeViewModelProvider.notifier)
        .setHasUnreadNotification(false);

    try {
      await _repository.patchSellerNotificationsReadAll();
      await ref.read(notificationBadgeViewModelProvider.notifier).refresh();
    } catch (_) {
      await ref.read(notificationBadgeViewModelProvider.notifier).refresh();
    }
  }
}
