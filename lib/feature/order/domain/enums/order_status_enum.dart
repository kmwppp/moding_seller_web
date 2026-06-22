enum OrderStatus {
  ORDERED, // 주문 접수
  CONFIRMED, // 주문 확인
  REJECTED, // 주문 거절
  SHIPPED, // 배송 중
  DELIVERED, // 배송 완료
  PURCHASE_CONFIRMED, // 구매 확정
  CLAIM_IN_PROGRESS, // 클레임 진행 중
  SETTLEMENT_COMPLETED, // 정산 완료 (전체 일때만 보임)
  CANCELLED, // 주문 취소
}

extension OrderStatusExtension on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.ORDERED:
        return "주문 접수";
      case OrderStatus.CONFIRMED:
        return "주문 확인";
      case OrderStatus.REJECTED:
        return "주문 거절";
      case OrderStatus.SHIPPED:
        return "배송 중";
      case OrderStatus.DELIVERED:
        return "배송 완료";
      case OrderStatus.PURCHASE_CONFIRMED:
        return "구매 확정";
      case OrderStatus.CLAIM_IN_PROGRESS:
        return "클레임 진행 중";
      case OrderStatus.SETTLEMENT_COMPLETED:
        return "정산 완료";
      case OrderStatus.CANCELLED:
        return "주문 취소";
    }
  }
}

extension OrderStatusParser on String {
  OrderStatus toOrderStatus() {
    return OrderStatus.values.firstWhere(
      (e) => e.name == this,
      orElse: () => OrderStatus.ORDERED,
    );
  }
}
