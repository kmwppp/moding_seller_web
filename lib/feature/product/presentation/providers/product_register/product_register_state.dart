import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/delivery_district_option.dart';
import '../../../domain/entities/create_product/product_category_model.dart';
import '../../../domain/entities/create_product/product_option.dart';
import '../../screens/sections/delivery_info_section.dart';

part 'product_register_state.freezed.dart';

@freezed
abstract class ProductRegisterState with _$ProductRegisterState {
  const ProductRegisterState._();

  const factory ProductRegisterState({
    required bool isMainLoading,

    /// 상품 번호
    required String productId,

    /// 상품명
    required String productName,

    /// 상품 한줄 소개
    required String oneLineSummary,
    required String manufacturerMent,

    /// 메인 카테고리, 리스트
    required ProductCategoryModel? majorCategory,
    required List<ProductCategoryModel> majorCategoryList,

    required ProductCategoryModel? subCategory,
    required List<ProductCategoryModel> subCategoryList,

    /// 옵션 리스트
    required List<RequestProductOption> options,

    required RequestProductOption template,

    /// 식품 성분 표시 이미지
    required dynamic ingredientImage,

    /// 배송 방식
    required List<String> deliveryType,

    /// 배송 기간
    required String deliveryDays,

    /// 당일 출고 on/off
    required bool sameDayShip,

    /// 출고 소요일
    required String deliveryDate,

    /// 당일 출고 가능 시간
    required String? cutoffTime,

    /// 출고 가능한 요일
    required List<Weekday> weekdaySelected,
    required bool isWeekendShipping,
    required List<DeliveryDistrictOption> deliveryDistrictOptions,
    required List<String> directDeliveryCodes,
    required bool isNationwideDirectDelivery,
    required bool isVariableWeight,

    /// 배송비
    required int shippingFee,

    /// 도서산간 지역 배송 불가능 여부 false: 가능 / true: 불가능
    required bool isExtraImpossibleShipping,

    /// 도서산간 추가배송비
    required int? extraShippingFee,

    /// 제주 지역 배송 가능 여부 false: 가능 / true: 불가능
    required bool isJejuImpossibleShipping,

    /// 제주 추가배송비
    required int? jejuShippingFee,

    /// 무료 배송 최소 금액
    required int freeShippingThreshold,

    /// 배송 안내 문구
    required String shippingNotice,

    /// 반품 주소지
    required String returnAddress,

    /// 초도 배송비
    required String initialShippingFee,

    /// 반품 배송비
    required String returnShippingFee,

    /// 보관 방법
    required String storageMethod,

    /// 유통 안내
    required String distributionNotice,

    /// 취급 주의사항
    required String handleNotice,

    /// 과세 여부
    required bool taxType,
    required bool isHaccpCertified,
    required bool initialIsHaccpCertified,

    /// 판매 기간 타입 (상시 / 기간 설정)
    required String salePeriodType,

    /// 판매 시작일 / 종료일
    required String saleStartDate,
    required String saleEndDate,

    /// 대표 이미지
    required dynamic mainImage,

    /// 상품 설명 이미지 리스트
    required List<dynamic> descriptionImages,

    /// 상품 갤러리 이미지 리스트
    required List<dynamic> galleryImages,
  }) = _ProductRegisterState;

  factory ProductRegisterState.initial() => ProductRegisterState(
    isMainLoading: true,
    productId: '',
    productName: '',
    oneLineSummary: '',
    manufacturerMent: '',
    majorCategoryList: [],
    majorCategory: null,
    subCategoryList: [],
    subCategory: null,
    options: [RequestProductOption()],
    template: RequestProductOption(),
    ingredientImage: null,
    deliveryType: [],
    deliveryDays: '1',
    sameDayShip: false,
    cutoffTime: null,
    deliveryDate: '1',
    weekdaySelected: [],
    isWeekendShipping: false,
    deliveryDistrictOptions: const [],
    directDeliveryCodes: const [],
    isNationwideDirectDelivery: true,
    isVariableWeight: false,
    shippingFee: 0,
    isExtraImpossibleShipping: false,
    extraShippingFee: 0,
    isJejuImpossibleShipping: false,
    jejuShippingFee: 0,
    freeShippingThreshold: 0,
    shippingNotice: '',
    returnAddress: '',
    initialShippingFee: '',
    returnShippingFee: '',
    storageMethod: '',
    distributionNotice: '',
    handleNotice: '',
    taxType: true,
    isHaccpCertified: false,
    initialIsHaccpCertified: false,
    salePeriodType: '상시 판매',
    saleStartDate: '',
    saleEndDate: '',
    mainImage: null,
    descriptionImages: const [],
    galleryImages: const [],
  );
}
