import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moding_seller_web/core/network/entities/response_model.dart';
import 'package:moding_seller_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_seller_web/feature/product/data/repositories/product_repository_impl.dart';
import 'package:moding_seller_web/feature/product/presentation/providers/product_register/product_register_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/create_product/create_product_model.dart';
import '../../../domain/entities/create_product/product_category_model.dart';
import '../../../domain/entities/create_product/product_option.dart';
import '../../../domain/entities/enum/capacity_unit.dart';
import '../../../domain/entities/enum/quantity_unit.dart';
import '../../screens/sections/delivery_info_section.dart';

part 'product_register_viewmodel.g.dart';

@Riverpod()
class ProductRegisterViewModel extends _$ProductRegisterViewModel {
  // 1. 컨트롤러 선언
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();

  final TextEditingController cutoffTimeController = TextEditingController();
  final TextEditingController shippingFeeController = TextEditingController();
  final TextEditingController extraShippingFeeController =
      TextEditingController();
  final TextEditingController jejuShippingFeeController =
      TextEditingController();
  final TextEditingController freeShippingThresholdController =
      TextEditingController();
  final TextEditingController shippingNoticeController =
      TextEditingController();
  final TextEditingController distributionNoticeController =
      TextEditingController();
  final TextEditingController handlingPrecautionController =
      TextEditingController();

  // 각 옵션별 컨트롤러들을 저장할 리스트
  List<Map<String, TextEditingController>> optionControllers = [];

  @override
  ProductRegisterState build(String? productId) {
    if (optionControllers.isEmpty) {
      _addOptionControllers(); // 컨트롤러 1개 생성
    }

    ref.onDispose(() {
      // 공통 컨트롤러 정리
      productNameController.dispose();
      summaryController.dispose();
      cutoffTimeController.dispose();
      shippingFeeController.dispose();
      extraShippingFeeController.dispose();
      jejuShippingFeeController.dispose();
      freeShippingThresholdController.dispose();
      shippingNoticeController.dispose();
      distributionNoticeController.dispose();
      handlingPrecautionController.dispose();

      // 동적 옵션 컨트롤러 리스트 정리
      for (var map in optionControllers) {
        map.values.forEach((c) => c.dispose());
      }
    });

    // productId가 null이 아니면 상세정보 가져오기
    if (productId != null) {
      Future.microtask(() => getMyProductDetailInfo(productId));
    } else {
      Future.microtask(() async {
        await Future.wait([
          getProductMajorCategoryList(),
          getDeliveryDistrictOptions(),
        ]);
      });
    }
    return ProductRegisterState.initial().copyWith(
      isMainLoading: productId != null,
    );
  }

  static const Map<String, List<String>> _deliveryTypeMap = {
    '택배 배송': ['COURIER'],
    '직접 배송': ['DIRECT'],
    '혼합 배송': ['COURIER', 'DIRECT'],
  };

  static const _storageMap = {
    '냉장': 'REFRIGERATED',
    '냉동': 'FROZEN',
    '상온': 'ROOM_TEMP',
  };

  // 컨트롤러 한 세트 추가 로직
  void _addOptionControllers({
    String? cap,
    String? qty,
    String? prc,
    String? dis,
    String? stk,
  }) {
    optionControllers.add({
      'capacity': TextEditingController(text: cap ?? ''),
      'quantity': TextEditingController(text: qty ?? ''),
      'price': TextEditingController(text: prc ?? ''),
      'discount': TextEditingController(text: dis ?? ''),
      'stock': TextEditingController(text: stk ?? ''),
    });
  }

  void updateProductName(String value) {
    state = state.copyWith(productName: value);
  }

  /// 한줄 소개 추가
  void updateOneLineSummary(String value) {
    state = state.copyWith(oneLineSummary: value);
  }

  /// 제조사 멘트 추가
  void updateManufacturerMent(String value) {
    state = state.copyWith(manufacturerMent: value);
  }

  /// 카테고리 1 변경
  void updateCategory1(ProductCategoryModel category) async {
    state = state.copyWith(
      majorCategory: category,
      subCategory: null,
      subCategoryList: [],
    );

    getProductSubCategoryList(category.id);
  }

  /// 카테고리 2 변경
  void updateCategory2(ProductCategoryModel category) {
    state = state.copyWith(subCategory: category);
  }

  /// 메인 이미지 변경
  void updateMainImage(dynamic image) {
    state = state.copyWith(mainImage: image);
  }

  /// 상품 이미지 추가
  void addGalleryImages(List<Uint8List> images) {
    state = state.copyWith(galleryImages: [...state.galleryImages, ...images]);
  }

  /// 상품 이미지 삭제
  void removeGalleryImage(int index) {
    final next = [...state.galleryImages];
    next.removeAt(index);
    state = state.copyWith(galleryImages: next);
  }

  void addDescriptionImages(List<Uint8List> images) {
    state = state.copyWith(
      descriptionImages: [...state.descriptionImages, ...images],
    );
  }

  void removeDescriptionImage(int index) {
    final next = [...state.descriptionImages];
    next.removeAt(index);
    state = state.copyWith(descriptionImages: next);
  }

  /// 옵션 추가 버튼
  void addOption() {
    _addOptionControllers(); // 컨트롤러 추가
    state = state.copyWith(
      options: [...state.options, state.template],
      template: RequestProductOption(),
    );
  }

  /// 옵션 삭제 버튼
  void removeOption(int index) {
    // 메모리 해제 및 리스트에서 제거
    optionControllers[index].values.forEach((c) => c.dispose());
    optionControllers.removeAt(index);

    final updated = List<RequestProductOption>.from(state.options)
      ..removeAt(index);
    state = state.copyWith(options: updated);
  }

  /// 중량/용량 선택 시 로직
  void updateWeightOption(int index, String type) {
    final updated = List<RequestProductOption>.from(state.options);

    final units = type == '개당 중량'
        ? [CapacityUnit.g, CapacityUnit.kg]
        : [CapacityUnit.ml, CapacityUnit.l];

    final defaultUnit = units.first;

    updated[index] = updated[index].copyWith(
      weightOptions: type,
      capacityUnitList: units,
      capacityUnit: defaultUnit,
    );

    state = state.copyWith(options: updated);
  }

  /// 중량/용량 입력 시 로직
  void updateCapacityUnit(int index, CapacityUnit unit) {
    final updated = List<RequestProductOption>.from(state.options);

    updated[index] = updated[index].copyWith(capacityUnit: unit);

    state = state.copyWith(options: updated);
  }

  /// 단위 변경 시 로직
  void updateCapacity(int index, String capacity) {
    final updated = List<RequestProductOption>.from(state.options);

    updated[index] = updated[index].copyWith(
      capacity: int.tryParse(capacity) ?? 0,
    );

    state = state.copyWith(options: updated);
  }

  /// 수량 입력 시 로직
  void updateQuantity(int index, String quantityValue) {
    final updated = List<RequestProductOption>.from(state.options);

    updated[index] = updated[index].copyWith(
      quantityValue: int.tryParse(quantityValue) ?? 0,
    );

    state = state.copyWith(options: updated);
  }

  /// 수량 단위 선택시 로직
  void updateQuantityUnit(int index, QuantityUnit quantityUnit) {
    final updated = List<RequestProductOption>.from(state.options);

    updated[index] = updated[index].copyWith(quantityUnit: quantityUnit);

    state = state.copyWith(options: updated);
  }

  /// 가격 입력 시 로직
  void updatePrice(int index, String priceStr) {
    final updated = List<RequestProductOption>.from(state.options);

    final price = int.tryParse(priceStr.replaceAll(',', '')) ?? 0;
    final discount = updated[index].discountAmount;

    updated[index] = updated[index].copyWith(
      price: price,
      finalPrice: (price - discount).clamp(0, 999999999),
    );

    state = state.copyWith(options: updated);
  }

  /// 할인 가격 입력 시 로직
  void updateDiscountAmount(int index, String discountStr) {
    final updated = List<RequestProductOption>.from(state.options);

    final discount = int.tryParse(discountStr.replaceAll(',', '')) ?? 0;
    final price = updated[index].price;

    updated[index] = updated[index].copyWith(
      discountAmount: discount,
      finalPrice: (price - discount).clamp(0, 999999999),
    );

    state = state.copyWith(options: updated);
  }

  /// 재고 입력 시 로직
  void updateStockQuantity(int index, String stockQuantity) {
    final updated = List<RequestProductOption>.from(state.options);

    updated[index] = updated[index].copyWith(
      stockQuantity: int.tryParse(stockQuantity) ?? 0,
    );

    state = state.copyWith(options: updated);
  }

  /// 배송방식 체크 함수
  bool isSelected(String label) {
    final mapped = _deliveryTypeMap[label] ?? [];
    return listEquals(state.deliveryType, mapped);
  }

  /// 배송방식 선택시 로직
  Future<void> updateDeliveryType(BuildContext context, String label) async {
    final mapped = _deliveryTypeMap[label] ?? [];

    if (state.isVariableWeight && !_isDirectOnly(mapped)) {
      state = state.copyWith(deliveryType: const ['DIRECT']);
      _syncDirectDeliverySettings(const ['DIRECT'], keepExisting: true);
      await AppDialog.showError(context, "가변상품은 직접배송만 가능합니다.");
      return;
    }

    state = state.copyWith(deliveryType: mapped);
    _syncDirectDeliverySettings(mapped);
  }

  void toggleWeekendShipping(bool value) {
    state = state.copyWith(isWeekendShipping: value);
  }

  void toggleNationwideDirectDelivery(bool value) {
    if (!_isDirectOnly(state.deliveryType)) {
      state = state.copyWith(isNationwideDirectDelivery: true);
      return;
    }

    state = state.copyWith(
      isNationwideDirectDelivery: value,
      directDeliveryCodes: value ? const [] : state.directDeliveryCodes,
    );
  }

  void toggleDirectDeliveryDistrict(String districtCode) {
    final updated = List<String>.from(state.directDeliveryCodes);

    if (updated.contains(districtCode)) {
      updated.remove(districtCode);
    } else {
      updated.add(districtCode);
    }

    state = state.copyWith(directDeliveryCodes: updated);
  }

  void setDirectDeliveryCodes(List<String> values) {
    state = state.copyWith(directDeliveryCodes: values);
  }

  Future<void> toggleVariableWeight(BuildContext context, bool value) async {
    if (!value) {
      state = state.copyWith(isVariableWeight: false);
      return;
    }

    if (!_isDirectOnly(state.deliveryType)) {
      state = state.copyWith(deliveryType: const ['DIRECT']);
      _syncDirectDeliverySettings(const ['DIRECT'], keepExisting: true);
      await AppDialog.showError(context, "가변상품은 직접배송만 가능합니다.");
    }

    state = state.copyWith(isVariableWeight: true);
  }

  /// 배송기간 선택 시 로직
  void updateDeliveryDays(String value) {
    state = state.copyWith(deliveryDays: value);
  }

  /// 당일 출고 on/off시 로직
  void toggleSameDayShip(bool value) {
    if (!value) {
      state = state.copyWith(cutoffTime: null);
    } else {
      state = state.copyWith(deliveryDate: "1");
    }
    state = state.copyWith(sameDayShip: value);
  }

  /// 도서 산간지역 배송 불가능 여부 on/off
  void toggleisExtraImpossibleShipping(bool value) {
    if (value) {
      state = state.copyWith(extraShippingFee: null);
      extraShippingFeeController.text = "0";
    }
    state = state.copyWith(isExtraImpossibleShipping: value);
  }

  /// 제주도 배송 불가능 여부 on/off
  void toggleisJejuImpossibleShipping(bool value) {
    if (value) {
      state = state.copyWith(jejuShippingFee: null);
      jejuShippingFeeController.text = "0";
    }
    state = state.copyWith(isJejuImpossibleShipping: value);
  }

  /// 출고소요일 선택 시 로직
  void updateDeliveryDate(String value) {
    state = state.copyWith(deliveryDate: value);
  }

  /// 당일 출고 마감 시간 입력시 로직
  void updateCutoffTime(String value) {
    cutoffTimeController.text = value;
    state = state.copyWith(cutoffTime: value);
  }

  /// 배송가능 요일 선택 시 로직
  void toggleWeekday(Weekday day) {
    final newList = List<Weekday>.from(state.weekdaySelected);

    if (newList.contains(day)) {
      newList.remove(day);
    } else {
      newList.add(day);
    }

    state = state.copyWith(weekdaySelected: newList);
    print(state.weekdaySelected);
  }

  /// 배송비 입력 시 로직
  void updateShippingFee(String value) {
    state = state.copyWith(shippingFee: int.tryParse(value) ?? 0);
  }

  /// 도서산간 추가배송비 입력 시 로직
  void updateExtraShippingFee(String value) {
    state = state.copyWith(extraShippingFee: int.tryParse(value) ?? 0);
  }

  /// 제주도 추가배송비 입력 시 로직
  void updateJejuShippingFee(String value) {
    state = state.copyWith(jejuShippingFee: int.tryParse(value) ?? 0);
  }

  /// 무료배송 최소금액 입력 시 로직
  void updateFreeShippingThreshold(String value) {
    state = state.copyWith(freeShippingThreshold: int.tryParse(value) ?? 0);
  }

  /// 배송안내 문구 입력 시 로직
  void updateShippingNotice(String value) {
    state = state.copyWith(shippingNotice: value);
  }

  void updateIngredientImage(Uint8List image) {
    state = state.copyWith(ingredientImage: image);
  }

  /// 반품지 주소 입력 시 로직
  void updateReturnAddress(String value) {
    state = state.copyWith(returnAddress: value);
  }

  /// 초도 배송비 입력 시 로직
  void updateInitialShippingFee(String value) {
    state = state.copyWith(initialShippingFee: value);
  }

  /// 반품 배송비 입력 시 로직
  void updateReturnShippingFee(String value) {
    state = state.copyWith(returnShippingFee: value);
  }

  /// 보관방법 선택 시 로직
  void updateStorageMethod(String value) {
    state = state.copyWith(storageMethod: _storageMap[value] ?? '');
  }

  /// 유통 관련 안내 입력 시 로직
  void updateDistributionNotice(String value) {
    state = state.copyWith(distributionNotice: value);
  }

  /// 취급 주의사항 입력 시 로직
  void updateHandleNotice(String value) {
    state = state.copyWith(handleNotice: value);
  }

  /// 과세 여부 선택 시 로직
  void updateTaxType(bool value) {
    state = state.copyWith(taxType: value);
  }

  void updateHaccpCertified(bool value) {
    final isEditMode = state.productId.isNotEmpty;
    if (isEditMode && !state.initialIsHaccpCertified && value) {
      return;
    }

    state = state.copyWith(isHaccpCertified: value);
  }

  /// 판매기간 설정 선택 시 로직
  void updateSalePeriodType(String value) {
    state = state.copyWith(
      salePeriodType: value,
      saleStartDate: value == "상시 판매" ? '' : state.saleStartDate,
      saleEndDate: value == "상시 판매" ? '' : state.saleEndDate,
    );
  }

  /// 판매 시작일 선택 시 로직
  void updateSaleStartDate(DateTime? date) {
    print(date);

    if (date == null) {
      state = state.copyWith(saleStartDate: '');
      return;
    }

    final utcString = '${date.toIso8601String().split('.').first}Z';

    state = state.copyWith(saleStartDate: utcString);
  }

  /// 판매 종료일 선택 시 로직
  void updateSaleEndDate(DateTime? date) {
    print(date);

    if (date == null) {
      state = state.copyWith(saleEndDate: '');
      return;
    }

    final utcString = '${date.toIso8601String().split('.').first}Z';

    state = state.copyWith(saleEndDate: utcString);
  }

  void updateGalleryImages(List<Uint8List> images) {
    state = state.copyWith(galleryImages: images);
  }

  void updateDescriptionImages(List<Uint8List> images) {
    state = state.copyWith(descriptionImages: images);
  }

  /// 메인 카테고리 API
  Future<void> getProductMajorCategoryList() async {
    try {
      final repository = ref.read(productRepositoryProvider);
      state = state.copyWith(
        majorCategoryList: await repository.getMajorCategoryList(),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> getDeliveryDistrictOptions() async {
    try {
      final repository = ref.read(productRepositoryProvider);
      state = state.copyWith(
        deliveryDistrictOptions: await repository.getDeliveryDistrictOptions(),
      );
    } catch (e) {
      print(e);
    }
  }

  /// 서브 카테고리 API
  Future<void> getProductSubCategoryList(int majorCategoryId) async {
    try {
      final repository = ref.read(productRepositoryProvider);
      state = state.copyWith(
        subCategoryList: await repository.getSubCategoryList(majorCategoryId),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<ResponseModel> executeCreateProduct() async {
    // 유효성 검증
    final validation = createProductValidationChk();
    if (validation.success == false) return validation;
    //test
    // return ResponseModel(success: false, message: "ㅇㅇ");

    try {
      final repository = ref.read(productRepositoryProvider);
      print("deliveryType: ${state.deliveryType}");

      // 1. DTO 생성
      final model = CreateProductModel(
        name: state.productName,
        description: state.oneLineSummary,
        categoryId: state.subCategory!.id,
        options: state.options,
        deliveryMethods: state.deliveryType,
        deliveryDays: 1,
        shippingLeadTime: int.tryParse(state.deliveryDate) ?? 0,
        shippingCutoffTime: state.sameDayShip ? state.cutoffTime : null,
        isWeekendShipping: state.isWeekendShipping,
        directDeliveryCodes: _shouldSendDirectDistricts()
            ? state.directDeliveryCodes
            : null,
        shippingFee: state.shippingFee,
        isRemoteAreaUnavailable: state.isExtraImpossibleShipping,
        remoteAreaShippingFee: state.extraShippingFee ?? 0,
        isJejuUnavailable: state.isJejuImpossibleShipping,
        jejuShippingFee: state.jejuShippingFee ?? 0,
        freeShippingThreshold: state.freeShippingThreshold,
        shippingNotice: state.shippingNotice,
        // initialShippingFee: int.tryParse(state.initialShippingFee) ?? 0,
        // returnShippingFee: int.tryParse(state.returnShippingFee) ?? 0,
        storageMethod: state.storageMethod,
        distributionNotice: state.distributionNotice,
        handlingPrecaution: state.handleNotice,
        isTaxable: state.taxType,
        isHaccpCertified: state.isHaccpCertified,
        isVariableWeight: state.isVariableWeight,
        saleStartAt: state.salePeriodType == "기간 설정"
            ? state.saleStartDate
            : null,
        saleEndAt: state.salePeriodType == "기간 설정" ? state.saleEndDate : null,
        sampleProvisionType: "NONE",
        samplePrice: 0,
        sampleShippingFee: 0,
      );

      print("JSON: ${model.toJson()}");

      // 2. 이미지 (예시 - 실제로는 상태에서 가져와야 함)
      final Uint8List thumbnailBytes = state.mainImage!;
      final List<dynamic> galleryImageBytesList = state.galleryImages;
      final List<dynamic> descriptionImageBytesList = state.descriptionImages;
      final Uint8List foodLabelBytes = state.ingredientImage!;

      // 3. 호출
      final result = await repository.executeCreateProduct(
        request: model,
        thumbnail: thumbnailBytes,
        galleryImages: galleryImageBytesList,
        descriptionImages: descriptionImageBytesList,
        foodLabel: foodLabelBytes,
      );

      if (result.success) {
        print("성공: ${result.success}");
        print("메세지: ${result.message}");
      } else {
        print("실패: ${result.success}");
        print("메세지: ${result.message}");
      }

      return result;
    } catch (e) {
      print("심각한 오류: $e");
      return ResponseModel(success: false, message: "처리 중 오류가 발생했습니다.");
    }
  }

  Future<ResponseModel> executeUpdateProduct() async {
    // 유효성 검증
    final validation = createProductValidationChk();
    if (validation.success == false) return validation;
    //test
    // return ResponseModel(success: false, message: "ㅇㅇ");

    try {
      final repository = ref.read(productRepositoryProvider);
      print("deliveryType: ${state.deliveryType}");

      // 1. DTO 생성
      final model = CreateProductModel(
        name: state.productName,
        description: state.oneLineSummary,
        categoryId: state.subCategory!.id,
        options: state.options,
        deliveryMethods: state.deliveryType,
        deliveryDays: 1,
        shippingLeadTime: int.tryParse(state.deliveryDate) ?? 0,
        shippingCutoffTime: state.sameDayShip ? state.cutoffTime : null,
        isWeekendShipping: state.isWeekendShipping,
        directDeliveryCodes: _shouldSendDirectDistricts()
            ? state.directDeliveryCodes
            : null,
        shippingFee: state.shippingFee,
        isRemoteAreaUnavailable: state.isExtraImpossibleShipping,
        remoteAreaShippingFee: state.extraShippingFee ?? 0,
        isJejuUnavailable: state.isJejuImpossibleShipping,
        jejuShippingFee: state.jejuShippingFee ?? 0,
        freeShippingThreshold: state.freeShippingThreshold,
        shippingNotice: state.shippingNotice,
        // initialShippingFee: int.tryParse(state.initialShippingFee) ?? 0,
        // returnShippingFee: int.tryParse(state.returnShippingFee) ?? 0,
        storageMethod: state.storageMethod,
        distributionNotice: state.distributionNotice,
        handlingPrecaution: state.handleNotice,
        isTaxable: state.taxType,
        isHaccpCertified: state.isHaccpCertified,
        saleStartAt: state.salePeriodType == "기간 설정"
            ? state.saleStartDate
            : null,
        saleEndAt: state.salePeriodType == "기간 설정" ? state.saleEndDate : null,
        sampleProvisionType: "NONE",
        samplePrice: 0,
        sampleShippingFee: 0,
      );

      print("JSON: ${model.toJson()}");

      // 2. 이미지 (예시 - 실제로는 상태에서 가져와야 함)
      final dynamic thumbnailBytes = state.mainImage!;
      final List<dynamic> galleryImageBytesList = state.galleryImages;
      final List<dynamic> descriptionImageBytesList = state.descriptionImages;
      final dynamic foodLabelBytes = state.ingredientImage!;

      // 3. 호출
      final result = await repository.executeUpdateProduct(
        productId: state.productId,
        request: model,
        thumbnail: thumbnailBytes,
        galleryImages: galleryImageBytesList,
        descriptionImages: descriptionImageBytesList,
        foodLabel: foodLabelBytes,
      );

      if (result.success) {
        print("성공: ${result.success}");
        print("메세지: ${result.message}");
      } else {
        print("실패: ${result.success}");
        print("메세지: ${result.message}");
      }

      return result;
    } catch (e) {
      print("심각한 오류: $e");
      return ResponseModel(success: false, message: "처리 중 오류가 발생했습니다.");
    }
  }

  ResponseModel createProductValidationChk() {
    // 상품명 미입력 시
    if (state.productName == '') {
      return ResponseModel(success: false, message: "상품명을 입력해주세요.");
    }

    // 상품 한줄 소개 미입력 시
    if (state.oneLineSummary == '') {
      return ResponseModel(success: false, message: "상품 한줄 소개를 입력해주세요.");
    }

    // 첫번째 카테고리 미 선택 시
    if (state.majorCategory == null) {
      return ResponseModel(success: false, message: "상품 카테고리 대분류를 선택해주세요.");
    }

    // 두번째 카테고리 미 선택 시
    if (state.subCategory == null) {
      return ResponseModel(success: false, message: "상품 카테고리 소분류를 선택해주세요.");
    }

    // 대표 이미지 미등록 시
    if (state.mainImage == null) {
      return ResponseModel(success: false, message: "대표 이미지를 등록해주세요.");
    }

    String optionMessage = "";
    // 각 옵션
    for (int i = 0; i < state.options.length; i++) {
      final option = state.options[i];
      // 중량 및 용량 미입력 시
      if (option.capacity == 0) {
        optionMessage = "옵션${i + 1}의 ${option.weightOptions} 값을 입력해주세요.";
        return ResponseModel(success: false, message: optionMessage);
      }

      // 수량 옵션 미입력 시
      if (option.quantityValue == 0) {
        optionMessage = "옵션${i + 1}의 수량을 입력해주세요.";
        return ResponseModel(success: false, message: optionMessage);
      }

      // 가격 미입력 시
      if (option.price == 0) {
        optionMessage = "옵션${i + 1}의 가격을 입력해주세요.";
        return ResponseModel(success: false, message: optionMessage);
      }

      if (option.stockQuantity == 0) {
        optionMessage = "옵션${i + 1}의 재고를 입력해주세요.";
        return ResponseModel(success: false, message: optionMessage);
      }
    }

    // 식품 성분 표시 정보 이미지 미 등록 시
    if (state.ingredientImage == null) {
      return ResponseModel(success: false, message: "식품 성분 표시 정보 이미지를 등록해주세요.");
    }

    // 배송 방식 미선택 시
    if (state.deliveryType.isEmpty) {
      return ResponseModel(success: false, message: "배송 방식을 선택해주세요.");
    }

    // print("state.sameDayShip: ${state.sameDayShip}");
    // print("state.cutoffTime: ${state.cutoffTime}");
    // 당일 출고일 때 당일 출고 가능 시간을 선택하지 않았을 때
    if (state.sameDayShip == true) {
      if (state.cutoffTime == '' || state.cutoffTime == null) {
        return ResponseModel(success: false, message: "당일 출고 가능 시간을 입력해주세요.");
      }
    }

    // 배송비 미 입력 시
    // 배송비가 0원일 수 있음.
    // if (state.shippingFee == 0) {
    //   return ResponseModel(success: false, message: "배송비를 입력해주세요.");
    // }

    // 도서산간 추가배송비 미 입력 시
    // 도서산간 추가 배송비가 0원 일 수 있음.
    // if (state.extraShippingFee == 0) {
    //   return ResponseModel(success: false, message: "도서산간 추가배송비를 입력해주세요.");
    // }

    // 배송 안내 문구 미 입력시
    if (state.shippingNotice == '') {
      return ResponseModel(success: false, message: "배송 안내 문구를 입력해주세요.");
    }

    // 보관방법 미 선택시
    if (state.storageMethod == '') {
      return ResponseModel(success: false, message: "보관방법을 선택해주세요.");
    }

    // 유통 관련 안내 미 입력시
    if (state.distributionNotice == '') {
      return ResponseModel(success: false, message: "유통 관련 안내를 입력해주세요.");
    }

    // 취급 주의 사항 미 입력시
    if (state.handleNotice == '') {
      return ResponseModel(success: false, message: "취급 주의 사항을 입력해주세요.");
    }

    // 운영 정보에서 기간 설정을 선택하고 날짜를 입력하지 않았을 때
    if (state.salePeriodType == "기간 설정") {
      if (state.saleStartDate == '') {
        return ResponseModel(success: false, message: "판매 시작일을 선택해주세요.");
      }

      if (state.saleEndDate == '') {
        return ResponseModel(success: false, message: "판매 종료일을 선택해주세요.");
      }
    }

    if (_hasDirectDelivery(state.deliveryType) &&
        !state.isNationwideDirectDelivery &&
        state.directDeliveryCodes.isEmpty) {
      return ResponseModel(success: false, message: "직배송 가능 지역을 하나 이상 선택해주세요.");
    }

    if (state.isVariableWeight) {
      if (!_isDirectOnly(state.deliveryType)) {
        return ResponseModel(
          success: false,
          message: "가변무게 상품은 직배송 전용일 때만 설정할 수 있습니다.",
        );
      }

      final hasInvalidOption = state.options.any((option) {
        return option.capacityUnit != CapacityUnit.g &&
            option.capacityUnit != CapacityUnit.kg;
      });

      if (hasInvalidOption) {
        return ResponseModel(
          success: false,
          message: "가변무게 상품은 옵션 단위가 g 또는 kg 이어야 합니다.",
        );
      }
    }

    return ResponseModel(success: true, message: "상품이 등록되었습니다.");
  }

  /// 내 상품 정보 가져오기
  Future<void> getMyProductDetailInfo(String productId) async {
    try {
      final repository = ref.read(productRepositoryProvider);
      final response = await repository.getMyProductDetail(productId);
      final deliveryDistricts = await repository.getDeliveryDistrictOptions();

      // 1. 카테고리 로직 (대분류/소분류 가져오기)
      final majorList = await repository.getMajorCategoryList();

      // 서버 데이터와 일치하는 대분류 찾기
      final selectedMajor = majorList.firstWhere(
        (e) => e.id == response.parentCategoryId,
        orElse: () => majorList.first,
      );

      // 해당 대분류의 소분류 리스트 가져오기
      final subList = await repository.getSubCategoryList(selectedMajor.id);

      // 서버 데이터와 일치하는 소분류 찾기
      final selectedSub = subList
          .where((e) => e.id == response.categoryId)
          .firstOrNull;
      final effectiveDeliveryTypes = response.isVariableWeight
          ? const ['DIRECT']
          : response.deliveryMethods;

      // 2. 컨트롤러 업데이트 (UI 반영 전 데이터 준비)
      productNameController.text = response.name;
      summaryController.text = response.description;
      cutoffTimeController.text = response.shippingCutoffTime ?? '';
      shippingFeeController.text = "${response.shippingFee}";
      extraShippingFeeController.text = "${response.remoteAreaShippingFee}";
      jejuShippingFeeController.text = "${response.jejuShippingFee}";
      freeShippingThresholdController.text =
          "${response.freeShippingThreshold}";
      shippingNoticeController.text = response.shippingNotice;
      distributionNoticeController.text = response.distributionNotice;
      handlingPrecautionController.text = response.handlingPrecaution;

      // 핵심: 기존 컨트롤러 메모리 해제 및 '새로운 리스트' 준비
      // 기존 리스트를 직접 clear()하지 않고, 새 리스트를 만들어 마지막에 교체합니다.
      for (var map in optionControllers) {
        map.values.forEach((c) => c.dispose());
      }

      final updatedOptions = response.options.map((opt) {
        final int? id = opt.id;
        // price에서 discountAmount를 뺀 값을 계산
        final int calculatedFinalPrice = opt.price - opt.discountAmount;

        final String weightOptions =
            (opt.capacityUnit.name.toUpperCase() == "ML" ||
                opt.capacityUnit.name.toUpperCase() == "L")
            ? "개당 용량"
            : "개당 중량";

        final QuantityUnit valueForDropdown = QuantityUnit.values.firstWhere(
          (e) => e == opt.quantityUnit,
        );

        // Freezed의 copyWith로 finalPrice 필드만 교체한 새 객체 반환
        return opt.copyWith(
          id: id,
          finalPrice: calculatedFinalPrice,
          weightOptions: weightOptions,
          quantityUnit: valueForDropdown,
        );
      }).toList();

      // 임시 리스트에 먼저 담아서 인덱스 불일치 방지
      final List<Map<String, TextEditingController>> newControllers = [];

      for (var opt in response.options) {
        // _addOptionControllers가 내부적으로 optionControllers에 직접 add한다면
        // 아래와 같이 임시 리스트에 담는 로직으로 수정하거나,
        // 모든 컨트롤러 세팅이 끝날 때까지 UI 리빌드를 방지해야 합니다.
        final map = {
          'capacity': TextEditingController(text: opt.capacity.toString()),
          'quantity': TextEditingController(text: opt.quantityValue.toString()),
          'price': TextEditingController(text: opt.price.toString()),
          'discount': TextEditingController(
            text: (opt.discountAmount).toString(),
          ),
          'stock': TextEditingController(text: opt.stockQuantity.toString()),
        };
        newControllers.add(map);
      }

      // 3. 최종 상태 업데이트 (단 한 번의 state 변경으로 모든 UI 동기화)
      // 변수들을 먼저 업데이트하고 마지막에 교체합니다.
      optionControllers = newControllers;

      state = state.copyWith(
        isMainLoading: false,
        productId: productId,
        productName: response.name,
        oneLineSummary: response.description,
        majorCategoryList: majorList,
        majorCategory: selectedMajor,
        subCategoryList: subList,
        subCategory: selectedSub,
        options: updatedOptions,
        deliveryType: effectiveDeliveryTypes,
        deliveryDays: response.deliveryDays.toString(),
        sameDayShip: response.isSameDayShipping,
        deliveryDate: response.shippingLeadTime.toString(),
        cutoffTime: response.shippingCutoffTime,
        isWeekendShipping: response.isWeekendShipping,
        deliveryDistrictOptions: deliveryDistricts,
        directDeliveryCodes: response.directDeliveryDistricts
            .map((district) => district.code)
            .toList(),
        isNationwideDirectDelivery: response.directDeliveryDistricts.isEmpty,
        isVariableWeight: response.isVariableWeight,
        shippingFee: response.shippingFee,
        isExtraImpossibleShipping: response.isRemoteAreaUnavailable,
        extraShippingFee: response.remoteAreaShippingFee,
        isJejuImpossibleShipping: response.isJejuUnavailable,
        jejuShippingFee: response.jejuShippingFee,
        freeShippingThreshold: response.freeShippingThreshold,
        shippingNotice: response.shippingNotice,
        storageMethod: response.storageMethod,
        distributionNotice: response.distributionNotice,
        handleNotice: response.handlingPrecaution,
        taxType: response.isTaxable,
        isHaccpCertified: response.isHaccpCertified,
        initialIsHaccpCertified: response.isHaccpCertified,
        salePeriodType: response.saleStartAt == null ? "상시 판매" : "기간 설정",
        saleStartDate: response.saleStartAt ?? '',
        saleEndDate: response.saleEndAt ?? '',
        mainImage: response.thumbnailImageUrl,
        ingredientImage: response.foodLabelImageUrl,
        galleryImages: response.galleryImages,
        descriptionImages: response.descriptionImages,
      );
      _syncDirectDeliverySettings(effectiveDeliveryTypes, keepExisting: true);
    } catch (e) {
      print("상품 상세 로드 중 오류 발생: $e");
    }
  }

  bool _hasDirectDelivery(List<String> deliveryTypes) {
    return deliveryTypes.contains('DIRECT');
  }

  bool _isDirectOnly(List<String> deliveryTypes) {
    return deliveryTypes.length == 1 && deliveryTypes.first == 'DIRECT';
  }

  bool _shouldSendDirectDistricts() {
    return _isDirectOnly(state.deliveryType) &&
        !state.isNationwideDirectDelivery;
  }

  void _syncDirectDeliverySettings(
    List<String> deliveryTypes, {
    bool keepExisting = false,
  }) {
    final hasDirect = _hasDirectDelivery(deliveryTypes);
    final isDirectOnly = _isDirectOnly(deliveryTypes);

    state = state.copyWith(
      isNationwideDirectDelivery: isDirectOnly
          ? state.isNationwideDirectDelivery
          : true,
      directDeliveryCodes: hasDirect && keepExisting
          ? state.directDeliveryCodes
          : (hasDirect ? state.directDeliveryCodes : const []),
      isVariableWeight: isDirectOnly ? state.isVariableWeight : false,
    );
  }

  List<Weekday> parseWeekdays(List<String>? serverDays) {
    if (serverDays == null) return [];

    return serverDays.map((s) {
      switch (s.toUpperCase()) {
        case "MON":
          return Weekday.mon;
        case "TUE":
          return Weekday.tue;
        case "WED":
          return Weekday.wed;
        case "THU":
          return Weekday.thu;
        case "FRI":
          return Weekday.fri;
        case "SAT":
          return Weekday.sat;
        case "SUN":
          return Weekday.sun;
        default:
          throw ArgumentError("Unknown weekday string: $s");
      }
    }).toList();
  }
}
