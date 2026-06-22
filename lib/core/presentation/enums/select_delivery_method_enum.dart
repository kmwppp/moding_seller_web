enum SelectDeliveryMethodEnum { courier, direct }

extension SelectDeliveryMethodEnumX on SelectDeliveryMethodEnum {
  String get apiValue {
    switch (this) {
      case SelectDeliveryMethodEnum.courier:
        return "COURIER";
      case SelectDeliveryMethodEnum.direct:
        return "DIRECT";
    }
  }
}
