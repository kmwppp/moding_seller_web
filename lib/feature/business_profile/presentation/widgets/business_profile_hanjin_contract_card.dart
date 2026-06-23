import 'package:flutter/material.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/theme/app_box_styles.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/business_profile/presentation/utils/business_profile_formatters.dart';
import 'package:moding_seller_web/feature/business_profile/presentation/widgets/business_profile_info_row.dart';

import '../../../../core/presentation/widgets/text_arrow_widget.dart';

class BusinessProfileHanjinContractCard extends StatelessWidget {
  const BusinessProfileHanjinContractCard({
    super.key,
    required this.contractNo,
    required this.isSubmitting,
    required this.onPressed,
  });

  final String? contractNo;
  final bool isSubmitting;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final hasContractNo = (contractNo ?? '').trim().isNotEmpty;

    return Container(
      width: double.infinity,
      decoration: AppBoxStyles.borderBox.copyWith(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '택배코드 관리',
                      style: context.bodyLarge.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '한진 택배 계약 코드를 등록해 주문 처리 정보를 최신 상태로 유지하세요.',
                      style: context.body.copyWith(
                        color: AppColors.darkGrey,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: isSubmitting ? null : onPressed,
                child: TextArrowWidget(
                  text: hasContractNo ? '택배코드 수정' : '택배코드 등록',
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          BusinessProfileInfoRow(
            title: '한진 택배코드',
            content: valueOrDash(contractNo),
            isLast: true,
          ),
        ],
      ),
    );
  }
}
