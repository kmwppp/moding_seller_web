class NotificationBadgeState {
  const NotificationBadgeState({
    required this.hasUnreadNotification,
    required this.isInitialized,
    required this.isLoading,
  });

  factory NotificationBadgeState.initial() {
    return const NotificationBadgeState(
      hasUnreadNotification: false,
      isInitialized: false,
      isLoading: false,
    );
  }

  final bool hasUnreadNotification;
  final bool isInitialized;
  final bool isLoading;

  NotificationBadgeState copyWith({
    bool? hasUnreadNotification,
    bool? isInitialized,
    bool? isLoading,
  }) {
    return NotificationBadgeState(
      hasUnreadNotification:
          hasUnreadNotification ?? this.hasUnreadNotification,
      isInitialized: isInitialized ?? this.isInitialized,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
