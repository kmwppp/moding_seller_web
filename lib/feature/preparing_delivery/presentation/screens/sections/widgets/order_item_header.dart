import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class OrderItemsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '상품명',
            style: context.bodySmall.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            '옵션',
            style: context.bodySmall.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '수량',
            style: context.bodySmall.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '단가',
            textAlign: TextAlign.right,
            style: context.bodySmall.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            '총 금액',
            textAlign: TextAlign.right,
            style: context.bodySmall.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
