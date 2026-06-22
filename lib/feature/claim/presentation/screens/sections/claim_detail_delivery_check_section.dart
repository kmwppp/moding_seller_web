import 'package:flutter/material.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/enums/delivery_method.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ClaimDetailDeliveryCheckSection extends StatelessWidget {
  const ClaimDetailDeliveryCheckSection({
    super.key,
    required this.reshipDeliveryMethod,
    required this.reshipCourierCode,
    required this.reshipTrackingNumber,
  });

  final DeliveryMethod? reshipDeliveryMethod;
  final String? reshipCourierCode;
  final String? reshipTrackingNumber;

  @override
  Widget build(BuildContext context) {
    final isDirect = reshipDeliveryMethod == DeliveryMethod.DIRECT;

    return Container(
      width: double.infinity,
      decoration: AppBoxStyles.borderBox.copyWith(
        color: const Color(0xFFFCFDFC),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '재배송 확인',
                    style: context.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 10,
                //     vertical: 5,
                //   ),
                //   decoration: BoxDecoration(
                //     color: const Color(0xFFEFF7EF),
                //     borderRadius: BorderRadius.circular(999),
                //   ),
                //   child: Text(
                //     '읽기 전용',
                //     style: context.bodySmall.copyWith(
                //       color: AppColors.primary,
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 14),
            _DeliveryInfoRow(
              label: '배송방법',
              value: reshipDeliveryMethod?.label ?? "",
            ),
            if (!isDirect) ...[
              const SizedBox(height: 12),
              _DeliveryInfoRow(label: '택배사', value: reshipCourierCode ?? ""),
              const SizedBox(height: 12),
              _DeliveryInfoRow(
                label: '송장번호',
                value: reshipTrackingNumber ?? "",
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DeliveryInfoRow extends StatelessWidget {
  const _DeliveryInfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5ECE5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 84,
            child: Text(
              label,
              style: context.body.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? '-' : value,
              style: context.body.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
