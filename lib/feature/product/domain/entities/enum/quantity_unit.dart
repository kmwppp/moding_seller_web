enum QuantityUnit { ea, box }

QuantityUnit quantityUnitFromJson(String value) {
  switch (value) {
    case 'EA':
      return QuantityUnit.ea;
    case 'BOX':
      return QuantityUnit.box;
    default:
      throw ArgumentError('Unknown quantity unit: $value');
  }
}

String quantityUnitToJson(QuantityUnit unit) {
  switch (unit) {
    case QuantityUnit.ea:
      return 'EA';
    case QuantityUnit.box:
      return 'BOX';
  }
}

extension QuantityUnitLabel on QuantityUnit {
  String get label {
    switch (this) {
      case QuantityUnit.ea:
        return '개';
      case QuantityUnit.box:
        return '박스';
    }
  }
}
