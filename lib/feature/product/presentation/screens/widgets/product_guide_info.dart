import 'package:flutter/material.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';

import '../../../../../core/constants/app_colors.dart';

class ProductGuideInfo extends StatelessWidget {
  const ProductGuideInfo({
    super.key,
    required this.title,
    required this.body,
    required this.caption,
    this.caption2 = '',
  });

  final String title;
  final List<String> body;
  final String caption;
  final String caption2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != "")
          Text(
            title,
            style: context.body.copyWith(fontWeight: FontWeight.bold),
          ),
        const SizedBox(height: 8),
        // 2. 바디 리스트 (body 리스트의 개수만큼 동적 생성)
        ...body.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 2.0), // 줄 사이 간격
            child: Text(
              item != '' ? '- $item' : '', // 점(•)을 자동으로 붙여줌
              style: context.bodySmall.copyWith(color: AppColors.darkGrey),
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (caption != '')
          Text(
            caption,
            style: context.bodySmall.copyWith(
              color: AppColors.pointColor,
              fontWeight: FontWeight.w500,
            ),
          ),

        if (caption2 != '')
          Text(
            caption2,
            style: context.bodySmall.copyWith(
              color: AppColors.pointColor,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
