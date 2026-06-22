enum SettlementTab { pending, hold, completed }

extension SettlementTabExtension on SettlementTab {
  /// UI 라벨
  String get label {
    switch (this) {
      case SettlementTab.pending:
        return "정산 예정";
      case SettlementTab.hold:
        return "정산 보류";
      case SettlementTab.completed:
        return "정산 완료";
    }
  }

  /// 서버 전송용 status
  List<String> get serverStatuses {
    switch (this) {
      case SettlementTab.pending:
        return ["PENDING"];
      case SettlementTab.hold:
        return ["ON_HOLD"];
      case SettlementTab.completed:
        return ["CONFIRMED", "CANCELLED"];
    }
  }
}
