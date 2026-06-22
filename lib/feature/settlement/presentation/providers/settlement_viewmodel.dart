import 'package:moding_president_web/feature/settlement/presentation/providers/settlement_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/settlement_repository_impl.dart';
import '../../domain/entities/settlement_detail_model.dart';
import '../../domain/enums/settlement_tab.dart';
import '../models/settlement_item.dart';

part 'settlement_viewmodel.g.dart';

@Riverpod()
class SettlementViewModel extends _$SettlementViewModel {
  @override
  SettlementState build() {
    Future.microtask(_init);
    return SettlementState.initial();
  }

  void _init() async {
    await getMySettlementSummary();
    await getMySettlementList(
      SettlementTab.pending.serverStatuses,
      isReset: true,
    );
    state = state.copyWith(isMainLoading: false);
  }

  Future<void> changeTab(SettlementTab tab) async {
    state = state.copyWith(
      currentTab: tab,
      page: 0,
      hasMore: true,
      isLoadingMore: false,
    );

    switch (tab) {
      case SettlementTab.pending:
        selectTopStatus(SettlementStatusType.pending);
        break;

      case SettlementTab.hold:
        selectTopStatus(SettlementStatusType.hold);
        break;

      case SettlementTab.completed:
        selectTopStatus(SettlementStatusType.confirmed);
        break;
    }
  }

  void selectTopStatus(SettlementStatusType status) {
    state = state.copyWith(
      isLoading: true,
      isLoadingMore: false,
      hasMore: true,
      page: 0,
      selectedTopStatus: status,
      periodStart: '',
      periodEnd: '',
    );
    getMySettlementList(status.serverStatuses, isReset: true);
  }

  void selectPeriod(DateTime start, DateTime end) {
    final startIso = '${start.toIso8601String().split('.').first}Z';
    final endIso = '${end.toIso8601String().split('.').first}Z';
    state = state.copyWith(
      periodStart: startIso,
      periodEnd: endIso,
      page: 0,
      hasMore: true,
      isLoading: true,
      isLoadingMore: false,
    );
    getMySettlementList(state.selectedTopStatus.serverStatuses, isReset: true);
  }

  void toggleExpanded(int id) {
    bool shouldFetch = false;

    final updatedList = state.settlementList.map((item) {
      if (item.id == id) {
        final newValue = !item.isSelected;

        // 펼쳐질 때(true) + 아직 데이터가 없을 때만 페치 요청
        if (newValue && item.detail == null) {
          shouldFetch = true;
          // 중요: 데이터를 가져오기 시작할 때 detail 객체를 생성하고 로딩 상태를 true로 설정
          return item.copyWith(
            isSelected: newValue,
            detail: const SettlementDetailModel(
              isDetailLoading: true,
              id: 0,
              settlementCode: '',
              orderId: 0,
              status: SettlementStatusType.pending,
            ), // 초기 로딩 상태 부여
          );
        }
        return item.copyWith(isSelected: newValue);
      }
      return item;
    }).toList();

    state = state.copyWith(settlementList: updatedList);

    if (shouldFetch) {
      getMySettlementDetail(id);
    }
  }

  Future<void> getMySettlementSummary() async {
    try {
      final repository = ref.read(settlementRepositoryProvider);
      final summary = await repository.getMySettlementSummary();
      state = state.copyWith(isMainLoading: false, summary: summary);
    } catch (_) {}
  }

  Future<void> getMySettlementList(
    List<String> statuses, {
    required bool isReset,
  }) async {
    if (!isReset &&
        (state.isLoading || state.isLoadingMore || !state.hasMore)) {
      return;
    }

    state = state.copyWith(isLoading: isReset, isLoadingMore: !isReset);

    try {
      final repository = ref.read(settlementRepositoryProvider);
      final result = await repository.getMySettlementList(
        statuses,
        state.periodStart,
        state.periodEnd,
        page: isReset ? 0 : state.page + 1,
      );
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        page: result.page,
        hasMore: result.hasMore,
        settlementList: isReset
            ? result.items
            : [...state.settlementList, ...result.items],
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, isLoadingMore: false);
    }
  }

  Future<void> loadMore() async {
    await getMySettlementList(
      state.selectedTopStatus.serverStatuses,
      isReset: false,
    );
  }

  Future<void> getMySettlementDetail(int settlementId) async {
    try {
      final repository = ref.read(settlementRepositoryProvider);
      final settlementDatail = await repository.getMySettlementDetail(
        settlementId,
      );

      final updatedList = state.settlementList.map((item) {
        if (item.id == settlementId) {
          return item.copyWith(
            detail: settlementDatail.copyWith(isDetailLoading: false),
          );
        }
        return item;
      }).toList();

      state = state.copyWith(settlementList: updatedList);
    } catch (e) {
      // detail fetch failure keeps the row collapsed/loading state unchanged
    }
  }
}
