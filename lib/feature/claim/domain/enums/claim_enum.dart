enum ClaimType { QUANTITY, CONDITION }

extension ClaimTypeExtension on ClaimType {
  String get label {
    switch (this) {
      case ClaimType.QUANTITY:
        return "상품이 누락되었어요.";
      case ClaimType.CONDITION:
        return "상품에 문제가 있어요.";
    }
  }

  String get titleLabel {
    switch (this) {
      case ClaimType.QUANTITY:
        return "상품 누락";
      case ClaimType.CONDITION:
        return "상품 문제";
    }
  }
}

enum ClaimSearchStatus { waiting, processing, completed }

extension ClaimSearchStatusExtension on ClaimSearchStatus {
  String get label {
    switch (this) {
      case ClaimSearchStatus.waiting:
        return '대기';
      case ClaimSearchStatus.processing:
        return '처리중';
      case ClaimSearchStatus.completed:
        return '완료';
    }
  }

  /// 서버로 보낼 status 리스트
  List<String> get requestStatuses {
    switch (this) {
      case ClaimSearchStatus.waiting:
        return ["REQUESTED"];
      case ClaimSearchStatus.processing:
        return ["APPROVED", "APPEALED", "RESHIP_SHIPPED"];
      case ClaimSearchStatus.completed:
        return ["COMPLETED", "REJECTED"];
    }
  }
}
