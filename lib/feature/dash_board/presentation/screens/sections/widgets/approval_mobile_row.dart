import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/presentation/widgets/new_order_check.dart';
import 'package:moding_seller_web/core/utils/app_enum.dart';
import 'package:moding_seller_web/core/utils/string_util.dart';
import 'package:moding_seller_web/feature/dash_board/presentation/providers/dash_board_viewmodel.dart';
import 'package:moding_seller_web/feature/order/domain/entities/order_model.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/presentation/dialogs/app_dialogs.dart';
import '../../../../../../core/presentation/widgets/modal/web_bottom_sheet.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../widgets/custom_button.dart';

class ApprovalMobileRow extends ConsumerWidget {
  const ApprovalMobileRow({super.key, required this.model});

  final OrderModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(dashBoardViewModelProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                model.orderCode,
                style: context.body.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrey,
                ),
              ),
            ),

            Text(
              model.createdAt.toDataAndTime,
              style: context.caption.copyWith(color: AppColors.darkGrey),
              textAlign: TextAlign.end,
            ),
          ],
        ),

        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${model.items[0].productName} * ${model.items[0].quantity}개",
              style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 6),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${AppStrings.paymentAmount}: ${StringUtil.formatCurrency(model.items[0].totalPrice)}원",
              style: context.body,
            ),
          ],
        ),

        const SizedBox(height: 6),

        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  WebBottomSheet.show(
                    context: context,
                    title: "새 주문 확인",
                    child: NewOrderCheck(
                      model: model,
                      isDashBoard: true,
                      onConfirm: () async {
                        final response = await notifier.patchOrderConfirm(
                          model.id,
                        );
                        if (response.success) {
                          AppDialog.showSuccess(context, "주문을 승인했습니다.");
                        } else {
                          AppDialog.showError(
                            context,
                            response.message.isNotEmpty
                                ? response.message
                                : "알 수 없는 에러가 발생했습니다.",
                          );
                        }
                      },
                      onReject: (reject) async {
                        final response = await notifier.patchOrderReject(
                          model.id,
                          reject,
                        );
                        if (response.success) {
                          AppDialog.showSuccess(context, "주문을 거절했습니다.");
                        } else {
                          AppDialog.showError(
                            context,
                            response.message.isNotEmpty
                                ? response.message
                                : "알 수 없는 에러가 발생했습니다.",
                          );
                        }
                      },
                    ),
                  );
                },
                child: CustomButton(
                  title: AppStrings.orderConfirmation,
                  boxColor: AppColors.primary,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
