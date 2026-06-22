import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// 정산 상태
enum SettlementStatusType {
  @JsonValue('PENDING')
  pending('PENDING', '정산대기'),
  @JsonValue('ON_HOLD')
  hold('ON_HOLD', '정산보류'),
  @JsonValue('CONFIRMED')
  confirmed('CONFIRMED', '정산완료'),
  @JsonValue('CANCELLED')
  cancelled('CANCELLED', '정산취소');

  final String code;
  final String label;

  const SettlementStatusType(this.code, this.label);
}

extension SettlementStatusTypeExtension on SettlementStatusType {
  /// UI 라벨
  String get label {
    switch (this) {
      case SettlementStatusType.pending:
        return "정산 예정";
      case SettlementStatusType.hold:
        return "정산 보류";
      case SettlementStatusType.confirmed:
        return "정산 완료";
      case SettlementStatusType.cancelled:
        return "";
    }
  }

  /// 서버 전송용 status
  List<String> get serverStatuses {
    switch (this) {
      case SettlementStatusType.pending:
        return ["PENDING"];
      case SettlementStatusType.hold:
        return ["ON_HOLD"];
      case SettlementStatusType.confirmed:
        return ["CONFIRMED", "CANCELLED"];
      default:
        return [];
    }
  }
}

extension SettlementStatusTypeX on SettlementStatusType {
  Color get color {
    switch (this) {
      case SettlementStatusType.pending:
        return const Color(0xFFFF8C00); // 정산대기 (오렌지)

      case SettlementStatusType.hold:
        return Colors.red; // 정산보류

      case SettlementStatusType.confirmed:
        return const Color(0xFF238B22); // 정산완료 (그린)

      case SettlementStatusType.cancelled:
        return Colors.grey; // 정산취소
    }
  }
}

/// 정산 리스트/상세 UI를 렌더링하기 위한 데이터 모델.
/// (도메인/유즈케이스 로직은 여기 넣지 않고, 화면 표시용 값만 담습니다.)
class SettlementItem {
  const SettlementItem({
    required this.id,
    required this.settlementNumber,
    required this.status,
    required this.finalSettlementAmountText,
    required this.scheduledDateText,
    required this.daysLeftText,
    required this.shippingCompletedDateText,
    required this.deliveryMethodText,
    required this.productAmountText,
    required this.discountAmountText,
    required this.netPaymentAmountText,
    required this.modingFeeText,
    required this.claimDeductionText,
    required this.finalSettlementAmountDetailText,
    this.holdReasonText,
    this.claimPausedMessageText,
  });

  final String id;
  final String settlementNumber;
  final SettlementStatusType status;

  // 리스트 표시
  final String finalSettlementAmountText; // 예: 1,800,000원
  final String scheduledDateText; // 예: 2026.03.30
  final String daysLeftText; // 예: (정산까지 2일 남음)

  // 상세 공통
  final String shippingCompletedDateText; // 예: 2026.03.18
  final String deliveryMethodText; // 예: 택배

  // 상세 - 금액 영역
  final String productAmountText; // 예: 125,000원
  final String discountAmountText; // 예: 0원
  final String netPaymentAmountText; // 예: 125,000원
  final String modingFeeText; // 예: 6,875원
  final String claimDeductionText; // 예: 0원
  final String finalSettlementAmountDetailText; // 예: 118,125원

  // 상세 - 보류 전용
  final String? holdReasonText; // 예: 상품하자 클레임
  final String? claimPausedMessageText; // 예: 클레임 처리중으로 정산이 일시중지 되었습니다.
}

enum PayoutStatusType {
  @JsonValue('REQUESTED')
  requested('REQUESTED', '지급요청'),
  @JsonValue('IN_PROGRESS')
  inProgress('IN_PROGRESS', '처리중'),
  @JsonValue('COMPLETED')
  completed('COMPLETED', '입금완료'),
  @JsonValue('FAILED')
  failed('FAILED', '지급실패'),
  @JsonValue('CANCELED')
  canceled('CANCELED', '지급취소');

  final String code;
  final String label;

  const PayoutStatusType(this.code, this.label);
}
