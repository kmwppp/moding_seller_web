import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_seller_web/core/utils/app_enum.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/utils/string_util.dart';
import '../../../../../order/domain/entities/order_model.dart';
import '../../widgets/custom_button.dart';

class ShipmentMobileRow extends StatelessWidget {
  const ShipmentMobileRow({super.key, required this.item});

  final OrderModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                item.orderCode,
                style: context.body.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrey,
                ),
              ),
            ),
            Text(
              item.createdAt.toDataAndTime,
              style: context.caption.copyWith(color: AppColors.darkGrey),
              textAlign: TextAlign.end,
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            Text(
              item.items[0].productName,
              style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          "${item.deliveryAddressFull} (${item.buyerBusinessName})",
          style: context.body,
        ),
        const SizedBox(height: 2),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${AppStrings.paymentAmount}: ${StringUtil.formatCurrency(item.items[0].totalPrice)}원",
              style: context.body,
            ),
          ],
        ),

        const SizedBox(height: 6),

        GestureDetector(
          onTap: () {
            context.push(
              "/dash/preparingForDelivery/read/${item.id}?isDashboard=true",
            );
          },
          child: SizedBox(
            width: double.infinity,
            child: CustomButton(
              title: AppStrings.selectDeliveryMethod,
              boxColor: AppColors.primary,
              textColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
