class FindIdState {
  const FindIdState({required this.isLoading, required this.foundLoginId});

  final bool isLoading;
  final String foundLoginId;

  factory FindIdState.initial() {
    return const FindIdState(isLoading: false, foundLoginId: '');
  }

  FindIdState copyWith({bool? isLoading, String? foundLoginId}) {
    return FindIdState(
      isLoading: isLoading ?? this.isLoading,
      foundLoginId: foundLoginId ?? this.foundLoginId,
    );
  }
}
