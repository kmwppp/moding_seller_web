import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_president_web/core/utils/app_enum.dart';
import 'package:moding_president_web/feature/order/domain/entities/order_model.dart';
import 'package:moding_president_web/feature/order/domain/enums/order_status_enum.dart';
import 'package:moding_president_web/feature/order/presentation/providers/order_management_viewmodel.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/presentation/dialogs/app_dialogs.dart';
import '../../../../../core/presentation/widgets/modal/web_bottom_sheet.dart';
import '../../../../../core/presentation/widgets/new_order_check.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../dash_board/presentation/screens/widgets/custom_button.dart';

class OrderShipmentWebRow extends ConsumerWidget {
  const OrderShipmentWebRow({super.key, required this.item});

  final OrderModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(item.orderCode, style: context.bodySmall),
        ),
        Expanded(
          flex: 2,
          child: Text(
            item.createdAt.toDataAndTimeNoLineBreak,
            style: context.bodySmall,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(item.items[0].productName, style: context.bodySmall),
        ),
        SizedBox(width: 4),
        Expanded(
          flex: 2,
          child: Text(
            item.deliveryAddressRecipientName,
            style: context.bodySmall,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(item.deliveryAddressPhone, style: context.bodySmall),
        ),
        Expanded(
          flex: 3,
          child: Text(item.deliveryAddressFull, style: context.bodySmall),
        ),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                switch (item.status) {
                  case OrderStatus.ORDERED:
                    _NewOrderChk(context, item, ref);
                    break;
                  case OrderStatus.CONFIRMED:
                    // 입력가능한 상세페이지
                    context.push("/dash/preparingForDelivery/read/${item.id}");
                    break;

                  case OrderStatus.SHIPPED:
                  case OrderStatus.DELIVERED:
                  case OrderStatus.PURCHASE_CONFIRMED:
                  case OrderStatus.SETTLEMENT_COMPLETED:
                    // 입력 불가능한 상세페이지
                    context.push("/dash/preparingForDelivery/read/${item.id}");
                    break;

                  case OrderStatus.CANCELLED:
                  case OrderStatus.REJECTED:
                    // 취소나 거절시 하단이 없는 페이지
                    context.push("/dash/preparingForDelivery/read/${item.id}");
                    break;

                  case OrderStatus.CLAIM_IN_PROGRESS:
                    context.push("/claim/detail/${item.claimId}");
                    break;
                  // 클레임 상세 페이지로 이동
                }
              },
              child: CustomButton(
                title: item.status.label,
                boxColor: getButtonColor(item.status),
                textColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color getButtonColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.CANCELLED:
      case OrderStatus.REJECTED:
        return AppColors.darkGrey;

      case OrderStatus.CLAIM_IN_PROGRESS:
        return AppColors.pointColor;

      default:
        return AppColors.primary;
    }
  }

  void _NewOrderChk(BuildContext context, OrderModel model, WidgetRef ref) {
    WebBottomSheet.show(
      context: context,
      title: "새 주문 확인",
      child: NewOrderCheck(
        model: item,
        isDashBoard: true,
        onConfirm: () async {
          final response = await ref
              .read(orderManagementViewModelProvider.notifier)
              .patchOrderConfirm(model.id);
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
          final response = await ref
              .read(orderManagementViewModelProvider.notifier)
              .patchOrderReject(model.id, reject);
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
  }
}
