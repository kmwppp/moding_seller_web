import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:moding_seller_web/core/network/entities/response_model.dart';
import 'package:moding_seller_web/feature/product/data/data_source/product_remote_data_source.dart';
import 'package:moding_seller_web/feature/product/domain/entities/check_product/my_product_model.dart';
import 'package:moding_seller_web/feature/product/domain/entities/check_product/product_list_page_result.dart';
import 'package:moding_seller_web/feature/product/domain/entities/check_product/my_product_summary_model.dart';
import 'package:moding_seller_web/feature/product/domain/entities/delivery_district_option.dart';
import 'package:moding_seller_web/feature/product/domain/entities/enum/product_management_enum.dart';
import 'package:moding_seller_web/feature/product/domain/repositories/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/check_product/my_product_detail_model.dart';
import '../../domain/entities/create_product/create_product_model.dart';
import '../../domain/entities/create_product/product_category_model.dart';

part 'product_repository_impl.g.dart';

@riverpod
ProductRepository productRepository(Ref ref) {
  final dataSource = ref.watch(productRemoteDataSourceProvider);
  return ProductRepositoryImpl(dataSource);
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _dataSource;

  ProductRepositoryImpl(this._dataSource);

  @override
  Future<MyProductSummaryModel> getMyProductSummary() async {
    final response = await _dataSource.getMyProductSummary();
    final data = response['data'];
    return MyProductSummaryModel.fromJson(data);
  }

  /// ----------------------------------------
  /// 내 상품 조회 부분
  /// ----------------------------------------
  // 내 상품 리스트 조회
  @override
  Future<ProductListPageResult> getMyProductList(
    String status, {
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dataSource.getMyProductList(
      status,
      page: page,
      size: size,
    );
    final data = Map<String, dynamic>.from(response['data'] as Map);
    final content = (data['content'] as List?) ?? const [];

    final products = content.map((item) {
      return MyProductModel.fromJson(item);
    }).toList();

    return ProductListPageResult(
      items: products,
      page: (data['number'] as num?)?.toInt() ?? page,
      size: (data['size'] as num?)?.toInt() ?? size,
      totalPages: (data['totalPages'] as num?)?.toInt() ?? 0,
      totalElements:
          (data['totalElements'] as num?)?.toInt() ?? products.length,
    );
  }

  // 내 상품 정보 조회
  @override
  Future<MyProductDetailModel> getMyProductDetail(String productId) async {
    final response = await _dataSource.getMyProductDetail(productId);
    final data = response['data'];
    return MyProductDetailModel.fromJson(data);
  }

  /// ----------------------------------------
  /// 상품 등록 부분
  /// ----------------------------------------
  @override
  Future<ResponseModel> executeCreateProduct({
    required CreateProductModel request,
    required Uint8List thumbnail,
    required List<dynamic> galleryImages,
    required List<dynamic> descriptionImages,
    required Uint8List foodLabel,
  }) async {
    try {
      final response = await _dataSource.executeCreateProduct(
        request: request,
        thumbnail: thumbnail,
        galleryImages: galleryImages,
        descriptionImages: descriptionImages,
        foodLabel: foodLabel,
      );
      return ResponseModel.fromJson(response);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        try {
          return ResponseModel.fromJson(e.response!.data);
        } catch (parseError) {
          return ResponseModel(success: false, message: "서버 응답 형식 오류");
        }
      }
      // 응답 바디가 아예 없는 네트워크 단절 등의 오류
      return ResponseModel(success: false, message: "서버와 연결할 수 없습니다.");
    } catch (e) {
      // 기타 예상치 못한 런타임 오류
      return ResponseModel(success: false, message: "시스템 오류가 발생했습니다.");
    }
  }

  /// ----------------------------------------
  /// 상품 수정 부분
  /// ----------------------------------------
  @override
  Future<ResponseModel> executeUpdateProduct({
    required String productId,
    required CreateProductModel request,
    required dynamic thumbnail,
    required List<dynamic> galleryImages,
    required List<dynamic> descriptionImages,
    required dynamic foodLabel,
  }) async {
    try {
      final response = await _dataSource.executeUpdateProduct(
        productId: productId,
        request: request,
        thumbnail: thumbnail,
        galleryImages: galleryImages,
        descriptionImages: descriptionImages,
        foodLabel: foodLabel,
      );
      return ResponseModel.fromJson(response);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        try {
          return ResponseModel.fromJson(e.response!.data);
        } catch (parseError) {
          return ResponseModel(success: false, message: "서버 응답 형식 오류");
        }
      }
      // 응답 바디가 아예 없는 네트워크 단절 등의 오류
      return ResponseModel(success: false, message: "서버와 연결할 수 없습니다.");
    } catch (e) {
      // 기타 예상치 못한 런타임 오류
      return ResponseModel(success: false, message: "시스템 오류가 발생했습니다.");
    }
  }

  @override
  Future<List<ProductCategoryModel>> getMajorCategoryList() async {
    final response = await _dataSource.getMajorCategory();
    final data = response['data'] as List;

    // JSON -> 모델 변환
    final categories = data.map((item) {
      return ProductCategoryModel(
        item['id'], // int -> String 변환
        item['name'] as String,
      );
    }).toList();
    print("categories.length: ${categories.length}");

    return categories;
  }

  @override
  Future<List<ProductCategoryModel>> getSubCategoryList(
    int majorCategoryId,
  ) async {
    final response = await _dataSource.getSubCategory(majorCategoryId);
    final data = response['data'] as List;

    // JSON -> 모델 변환
    final categories = data.map((item) {
      return ProductCategoryModel(
        item['id'], // int -> String 변환
        item['name'] as String,
      );
    }).toList();
    print("categories.length: ${categories.length}");

    return categories;
  }

  @override
  Future<List<DeliveryDistrictOption>> getDeliveryDistrictOptions() async {
    final response = await _dataSource.getDeliveryDistricts();
    final data = response['data'] as List;

    final options = <DeliveryDistrictOption>[];

    for (final item in data) {
      final group = Map<String, dynamic>.from(item as Map);
      final province = group['province']?.toString() ?? '';
      final districts = (group['districts'] as List?) ?? const [];

      for (final district in districts) {
        final districtMap = Map<String, dynamic>.from(district as Map);
        options.add(
          DeliveryDistrictOption(
            code: districtMap['code']?.toString() ?? '',
            province: province,
            name: districtMap['name']?.toString() ?? '',
          ),
        );
      }
    }

    return options;
  }

  @override
  Future<ResponseModel> patchMyProductStatus({
    required String productId,
    required ProductStatus status,
  }) async {
    final response = await _dataSource.setMyProductStatus(productId, status);
    return ResponseModel.fromJson(response);
  }
}
