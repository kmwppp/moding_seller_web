enum CapacityUnit { g, kg, ml, l }

CapacityUnit capacityUnitFromJson(String value) {
  switch (value) {
    case 'G':
      return CapacityUnit.g;
    case 'KG':
      return CapacityUnit.kg;
    case 'ML':
      return CapacityUnit.ml;
    case 'L':
      return CapacityUnit.l;
    default:
      throw ArgumentError('Unknown capacity unit: $value');
  }
}

String capacityUnitToJson(CapacityUnit unit) {
  switch (unit) {
    case CapacityUnit.g:
      return 'G';
    case CapacityUnit.kg:
      return 'KG';
    case CapacityUnit.ml:
      return 'ML';
    case CapacityUnit.l:
      return 'L';
  }
}

extension CapacityUnitLabel on CapacityUnit {
  String get label {
    switch (this) {
      case CapacityUnit.g:
        return 'g';
      case CapacityUnit.kg:
        return 'Kg';
      case CapacityUnit.ml:
        return 'ml';
      case CapacityUnit.l:
        return 'L';
    }
  }
}
