enum OrderRejectReasonEnum {
  itemOutOfStock,
  unreachableArea,
  insufficientStock,
  scheduleUnavailable,
  other,
}

extension OrderRejectReasonEnumX on OrderRejectReasonEnum {
  String get apiValue {
    switch (this) {
      case OrderRejectReasonEnum.itemOutOfStock:
        return "ITEM_OUT_OF_STOCK";
      case OrderRejectReasonEnum.unreachableArea:
        return "UNREACHABLE_AREA";
      case OrderRejectReasonEnum.insufficientStock:
        return "INSUFFICIENT_STOCK";
      case OrderRejectReasonEnum.scheduleUnavailable:
        return "SCHEDULE_UNAVAILABLE";
      case OrderRejectReasonEnum.other:
        return "OTHER";
    }
  }

  String get label {
    switch (this) {
      case OrderRejectReasonEnum.itemOutOfStock:
        return "상품품절";
      case OrderRejectReasonEnum.unreachableArea:
        return "배송불가지역";
      case OrderRejectReasonEnum.insufficientStock:
        return "재고부족";
      case OrderRejectReasonEnum.scheduleUnavailable:
        return "배송일정불가";
      case OrderRejectReasonEnum.other:
        return "기타";
    }
  }
}
