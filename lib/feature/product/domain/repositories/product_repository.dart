import 'dart:typed_data';

import 'package:moding_seller_web/core/network/entities/response_model.dart';
import 'package:moding_seller_web/feature/product/domain/entities/delivery_district_option.dart';
import 'package:moding_seller_web/feature/product/domain/entities/check_product/product_list_page_result.dart';
import 'package:moding_seller_web/feature/product/domain/entities/check_product/my_product_summary_model.dart';
import 'package:moding_seller_web/feature/product/domain/entities/enum/product_management_enum.dart';

import '../entities/check_product/my_product_detail_model.dart';
import '../entities/create_product/create_product_model.dart';
import '../entities/create_product/product_category_model.dart';

abstract class ProductRepository {
  /// ----------------------------------------
  /// 내 상품 상태별 건수 부분
  /// ----------------------------------------
  Future<MyProductSummaryModel> getMyProductSummary();

  /// ----------------------------------------
  /// 내 상품 조회 부분
  /// ----------------------------------------
  // 내 상품 리스트 조회
  Future<ProductListPageResult> getMyProductList(
    String status, {
    int page = 0,
    int size = 20,
  });

  // 내 상품 정보 조회
  Future<MyProductDetailModel> getMyProductDetail(String productId);

  /// ----------------------------------------
  /// 상품 등록 부분
  /// ----------------------------------------
  Future<ResponseModel> executeCreateProduct({
    required CreateProductModel request,
    required Uint8List thumbnail,
    required List<dynamic> galleryImages,
    required List<dynamic> descriptionImages,
    required Uint8List foodLabel,
  });

  /// ----------------------------------------
  /// 상품 수정 부분
  /// ----------------------------------------
  Future<ResponseModel> executeUpdateProduct({
    required String productId,
    required CreateProductModel request,
    required dynamic thumbnail,
    required List<dynamic> galleryImages,
    required List<dynamic> descriptionImages,
    required dynamic foodLabel,
  });

  /// ----------------------------------------
  /// 내 상품 상태 변경 부분
  /// ----------------------------------------
  Future<ResponseModel> patchMyProductStatus({
    required String productId,
    required ProductStatus status,
  });

  Future<List<ProductCategoryModel>> getMajorCategoryList();

  Future<List<ProductCategoryModel>> getSubCategoryList(int majorCategoryId);

  Future<List<DeliveryDistrictOption>> getDeliveryDistrictOptions();
}
