import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moding_seller_web/feature/product/domain/entities/create_product/product_option.dart';

part 'create_product_model.freezed.dart';
part 'create_product_model.g.dart';

@freezed
abstract class CreateProductModel with _$CreateProductModel {
  const factory CreateProductModel({
    @Default('') String name,
    @Default('') String description,
    @Default(0) int categoryId,

    @Default(<RequestProductOption>[]) List<RequestProductOption> options,

    @Default(<String>[]) List<String> deliveryMethods,
    @Default(0) int deliveryDays,
    @Default(0) int shippingLeadTime,
    @Default(null) String? shippingCutoffTime,
    @Default(false) bool isWeekendShipping,
    @JsonKey(includeIfNull: false) List<String>? directDeliveryCodes,

    @Default(0) int shippingFee,
    @Default(false) bool isRemoteAreaUnavailable,
    @Default(0) int remoteAreaShippingFee,
    @Default(false) bool isJejuUnavailable,
    @Default(0) int jejuShippingFee,
    @Default('') String shippingNotice,
    @Default(0) int freeShippingThreshold,

    // @Default(0) int initialShippingFee,
    // @Default(0) int returnShippingFee,
    @Default('') String storageMethod,
    @Default('') String distributionNotice,
    @Default('') String handlingPrecaution,

    @Default(false) bool isTaxable,
    @Default(false) bool isHaccpCertified,
    @Default(false) bool isVariableWeight,

    String? saleStartAt,
    String? saleEndAt,

    @Default('') String sampleProvisionType,
    @Default(0) int samplePrice,
    @Default(0) int sampleShippingFee,
    @JsonKey(includeIfNull: false) List<String>? galleryImages,
    @JsonKey(includeIfNull: false) List<String>? descriptionImages,
  }) = _CreateProductModel;

  factory CreateProductModel.fromJson(Map<String, dynamic> json) =>
      _$CreateProductModelFromJson(json);
}
