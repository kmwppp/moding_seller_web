import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moding_seller_web/feature/claim/domain/entities/claim_model.dart';
import 'package:moding_seller_web/feature/claim/domain/entities/claim_summary_model.dart';

import '../../../domain/enums/claim_enum.dart';

part 'claim_main_state.freezed.dart';

@freezed
abstract class ClaimMainState with _$ClaimMainState {
  const ClaimMainState._();

  const factory ClaimMainState({
    required bool isMainLoading,
    required bool isLoading,
    required bool isLoadingMore,
    required bool hasMore,
    required int page,
    required ClaimSummaryModel? summary,
    required ClaimSearchStatus selectedStatus,
    required int imageCurrentIndex,
    required List<ClaimModel> claimList,
    required DateTime? startDate,
    required DateTime? endDate,
  }) = _ClaimMainState;

  factory ClaimMainState.initial() => ClaimMainState(
    isMainLoading: true,
    isLoading: false,
    isLoadingMore: false,
    hasMore: true,
    page: 0,
    summary: null,
    selectedStatus: ClaimSearchStatus.waiting,
    imageCurrentIndex: 0,
    claimList: [],
    startDate: null,
    endDate: null,
  );
}
