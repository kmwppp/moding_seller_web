import 'package:dio/dio.dart';
import 'package:moding_president_web/core/utils/app_enum.dart';
import 'package:moding_president_web/core/utils/string_util.dart';
import 'package:moding_president_web/feature/evidence/data/repositories/evidence_repository.dart';
import 'package:moding_president_web/feature/evidence/domain/entities/tax_invoice_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/evidence_models.dart';
import 'evidence_management_state.dart';

part 'evidence_management_viewmodel.g.dart';

@Riverpod()
class EvidenceManagementViewModel extends _$EvidenceManagementViewModel {
  late final EvidenceRepository _repository;

  @override
  EvidenceManagementState build() {
    _repository = ref.read(evidenceRepositoryProvider);
    Future.microtask(_init);
    return EvidenceManagementState.initial();
  }

  Future<void> _init() async {
    await Future.wait([
      loadTaxSummary(),
      loadInvoices(isReset: true),
    ]);
    state = state.copyWith(isMainLoading: false);
  }

  Future<void> selectFilter(EvidenceFilterType type) async {
    state = state.copyWith(
      selectedFilterType: type,
      isLoading: true,
      isLoadingMore: false,
      hasMore: true,
      page: 0,
    );
    await loadInvoices(isReset: true);
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
    await loadInvoices(isReset: true);
  }

  Future<void> loadMore() async {
    await loadInvoices(isReset: false);
  }

  Future<void> loadTaxSummary() async {
    try {
      final summary = await _repository.getTaxSummary();
      state = state.copyWith(
        totalCount: summary.total,
        sellerToBuyerCount: summary.sellerToBuyerCount,
        modingToSellerCount: summary.modingToSellerCount,
      );
    } catch (_) {}
  }

  Future<void> loadInvoices({required bool isReset}) async {
    if (!isReset &&
        (state.isLoading || state.isLoadingMore || !state.hasMore)) {
      return;
    }

    state = state.copyWith(isLoading: isReset, isLoadingMore: !isReset);

    try {
      final result = await _repository.getTaxInvoices(
        types: _queryTypes(state.selectedFilterType),
        fromDate: _toStartIso(state.startDate),
        toDate: _toEndIso(state.endDate),
        page: isReset ? 0 : state.page + 1,
        size: state.size,
      );

      final cards = result.content.map(_toCardModel).toList();

      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        hasMore: result.hasMore,
        cards: isReset ? cards : [...state.cards, ...cards],
        page: result.number,
        size: result.size,
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        cards: isReset ? const [] : state.cards,
      );
    }
  }

  Future<String?> getTaxInvoiceUrl(int? orderId) async {
    if (orderId == null) {
      return null;
    }

    try {
      return await _repository.getOrderTaxInvoiceUrl(orderId);
    } on DioException catch (e) {
      throw _extractErrorMessage(e);
    } catch (_) {
      throw '세금계산서를 불러오지 못했습니다.';
    }
  }

  List<String>? _queryTypes(EvidenceFilterType type) {
    switch (type) {
      case EvidenceFilterType.allDocuments:
        return null;
      case EvidenceFilterType.sellerToBuyer:
        return const ['SELLER_TO_BUYER'];
      case EvidenceFilterType.modingToSeller:
        return const ['MODING_TO_SELLER'];
    }
  }

  EvidenceCardModel _toCardModel(TaxInvoiceItem item) {
    final kind = item.invoiceType == 'MODING_TO_SELLER'
        ? EvidenceCardKind.feeSettlementInvoice
        : EvidenceCardKind.taxInvoice;

    return EvidenceCardModel(
      kind: kind,
      title: _invoiceTypeLabel(item.invoiceType),
      typeLabel: _statusLabel(item.status),
      orderId: item.orderId,
      code: item.settlementCode ?? '-',
      issueDateText: item.issuedAt?.toDataAndTimeNoLineBreak ?? '-',
      amountText:
          '${StringUtil.formatCurrency((item.totalAmount ?? 0).toInt())}원',
      supplyCompany: item.supplierName ?? '-',
      customerCompany: item.receiverName ?? '-',
      supplyAmountText:
          '${StringUtil.formatCurrency((item.supplyAmount ?? 0).toInt())}원',
      taxAmountText:
          '${StringUtil.formatCurrency((item.taxAmount ?? 0).toInt())}원',
    );
  }

  String _invoiceTypeLabel(String? value) {
    switch (value) {
      case 'MODING_TO_SELLER':
        return '모딩 수수료 정산 계산서';
      case 'SELLER_TO_BUYER':
      default:
        return '세금계산서';
    }
  }

  String _statusLabel(String? value) {
    switch (value) {
      case 'ISSUED':
        return '발행완료';
      case 'CANCELLED':
        return '발행취소';
      case 'AMENDED':
        return '수정발행';
      default:
        return value ?? '-';
    }
  }

  String _extractErrorMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map && data['message'] != null) {
      return data['message'].toString();
    }
    return '세금계산서를 불러오지 못했습니다.';
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
