import 'package:flutter/material.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';

import '../../../../dash_board/presentation/screens/widgets/custom_button.dart';
import '../../models/evidence_models.dart';
import 'evidence_detail_key_value_row.dart';

class EvidenceTaxInvoiceCard extends StatelessWidget {
  const EvidenceTaxInvoiceCard({
    super.key,
    required this.card,
    required this.onPressedView,
  });

  final EvidenceCardModel card;
  final VoidCallback onPressedView;

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                card.title,
                style: context.bodyLarge.copyWith(fontWeight: FontWeight.w800),
              ),
              Spacer(),
              Text(
                card.typeLabel ?? '',
                style: context.body.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          EvidenceDetailKeyValueRow(label: '계산서 코드', value: card.code ?? ''),
          EvidenceDetailKeyValueRow(
            label: '공급자',
            value: card.supplyCompany ?? '',
          ),
          EvidenceDetailKeyValueRow(
            label: '공급받는자',
            value: card.customerCompany ?? '',
          ),
          EvidenceDetailKeyValueRow(
            label: '공급가액',
            value: card.supplyAmountText ?? '',
          ),
          EvidenceDetailKeyValueRow(label: '세액', value: card.taxAmountText ?? ''),
          EvidenceDetailKeyValueRow(label: '금액', value: card.amountText ?? ''),
          EvidenceDetailKeyValueRow(
            label: '발행일',
            value: card.issueDateText ?? '',
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: onPressedView,
            child: SizedBox(
              width: double.infinity,
              child: const CustomButton(
                title: '세금계산서 보기',
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
