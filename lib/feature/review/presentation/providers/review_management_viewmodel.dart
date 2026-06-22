import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/feature/review/data/repositories/review_repository.dart';
import 'package:moding_president_web/feature/review/presentation/providers/review_management_state.dart';

final reviewManagementViewModelProvider =
    NotifierProvider<ReviewManagementViewModel, ReviewManagementState>(
      ReviewManagementViewModel.new,
    );

class ReviewManagementViewModel extends Notifier<ReviewManagementState> {
  late final ReviewRepository _repository;

  @override
  ReviewManagementState build() {
    _repository = ref.read(reviewRepositoryProvider);
    Future.microtask(_init);
    return ReviewManagementState.initial();
  }

  Future<void> _init() async {
    await loadReviews(isReset: true);
    state = state.copyWith(isMainLoading: false);
  }

  Future<void> loadReviews({required bool isReset}) async {
    if (!isReset &&
        (state.isLoading || state.isLoadingMore || !state.hasMore)) {
      return;
    }

    state = state.copyWith(isLoading: isReset, isLoadingMore: !isReset);

    try {
      final result = await _repository.getReviews(
        fromDate: _toStartIso(state.startDate),
        toDate: _toEndIso(state.endDate),
        page: isReset ? 0 : state.page + 1,
        size: state.size,
      );

      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        hasMore: result.number + 1 < result.totalPages,
        items: isReset ? result.content : [...state.items, ...result.content],
        totalElements: result.totalElements,
        page: result.number,
        size: result.size,
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        items: isReset ? const [] : state.items,
        totalElements: isReset ? 0 : state.totalElements,
      );
    }
  }

  Future<void> updatePeriod(DateTime start, DateTime end) async {
    state = state.copyWith(
      startDate: start,
      endDate: end,
      page: 0,
      hasMore: true,
      isLoading: true,
      isLoadingMore: false,
    );
    await loadReviews(isReset: true);
  }

  Future<void> loadMore() async {
    await loadReviews(isReset: false);
  }

  String? _toStartIso(DateTime? date) {
    if (date == null) {
      return null;
    }

    final normalized = DateTime(date.year, date.month, date.day);
    return '${normalized.toIso8601String().split('.').first}Z';
  }

  String? _toEndIso(DateTime? date) {
    if (date == null) {
      return null;
    }

    final normalized = DateTime(date.year, date.month, date.day, 23, 59, 59);
    return '${normalized.toIso8601String().split('.').first}Z';
  }
}
