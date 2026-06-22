enum ProductStatus { active, inactive }

extension ProductStatusX on ProductStatus {
  static ProductStatus from(String value) {
    switch (value) {
      case 'ACTIVE':
        return ProductStatus.active;
      case 'INACTIVE':
        return ProductStatus.inactive;
      default:
        return ProductStatus.inactive;
    }
  }

  String get label {
    switch (this) {
      case ProductStatus.active:
        return "ACTIVE";
      case ProductStatus.inactive:
        return "INACTIVE";
    }
  }

  /// UI 표시용
  String get displayName {
    switch (this) {
      case ProductStatus.active:
        return "판매시작";
      case ProductStatus.inactive:
        return "판매중지";
    }
  }
}

enum ProductApprovalStatus { pending, approved, rejected }

extension ProductApprovalStatusX on ProductApprovalStatus {
  static ProductApprovalStatus from(String? value) {
    switch (value) {
      case 'PENDING':
        return ProductApprovalStatus.pending;
      case 'APPROVED':
        return ProductApprovalStatus.approved;
      case 'REJECTED':
        return ProductApprovalStatus.rejected;
      default:
        return ProductApprovalStatus.pending;
    }
  }

  String get label {
    switch (this) {
      case ProductApprovalStatus.pending:
        return 'PENDING';
      case ProductApprovalStatus.approved:
        return 'APPROVED';
      case ProductApprovalStatus.rejected:
        return 'REJECTED';
    }
  }

  String get displayName {
    switch (this) {
      case ProductApprovalStatus.pending:
        return '승인대기';
      case ProductApprovalStatus.approved:
        return '승인';
      case ProductApprovalStatus.rejected:
        return '반려';
    }
  }
}
