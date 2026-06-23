import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_seller_web/core/utils/app_enum.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../order/domain/entities/order_model.dart';
import '../../widgets/custom_button.dart';

class ShipmentWebRow extends StatelessWidget {
  const ShipmentWebRow({super.key, required this.item});

  final OrderModel item;

  @override
  Widget build(BuildContext context) {
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
          child: Text(item.buyerBusinessName, style: context.bodySmall),
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
                context.push(
                  "/dash/preparingForDelivery/read/${item.id}?isDashboard=true",
                );
              },
              child: CustomButton(
                title: AppStrings.selectDeliveryMethod,
                boxColor: AppColors.primary,
                textColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
