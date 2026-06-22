enum ReasonType { normal, customerFault, afterUse, etc }

extension ReasonTypeExtension on ReasonType {
  String get label {
    switch (this) {
      case ReasonType.normal:
        return "정상 상품입니다.";
      case ReasonType.customerFault:
        return "고객 과실입니다.";
      case ReasonType.afterUse:
        return "사용 후 문제입니다.";
      case ReasonType.etc:
        return "";
    }
  }
}
