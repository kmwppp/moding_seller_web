import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:moding_seller_web/core/network/dio_client.dart';
import 'package:moding_seller_web/feature/product/domain/entities/enum/product_management_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_http_urls.dart';
import '../../domain/entities/create_product/create_product_model.dart';

part 'product_remote_data_source.g.dart';

@riverpod
ProductRemoteDataSource productRemoteDataSource(Ref ref) {
  return ProductRemoteDataSource(ref.watch(dioProvider));
}

class ProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSource(this._dio);

  /// ----------------------------------------
  /// 내 상품 상태별 건수 부분
  /// ----------------------------------------
  Future<Map<String, dynamic>> getMyProductSummary() async {
    final response = await _dio.get(AppHttpUrls.getMyProductSummary);
    return response.data;
  }

  /// ----------------------------------------
  /// 내 상품 조회 부분
  /// ----------------------------------------
  // 내 상품 리스트 조회
  Future<Map<String, dynamic>> getMyProductList(
    String status, {
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dio.get(
      AppHttpUrls.getMyProductList(status, page: page, size: size),
    );
    return response.data;
  }

  // 내 상품 리스트 상세 조회
  Future<Map<String, dynamic>> getMyProductDetail(String productId) async {
    final response = await _dio.get(AppHttpUrls.getMyProductDetail(productId));
    return response.data;
  }

  /// ----------------------------------------
  /// 내 상품 상태 변경 부분
  /// ----------------------------------------
  Future<Map<String, dynamic>> setMyProductStatus(
    String productId,
    ProductStatus status,
  ) async {
    final response = await _dio.patch(
      AppHttpUrls.setMyProductStatus(productId),
      data: {"status": status.label.toUpperCase()},
    );
    return response.data;
  }

  /// ----------------------------------------
  /// 상품 등록 부분
  /// ----------------------------------------
  // 대분류 카테고리 GET
  Future<Map<String, dynamic>> getMajorCategory() async {
    final response = await _dio.get(AppHttpUrls.getProductMajorCategory);
    return response.data;
  }

  // 소분류 카테고리 GET
  Future<Map<String, dynamic>> getSubCategory(int id) async {
    final response = await _dio.get(AppHttpUrls.getProductSubCategory(id));
    return response.data;
  }

  Future<Map<String, dynamic>> getDeliveryDistricts() async {
    final response = await _dio.get(AppHttpUrls.getDeliveryDistricts);
    return response.data;
  }

  // 상품 등록 POST
  Future<Map<String, dynamic>> executeCreateProduct({
    required CreateProductModel request,
    required Uint8List thumbnail,
    required List<dynamic> galleryImages,
    required List<dynamic> descriptionImages,
    required Uint8List foodLabel,
  }) async {
    final map = request.toJson();
    print(" options JSON 확인:");
    print(jsonEncode(request.options.map((e) => e.toJson()).toList()));

    final formData = FormData();

    /// 1. 일반 필드
    map.forEach((key, value) {
      if (value == null) return;

      /// options 제외 (중복 방지)
      if (key == 'options') return;

      if (value is List) return;

      formData.fields.add(MapEntry(key, value.toString()));
    });

    /// 2. deliveryMethods (핵심)
    for (final method in request.deliveryMethods) {
      formData.fields.add(MapEntry('deliveryMethods', method));
    }

    /// 3. directDeliveryCodes
    for (final code in request.directDeliveryCodes ?? const <String>[]) {
      formData.fields.add(MapEntry('directDeliveryCodes', code));
    }

    /// 2. options (문자열로 정확히 한 번만)
    formData.fields.add(
      MapEntry(
        'options',
        jsonEncode(request.options.map((e) => e.toJson()).toList()),
      ),
    );

    /// 5. 이미지
    formData.files.add(
      MapEntry(
        'thumbnailImage',
        MultipartFile.fromBytes(thumbnail, filename: 'thumbnail.png'),
      ),
    );

    final galleryImageFiles = await Future.wait(
      galleryImages.map((image) async {
        return MapEntry(
          'galleryImages',
          MultipartFile.fromBytes(image, filename: 'image.png'),
        );
      }),
    );
    formData.files.addAll(galleryImageFiles);

    final descriptionImageFiles = await Future.wait(
      descriptionImages.map((image) async {
        return MapEntry(
          'descriptionImages',
          MultipartFile.fromBytes(image, filename: 'description.png'),
        );
      }),
    );
    formData.files.addAll(descriptionImageFiles);

    formData.files.add(
      MapEntry(
        'foodLabelImage',
        MultipartFile.fromBytes(foodLabel, filename: 'label.png'),
      ),
    );

    print(formData.fields);
    print(formData.files.map((e) => e.key));

    final response = await _dio.post(
      AppHttpUrls.postCreateProduct,
      data: formData,
    );

    return response.data;
  }

  Future<Map<String, dynamic>> executeUpdateProduct({
    required String productId,
    required CreateProductModel request,
    required dynamic thumbnail,
    required List<dynamic> galleryImages,
    required List<dynamic> descriptionImages,
    required dynamic foodLabel,
  }) async {
    final map = request.toJson();
    print("options JSON 확인:");
    print(jsonEncode(request.options.map((e) => e.toJson()).toList()));
    final formData = FormData();

    /// 1. 일반 필드
    map.forEach((key, value) {
      if (value == null) return;

      if (key == 'options') return;
      if (key == 'isVariableWeight') return;
      if (value is List) return;

      formData.fields.add(MapEntry(key, value.toString()));
    });

    /// 2. deliveryMethods
    for (final method in request.deliveryMethods) {
      formData.fields.add(MapEntry('deliveryMethods', method));
    }

    /// 3. directDeliveryCodes
    for (final code in request.directDeliveryCodes ?? const <String>[]) {
      formData.fields.add(MapEntry('directDeliveryCodes', code));
    }

    /// 4. options
    formData.fields.add(
      MapEntry(
        'options',
        jsonEncode(request.options.map((e) => e.toJson()).toList()),
      ),
    );

    /// 🚀 5. 이미지 bytes 병렬 변환
    final thumbnailFuture = _resolveImage(thumbnail);
    final foodLabelFuture = _resolveImage(foodLabel);

    final galleryImageFutures = galleryImages.map(_resolveImage).toList();
    final descriptionImageFutures = descriptionImages.map(_resolveImage).toList();

    final results = await Future.wait([
      thumbnailFuture,
      foodLabelFuture,
      ...galleryImageFutures,
      ...descriptionImageFutures,
    ]);

    final thumbnailBytes = results[0];
    final foodLabelBytes = results[1];
    final galleryImageBytesList = results.sublist(
      2,
      2 + galleryImages.length,
    );
    final descriptionImageBytesList = results.sublist(
      2 + galleryImages.length,
    );

    /// 6. 썸네일
    formData.files.add(
      MapEntry(
        'thumbnailImage',
        MultipartFile.fromBytes(thumbnailBytes, filename: 'thumbnail.png'),
      ),
    );

    /// 7. 추가 이미지
    for (final bytes in galleryImageBytesList) {
      formData.files.add(
        MapEntry(
          'galleryImages',
          MultipartFile.fromBytes(bytes, filename: 'image.png'),
        ),
      );
    }

    for (final bytes in descriptionImageBytesList) {
      formData.files.add(
        MapEntry(
          'descriptionImages',
          MultipartFile.fromBytes(bytes, filename: 'description.png'),
        ),
      );
    }

    /// 8. 식품표시
    formData.files.add(
      MapEntry(
        'foodLabelImage',
        MultipartFile.fromBytes(foodLabelBytes, filename: 'label.png'),
      ),
    );
    // print("업데이트 formData");
    // print(formData.fields);
    print(formData.files.map((e) => e.key));

    final response = await _dio.put(
      AppHttpUrls.putUpdateProduct(productId),
      data: formData,
    );

    return response.data;
  }

  Future<Uint8List> _resolveImage(dynamic image) async {
    /// 이미 bytes면 그대로 반환
    if (image is Uint8List) {
      return image;
    }

    /// URL이면 다운로드
    if (image is String) {
      return await urlToBytes(image);
    }

    throw Exception("지원하지 않는 이미지 타입: ${image.runtimeType}");
  }

  Future<Uint8List> urlToBytes(String url) async {
    final response = await _dio.get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    return Uint8List.fromList(response.data);
  }
}
