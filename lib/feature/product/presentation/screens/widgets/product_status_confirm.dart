import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_seller_web/feature/product/presentation/providers/product_management/product_management_viewmodel.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../dash_board/presentation/screens/widgets/custom_button.dart';
import '../../../domain/entities/enum/product_management_enum.dart';

class ProductStatusConfirm extends ConsumerWidget {
  const ProductStatusConfirm({
    super.key,
    required this.nowStatus,
    required this.index,
    required this.status,
  });

  final String nowStatus;
  final int index;
  final ProductStatus status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productManagementViewModelProvider);
    final notifier = ref.read(productManagementViewModelProvider.notifier);
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: Center(
            child: Text(
              "현재 상품의 상태를 $nowStatus 변경하시겠습니까?",
              style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CustomButton(
                    title: "취소",
                    paddingVertical: 6,
                    boxColor: AppColors.pointColor,
                    textColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                    final result = await notifier.selectProductStatus(
                      index: index,
                      productId: state.productList[index].id.toString(),
                      status: status,
                    );

                    if (!result.success) {
                      AppDialog.showError(context, result.message ?? "");
                    }
                  },
                  child: CustomButton(
                    title: "확인",
                    paddingVertical: 6,
                    boxColor: AppColors.primary,
                    textColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
