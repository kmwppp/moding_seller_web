import 'package:flutter/material.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';

import '../../models/evidence_models.dart';
import 'evidence_detail_key_value_row.dart';

class EvidenceNoneCard extends StatelessWidget {
  const EvidenceNoneCard({super.key, required this.card});

  final EvidenceCardModel card;

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
          const SizedBox(height: 10),
          Text(
            card.caption ?? '',
            style: context.body.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
