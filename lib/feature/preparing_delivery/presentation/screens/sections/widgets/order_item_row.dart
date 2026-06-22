import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/utils/string_util.dart';
import '../../../../domain/entities/preparing_order_model.dart';

class OrderItemsRow extends StatelessWidget {
  const OrderItemsRow({required this.item});

  final PreparingOrderItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            item.productName,
            style: context.body.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(width: 3),
        Expanded(
          flex: 2,
          child: Text(
            item.optionName ?? "",
            style: context.body.copyWith(color: AppColors.darkGrey),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '${StringUtil.formatCurrency(item.quantity)}개',
            style: context.body.copyWith(color: AppColors.darkGrey),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '${StringUtil.formatCurrency(item.unitPrice)}원',
            textAlign: TextAlign.right,
            style: context.body.copyWith(color: AppColors.darkGrey),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            '${StringUtil.formatCurrency(item.totalPrice)}원',
            textAlign: TextAlign.right,
            style: context.body.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
