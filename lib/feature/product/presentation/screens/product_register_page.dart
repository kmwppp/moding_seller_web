import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_seller_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_seller_web/feature/notification/presentation/widgets/notification_bell_button.dart';
import 'package:moding_seller_web/feature/product/presentation/providers/product_register/product_register_viewmodel.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/sections/basic_info_section.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/sections/delivery_info_section.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/sections/food_info_section.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/sections/operation_info_section.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/sections/option_section.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/sections/product_image_section.dart';
import 'package:moding_seller_web/feature/product/presentation/screens/sections/storage_info_section.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/presentation/dialogs/app_dialogs.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../providers/product_management/product_management_viewmodel.dart';

class ProductRegisterPage extends ConsumerWidget {
  const ProductRegisterPage({super.key, this.productId});

  final String? productId;

  bool get isEdit => productId != null && productId!.isNotEmpty;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productRegisterViewModelProvider(productId));
    final vm = ref.read(productRegisterViewModelProvider(productId).notifier);
    final size = MediaQuery.of(context).size;
    final isWide = size.width >= 900;

    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: Text(isEdit ? '상품 수정' : '상품 등록'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Center(child: NotificationBellButton()),
          ),
        ],
      ),
      body: !state.isMainLoading
          ? SafeArea(
              child: SingleChildScrollView(
                padding: isWide
                    ? EdgeInsets.symmetric(
                        horizontal: screenWidth / 3, // 화면 너비의 1/4 적용
                        vertical: 24,
                      )
                    : const EdgeInsets.all(16),
                child: Column(
                  children: [
                    /// 기본 정보
                    BasicInfoSection(productId: productId),
                    const SizedBox(height: 16),

                    /// 상품이미지 등록 섹션
                    ProductImageSection(productId: productId),
                    const SizedBox(height: 16),

                    // /// 옵션
                    OptionSection(productId: productId),
                    const SizedBox(height: 16),

                    /// 식품 성분 표시 이미지 등록 섹션
                    FoodInfoSection(
                      ingredientImage: state.ingredientImage,
                      onIngredientImageChanged: vm.updateIngredientImage,
                    ),
                    const SizedBox(height: 16),

                    /// 배송 정보 섹션
                    DeliveryInfoSection(productId: productId),
                    const SizedBox(height: 16),

                    // /// 반품 및 교환 정보 섹션
                    // ReturnInfoSection(),
                    // const SizedBox(height: 16),

                    /// 보관 및 취급 정보 섹션
                    StorageInfoSection(productId: productId),
                    const SizedBox(height: 24),

                    /// 운영 정보 섹션
                    OperationInfoSection(productId: productId),
                    const SizedBox(height: 24),

                    /// 버튼
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          AppDialog.showLoading(context);

                          if (!isEdit) {
                            final response = await vm.executeCreateProduct();

                            AppDialog.hideLoading(context);

                            if (response.success) {
                              await AppDialog.showSuccess(
                                context,
                                "상품을 등록했습니다.",
                                onConfirm: () {
                                  context.pop();
                                  ref.invalidate(
                                    productManagementViewModelProvider,
                                  );
                                },
                              );
                            } else {
                              await AppDialog.showError(
                                context,
                                response.message.isNotEmpty
                                    ? response.message
                                    : "알 수 없는 에러가 발생했습니다.",
                              );
                            }
                          } else {
                            final response = await vm.executeUpdateProduct();

                            AppDialog.hideLoading(context);

                            if (response.success) {
                              await AppDialog.showSuccess(
                                context,
                                "상품을 수정했습니다.",
                                onConfirm: () {
                                  context.pop();
                                },
                              );
                            } else {
                              await AppDialog.showError(
                                context,
                                response.message.isNotEmpty
                                    ? response.message
                                    : "알 수 없는 에러가 발생했습니다.",
                              );
                            }
                          }
                        },
                        child: Text(
                          isEdit ? '수정 요청' : '판매 요청',
                          style: context.bodyLarge.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.all(isWide ? 200 : 100),
              child: LoadingIndicator(),
            ),
    );
  }
}
