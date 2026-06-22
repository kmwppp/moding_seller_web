/// 상단 필터 버튼에서 선택되는 문서 타입
enum EvidenceFilterType { allDocuments, sellerToBuyer, modingToSeller }

extension EvidenceFilterTypeX on EvidenceFilterType {
  String get label {
    switch (this) {
      case EvidenceFilterType.allDocuments:
        return '전체';
      case EvidenceFilterType.sellerToBuyer:
        return '거래';
      case EvidenceFilterType.modingToSeller:
        return '수수료';
    }
  }
}

/// 리스트에서 각각의 카드 UI 종류
enum EvidenceCardKind { taxInvoice, feeSettlementInvoice }

/// 화면 표시용 증빙 데이터 모델
class EvidenceCardModel {
  const EvidenceCardModel({
    required this.kind,
    required this.title,
    this.typeLabel,
    this.orderId,
    this.code,
    this.issueDateText,
    this.amountText,
    this.supplyCompany,
    this.customerCompany,
    this.supplyAmountText,
    this.taxAmountText,
    this.feeAmountText,
    this.cardCompany,
    this.approvalNumber,
    this.caption,
  });

  final EvidenceCardKind kind;

  final String title;
  final String? typeLabel;
  final int? orderId;
  final String? code;
  final String? issueDateText;
  final String? amountText;
  final String? supplyCompany;
  final String? customerCompany;
  final String? supplyAmountText;
  final String? taxAmountText;
  final String? feeAmountText;
  final String? cardCompany;
  final String? approvalNumber;
  final String? caption;

  /// 버튼 텍스트 (카드 종류에 따라 UI에서 사용)
  String get buttonTitle {
    switch (kind) {
      case EvidenceCardKind.taxInvoice:
        return '세금계산서 보기';
      case EvidenceCardKind.feeSettlementInvoice:
        return '세금계산서 보기';
    }
  }
}
