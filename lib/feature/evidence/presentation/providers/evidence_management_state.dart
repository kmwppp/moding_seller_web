import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/evidence_models.dart';

part 'evidence_management_state.freezed.dart';

@freezed
abstract class EvidenceManagementState with _$EvidenceManagementState {
  const EvidenceManagementState._();

  const factory EvidenceManagementState({
    required bool isMainLoading,
    required bool isLoading,
    required bool isLoadingMore,
    required bool hasMore,
    required EvidenceFilterType selectedFilterType,
    required DateTime startDate,
    required DateTime endDate,
    required int page,
    required int size,
    required int totalCount,
    required int sellerToBuyerCount,
    required int modingToSellerCount,
    required List<EvidenceCardModel> cards,
  }) = _EvidenceManagementState;

  factory EvidenceManagementState.initial() => EvidenceManagementState(
    isMainLoading: true,
    isLoading: false,
    isLoadingMore: false,
    hasMore: true,
    selectedFilterType: EvidenceFilterType.allDocuments,
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 30)),
    page: 0,
    size: 20,
    totalCount: 0,
    sellerToBuyerCount: 0,
    modingToSellerCount: 0,
    cards: const [],
  );
}
