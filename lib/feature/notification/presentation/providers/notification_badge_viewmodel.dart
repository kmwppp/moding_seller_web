import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/feature/notification/data/repositories/notification_repository.dart';
import 'package:moding_president_web/feature/notification/presentation/providers/notification_badge_state.dart';

final notificationBadgeViewModelProvider =
    NotifierProvider<NotificationBadgeViewModel, NotificationBadgeState>(
      NotificationBadgeViewModel.new,
    );

class NotificationBadgeViewModel extends Notifier<NotificationBadgeState> {
  late final NotificationRepository _repository;

  @override
  NotificationBadgeState build() {
    _repository = ref.read(notificationRepositoryProvider);
    return NotificationBadgeState.initial();
  }

  Future<void> ensureLoaded() async {
    if (state.isInitialized || state.isLoading) {
      return;
    }

    await refresh();
  }

  Future<void> refresh() async {
    if (state.isLoading) {
      return;
    }

    state = state.copyWith(isLoading: true);

    try {
      final hasUnreadNotification = await _repository
          .getHasUnreadNotificationBadge();
      state = state.copyWith(
        hasUnreadNotification: hasUnreadNotification,
        isInitialized: true,
        isLoading: false,
      );
    } catch (_) {
      state = state.copyWith(isInitialized: true, isLoading: false);
    }
  }

  void setHasUnreadNotification(bool value) {
    state = state.copyWith(hasUnreadNotification: value, isInitialized: true);
  }
}
