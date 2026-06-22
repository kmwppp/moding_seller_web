// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RequestProductOption _$RequestProductOptionFromJson(
  Map<String, dynamic> json,
) => _RequestProductOption(
  id: (json['id'] as num?)?.toInt(),
  capacity: (json['capacity'] as num?)?.toInt() ?? 0,
  capacityUnitList: (json['capacityUnitList'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$CapacityUnitEnumMap, e))
      .toList(),
  capacityUnit: json['capacityUnit'] == null
      ? CapacityUnit.g
      : capacityUnitFromJson(json['capacityUnit'] as String),
  quantityValue: (json['quantityValue'] as num?)?.toInt() ?? 0,
  quantityUnit: json['quantityUnit'] == null
      ? QuantityUnit.ea
      : quantityUnitFromJson(json['quantityUnit'] as String),
  price: (json['price'] as num?)?.toInt() ?? 0,
  discountAmount: (json['discountAmount'] as num?)?.toInt() ?? 0,
  finalPrice: (json['finalPrice'] as num?)?.toInt() ?? 0,
  stockQuantity: (json['stockQuantity'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$RequestProductOptionToJson(
  _RequestProductOption instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'capacity': instance.capacity,
  'capacityUnitList': ?instance.capacityUnitList
      ?.map((e) => _$CapacityUnitEnumMap[e]!)
      .toList(),
  'capacityUnit': capacityUnitToJson(instance.capacityUnit),
  'quantityValue': instance.quantityValue,
  'quantityUnit': quantityUnitToJson(instance.quantityUnit),
  'price': instance.price,
  'discountAmount': instance.discountAmount,
  'stockQuantity': instance.stockQuantity,
};

const _$CapacityUnitEnumMap = {
  CapacityUnit.g: 'g',
  CapacityUnit.kg: 'kg',
  CapacityUnit.ml: 'ml',
  CapacityUnit.l: 'l',
};
