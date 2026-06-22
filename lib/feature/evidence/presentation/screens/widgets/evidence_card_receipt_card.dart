import 'package:flutter/material.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';

import '../../../../dash_board/presentation/screens/widgets/custom_button.dart';
import '../../models/evidence_models.dart';
import 'evidence_detail_key_value_row.dart';

class EvidenceCardReceiptCard extends StatelessWidget {
  const EvidenceCardReceiptCard({
    super.key,
    required this.card,
    required this.onPressedViewReceipt,
  });

  final EvidenceCardModel card;
  final VoidCallback onPressedViewReceipt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.boxBorderGrey),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card.title,
            style: context.bodyLarge.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          EvidenceDetailKeyValueRow(label: '영수증코드', value: card.code ?? ''),
          EvidenceDetailKeyValueRow(
            label: '결제일',
            value: card.issueDateText ?? '',
          ),
          EvidenceDetailKeyValueRow(
            label: '결제금액',
            value: card.amountText ?? '',
          ),

          EvidenceDetailKeyValueRow(
            label: '카드사',
            value: card.cardCompany ?? '',
          ),
          EvidenceDetailKeyValueRow(
            label: '승인번호',
            value: card.approvalNumber ?? '',
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: onPressedViewReceipt,
            child: SizedBox(
              width: double.infinity,
              child: const CustomButton(
                title: '영수증 보기',
                boxColor: AppColors.pointColor,
                textColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
