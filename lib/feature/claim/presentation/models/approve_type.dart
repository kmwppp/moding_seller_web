enum ApproveType { refund, reship }

extension ApproveTypeExtension on ApproveType {
  String get label {
    switch (this) {
      case ApproveType.refund:
        return "환불을 원합니다.";
      case ApproveType.reship:
        return "재배송을 원합니다.";
    }
  }

  String get toServer {
    switch (this) {
      case ApproveType.refund:
        return "REFUND";
      case ApproveType.reship:
        return "RESHIP";
    }
  }
}
