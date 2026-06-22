class ReauthState {
  const ReauthState({required this.isSubmitting});

  factory ReauthState.initial() {
    return const ReauthState(isSubmitting: false);
  }

  final bool isSubmitting;

  ReauthState copyWith({bool? isSubmitting}) {
    return ReauthState(isSubmitting: isSubmitting ?? this.isSubmitting);
  }
}
