import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image_model.freezed.dart';
part 'product_image_model.g.dart';

@freezed
abstract class ProductImageModel with _$ProductImageModel {
  const factory ProductImageModel({
    @Default(0) int id,
    @Default('') String imageUrl,
    @Default(0) int sortOrder,
    @Default('') String imageType,
  }) = _ProductImageModel;

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      _$ProductImageModelFromJson(json);
}
