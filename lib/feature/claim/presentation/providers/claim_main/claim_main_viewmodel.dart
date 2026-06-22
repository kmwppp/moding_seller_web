import 'package:moding_president_web/feature/claim/data/repositories/claim_repository_impl.dart';
import 'package:moding_president_web/feature/claim/domain/enums/claim_enum.dart';
import 'package:moding_president_web/feature/claim/presentation/providers/claim_main/claim_main_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'claim_main_viewmodel.g.dart';

@Riverpod()
class ClaimMainViewModel extends _$ClaimMainViewModel {
  @override
  ClaimMainState build() {
    Future.microtask(_init);
    return ClaimMainState.initial();
  }

  /// 최초 진입
  Future<void> _init() async {
    await Future.wait([
      getMyClaimSummary(),
      getMyClaimList(ClaimSearchStatus.waiting.requestStatuses, isReset: true),
    ]);

    if (!ref.mounted) {
      return;
    }

    state = state.copyWith(isMainLoading: false);
  }

  /// 상태 변경 + 리스트 조회
  Future<void> selectStatus(ClaimSearchStatus status) async {
    state = state.copyWith(
      selectedStatus: status,
      isLoading: true,
      isLoadingMore: false,
      hasMore: true,
      page: 0,
    );

    await getMyClaimList(status.requestStatuses, isReset: true);

    if (!ref.mounted) {
      return;
    }

    state = state.copyWith(isLoading: false);
  }

  /// waiting 상태로 리셋
  Future<void> resetToWaiting(ClaimSearchStatus searchStatus) async {
    state = state.copyWith(
      selectedStatus: searchStatus,
      isLoading: true,
      isLoadingMore: false,
      hasMore: true,
      page: 0,
      startDate: null,
      endDate: null,
    );

    await Future.wait([
      getMyClaimSummary(),
      getMyClaimList(searchStatus.requestStatuses, isReset: true),
    ]);

    if (!ref.mounted) {
      return;
    }

    state = state.copyWith(isLoading: false);
  }

  /// 클레임 리스트 조회
  Future<void> getMyClaimList(
    List<String> status, {
    required bool isReset,
  }) async {
    if (!isReset &&
        (state.isLoading || state.isLoadingMore || !state.hasMore)) {
      return;
    }

    state = state.copyWith(isLoading: isReset, isLoadingMore: !isReset);

    try {
      final repository = ref.read(claimRepositoryProvider);
      final result = await repository.getMyClaimList(
        status,
        fromDate: _toStartIso(state.startDate),
        toDate: _toEndIso(state.endDate),
        page: isReset ? 0 : state.page + 1,
      );

      if (!ref.mounted) {
        return;
      }

      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        page: result.page,
        hasMore: result.hasMore,
        claimList: isReset
            ? result.items
            : [...state.claimList, ...result.items],
      );
    } catch (_) {
      if (!ref.mounted) {
        return;
      }

      state = state.copyWith(isLoading: false, isLoadingMore: false);
    }
  }

  /// 클레임 요약 조회
  Future<void> getMyClaimSummary() async {
    try {
      final repository = ref.read(claimRepositoryProvider);
      final summary = await repository.getMyClaimSummary();

      if (!ref.mounted) {
        return;
      }

      state = state.copyWith(summary: summary);
    } catch (_) {}
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

    await getMyClaimList(state.selectedStatus.requestStatuses, isReset: true);
  }

  Future<void> loadMore() async {
    await getMyClaimList(state.selectedStatus.requestStatuses, isReset: false);
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
