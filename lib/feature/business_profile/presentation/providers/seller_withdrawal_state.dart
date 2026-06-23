class SellerWithdrawalState {
  const SellerWithdrawalState({required this.isSubmitting});

  factory SellerWithdrawalState.initial() {
    return const SellerWithdrawalState(isSubmitting: false);
  }

  final bool isSubmitting;

  SellerWithdrawalState copyWith({bool? isSubmitting}) {
    return SellerWithdrawalState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
