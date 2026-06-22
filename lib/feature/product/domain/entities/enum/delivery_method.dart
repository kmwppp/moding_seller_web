enum DeliveryMethod { courier, direct }

DeliveryMethod deliveryMethodFromJson(String value) {
  switch (value) {
    case 'COURIER':
      return DeliveryMethod.courier;
    case 'DIRECT':
      return DeliveryMethod.direct;
    default:
      throw ArgumentError('Unknown delivery method: $value');
  }
}

String deliveryMethodToJson(DeliveryMethod method) {
  switch (method) {
    case DeliveryMethod.courier:
      return 'COURIER';
    case DeliveryMethod.direct:
      return 'DIRECT';
  }
}
