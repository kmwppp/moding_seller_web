import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

enum ClaimStatus {
  @JsonValue('REQUESTED')
  requested,
  @JsonValue('APPROVED')
  approved,
  @JsonValue('RESHIP_SHIPPED')
  reship,
  @JsonValue('REJECTED')
  rejected,
  @JsonValue('APPEALED')
  appealed,
  @JsonValue('COMPLETED')
  completed,
}

extension ClaimStatusX on ClaimStatus {
  String get label {
    switch (this) {
      case ClaimStatus.requested:
        return '클레임 접수';
      case ClaimStatus.approved:
        return '클레임 승인';
      case ClaimStatus.reship:
        return "재배송 발송";
      case ClaimStatus.rejected:
        return '클레임 거절';
      case ClaimStatus.appealed:
        return '이의 신청';
      case ClaimStatus.completed:
        return '처리 완료';
    }
  }

  String get buttonLabel {
    switch (this) {
      case ClaimStatus.requested:
        return '처리하기';
      case ClaimStatus.approved:
        return '재배송하기';
      case ClaimStatus.rejected:
      case ClaimStatus.completed:
      case ClaimStatus.appealed:
      case ClaimStatus.reship:
        return '확인하기';
    }
  }

  Color get color {
    switch (this) {
      case ClaimStatus.requested:
        return const Color(0xFF6B7280); // gray
      case ClaimStatus.approved:
        return const Color(0xFF2563EB); // blue
      case ClaimStatus.rejected:
        return const Color(0xFFDC2626); // red
      case ClaimStatus.appealed:
        return const Color(0xFFF59E0B); // orange
      case ClaimStatus.completed:
        return const Color(0xFF16A34A); // green
      case ClaimStatus.reship:
        return const Color(0xFF16A34A); // green
    }
  }

  bool get isDone {
    return this == ClaimStatus.completed;
  }

  bool get isRejected {
    return this == ClaimStatus.rejected;
  }
}
