import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/product_management_enum.dart';

part 'my_product_model.freezed.dart';

part 'my_product_model.g.dart';

@freezed
abstract class MyProductModel with _$MyProductModel {
  const factory MyProductModel({
    required int id,

    @Default('') String productCode,
    @Default('') String name,
    @Default('') String categoryFullPath,

    @JsonKey(fromJson: ProductStatusX.from) required ProductStatus status,
    @JsonKey(fromJson: ProductApprovalStatusX.from)
    @Default(ProductApprovalStatus.pending)
    ProductApprovalStatus approvalStatus,

    @Default('') String thumbnailImageUrl,
    @Default(0) int lowestSellingPrice,

    @JsonKey(name: 'lowestPriceStockQuantity') @Default(0) int stockQuantity,

    @JsonKey(fromJson: _fromJsonDate, toJson: _toJsonDate)
    required DateTime updatedAt,
  }) = _MyProductModel;

  factory MyProductModel.fromJson(Map<String, dynamic> json) =>
      _$MyProductModelFromJson(json);
}

DateTime _fromJsonDate(String value) => DateTime.parse(value);

String _toJsonDate(DateTime date) => date.toIso8601String();
