import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/capacity_unit.dart';
import '../enum/quantity_unit.dart';

part 'product_option.freezed.dart';
part 'product_option.g.dart';

@freezed
abstract class RequestProductOption with _$RequestProductOption {
  @JsonSerializable(explicitToJson: true)
  const factory RequestProductOption({
    @JsonKey(includeIfNull: false) int? id,
    @JsonKey(ignore: true) @Default('개당 중량') String weightOptions,
    @Default(0) int capacity,
    @JsonKey(includeIfNull: false) List<CapacityUnit>? capacityUnitList,
    @JsonKey(fromJson: capacityUnitFromJson, toJson: capacityUnitToJson)
    @Default(CapacityUnit.g)
    CapacityUnit capacityUnit,
    @Default(0) int quantityValue,
    @JsonKey(fromJson: quantityUnitFromJson, toJson: quantityUnitToJson)
    @Default(QuantityUnit.ea)
    QuantityUnit quantityUnit,
    @Default(0) int price,
    @Default(0) int discountAmount,
    @JsonKey(includeToJson: false) @Default(0) int finalPrice,
    @Default(0) int stockQuantity,
  }) = _RequestProductOption;

  factory RequestProductOption.fromJson(Map<String, dynamic> json) =>
      _$RequestProductOptionFromJson(json);
}
