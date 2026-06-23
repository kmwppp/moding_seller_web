import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moding_seller_web/feature/product/domain/entities/direct_delivery_district.dart';

import '../create_product/product_option.dart';

part 'my_product_detail_model.freezed.dart';
part 'my_product_detail_model.g.dart';

@freezed
abstract class MyProductDetailModel with _$MyProductDetailModel {
  const factory MyProductDetailModel({
    @Default(0) int id,
    // 상품명
    @Default('') String name,

    // 상품 설명
    @Default('') String description,

    // 대분류 카테고리 아이디
    @Default(0) int parentCategoryId,
    // 소분류 카테고리 아이디
    @Default(0) int categoryId,

    @Default('') String thumbnailImageUrl,
    @Default('') String foodLabelImageUrl,
    @JsonKey(name: 'galleryImageUrls', fromJson: _imageUrlsFromJson)
    @Default(<String>[])
    List<String> galleryImages,
    @JsonKey(name: 'descriptionImageUrls', fromJson: _imageUrlsFromJson)
    @Default(<String>[])
    List<String> descriptionImages,

    // 옵션
    @Default(<RequestProductOption>[]) List<RequestProductOption> options,

    // 배송 방식
    @Default(<String>[]) List<String> deliveryMethods,

    // 배송기간
    @JsonKey(fromJson: _intFromJson) @Default(0) int deliveryDays,

    // 당일 출고 가능 여부
    @Default(false) bool isSameDayShipping,

    // 배송 소요 시간
    @JsonKey(fromJson: _intFromJson) @Default(0) int shippingLeadTime,

    // 배송 마감 시간
    @JsonKey(fromJson: _nullableStringFromJson) String? shippingCutoffTime,
    @Default(false) bool isWeekendShipping,
    @JsonKey(
      fromJson: _directDeliveryDistrictsFromJson,
      toJson: _directDeliveryDistrictsToJson,
    )
    @Default(<DirectDeliveryDistrict>[])
    List<DirectDeliveryDistrict> directDeliveryDistricts,
    @Default(false) bool isVariableWeight,

    // 배송비
    @JsonKey(fromJson: _intFromJson) @Default(0) int shippingFee,
    // 도서산간 배송 불가능 여부
    @Default(false) bool isRemoteAreaUnavailable,

    // 도서산간 배송비
    @JsonKey(fromJson: _intFromJson) @Default(0) int remoteAreaShippingFee,

    // 제주도 배송 불가능 여부
    @Default(false) bool isJejuUnavailable,

    // 제주도 배송비
    @JsonKey(fromJson: _intFromJson) @Default(0) int jejuShippingFee,

    // 무료배송 기준
    @JsonKey(fromJson: _intFromJson) @Default(0) int freeShippingThreshold,

    // 배송 안내
    @JsonKey(fromJson: _stringFromJson) @Default('') String shippingNotice,

    // 보관방법
    @JsonKey(fromJson: _stringFromJson) @Default('') String storageMethod,

    // 유통 안내
    @JsonKey(fromJson: _stringFromJson) @Default('') String distributionNotice,

    // 취급주의
    @JsonKey(fromJson: _stringFromJson) @Default('') String handlingPrecaution,

    // 과세 여부
    @JsonKey(name: 'isTaxable') @Default(false) bool isTaxable,
    @Default(false) bool isHaccpCertified,

    // 판매 시작
    @JsonKey(fromJson: _nullableStringFromJson) String? saleStartAt,

    // 판매 종료
    @JsonKey(fromJson: _nullableStringFromJson) String? saleEndAt,
  }) = _MyProductDetailModel;

  factory MyProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MyProductDetailModelFromJson(json);
}

int _intFromJson(dynamic value) {
  if (value == null) return 0;
  return value as int;
}

String _stringFromJson(dynamic value) {
  if (value == null) return '';
  return value as String;
}

String? _nullableStringFromJson(dynamic value) {
  if (value == null) return null;
  final text = value.toString();
  return text.isEmpty ? null : text;
}

List<String> _imageUrlsFromJson(dynamic value) {
  if (value is! List) {
    return const <String>[];
  }

  return value
      .map(_extractImageUrl)
      .whereType<String>()
      .where((url) => url.trim().isNotEmpty)
      .toList();
}

String? _extractImageUrl(dynamic item) {
  if (item is String) {
    return item.trim();
  }

  if (item is Map) {
    final map = Map<String, dynamic>.from(item);
    final candidates = [
      map['imageUrl'],
      map['photoUrl'],
      map['url'],
      map['fileUrl'],
    ];

    for (final candidate in candidates) {
      if (candidate is String && candidate.trim().isNotEmpty) {
        return candidate.trim();
      }
    }
  }

  return null;
}

List<DirectDeliveryDistrict> _directDeliveryDistrictsFromJson(dynamic value) {
  if (value is! List) {
    return const <DirectDeliveryDistrict>[];
  }

  return value
      .whereType<Map>()
      .map(
        (item) => DirectDeliveryDistrict.fromJson(
          Map<String, dynamic>.from(item),
        ),
      )
      .toList();
}

List<Map<String, dynamic>> _directDeliveryDistrictsToJson(
  List<DirectDeliveryDistrict> value,
) {
  return value
      .map(
        (item) => <String, dynamic>{
          'code': item.code,
          'province': item.province,
          'name': item.name,
        },
      )
      .toList();
}
