enum DeliveryMethod {
  COURIER, // 택배
  DIRECT; // 직배송

  static DeliveryMethod fromString(String value) {
    switch (value) {
      case "COURIER":
        return DeliveryMethod.COURIER;
      case "DIRECT":
        return DeliveryMethod.DIRECT;
      default:
        throw Exception("Unknown DeliveryMethod: $value");
    }
  }
}

extension DeliveryMethodExtension on DeliveryMethod {
  String get label {
    switch (this) {
      case DeliveryMethod.COURIER:
        return "택배 배송";
      case DeliveryMethod.DIRECT:
        return "직접 배송";
    }
  }

  bool get isCourier => this == DeliveryMethod.COURIER;
}

extension DeliveryMethodParser on String {
  DeliveryMethod toDeliveryMethod() {
    return DeliveryMethod.values.firstWhere(
      (e) => e.name == this,
      orElse: () => DeliveryMethod.COURIER,
    );
  }
}
