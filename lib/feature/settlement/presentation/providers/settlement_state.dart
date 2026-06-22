import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moding_president_web/feature/settlement/domain/entities/settlement_model.dart';
import 'package:moding_president_web/feature/settlement/domain/entities/settlement_summary_model.dart';

import '../../domain/enums/settlement_tab.dart';
import '../models/settlement_item.dart';

part 'settlement_state.freezed.dart';

@freezed
abstract class SettlementState with _$SettlementState {
  const SettlementState._();

  const factory SettlementState({
    required bool isMainLoading,
    required bool isLoading,
    required bool isLoadingMore,
    required bool hasMore,
    required int page,
    required SettlementSummaryModel? summary,
    required SettlementTab currentTab,
    required SettlementStatusType selectedTopStatus,
    required String periodStart,
    required String periodEnd,
    String? expandedSettlementId,
    required List<SettlementModel> settlementList,
  }) = _SettlementState;

  factory SettlementState.initial() => SettlementState(
    isMainLoading: true,
    isLoading: false,
    isLoadingMore: false,
    hasMore: true,
    page: 0,
    summary: null,
    currentTab: SettlementTab.pending,
    selectedTopStatus: SettlementStatusType.pending,
    periodStart: '',
    periodEnd: '',
    expandedSettlementId: null,
    settlementList: [],
  );
}
