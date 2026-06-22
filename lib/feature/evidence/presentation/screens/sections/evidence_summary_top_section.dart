import 'package:flutter/material.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';

import '../../models/evidence_models.dart';

class EvidenceSummaryTopSection extends StatelessWidget {
  const EvidenceSummaryTopSection({
    super.key,
    required this.selectedFilterType,
    required this.totalCount,
    required this.sellerToBuyerCount,
    required this.modingToSellerCount,
    required this.onSelect,
  });

  final EvidenceFilterType selectedFilterType;
  final int totalCount;
  final int sellerToBuyerCount;
  final int modingToSellerCount;
  final ValueChanged<EvidenceFilterType> onSelect;

  @override
  Widget build(BuildContext context) {
    final filterList = [
      EvidenceFilterType.allDocuments,
      EvidenceFilterType.sellerToBuyer,
      EvidenceFilterType.modingToSeller,
    ];

    return Row(
      children: filterList
          .map(
            (type) => Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${type.label}: ',
                          style: context.body.copyWith(
                            color: selectedFilterType == type
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${_countFor(type)}',
                          style: context.body.copyWith(
                            color: selectedFilterType == type
                                ? Colors.white
                                : AppColors.pointColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  showCheckmark: false,
                  selected: selectedFilterType == type,
                  selectedColor: AppColors.primary,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: AppColors.boxBorderGrey),
                  ),
                  onSelected: (_) => onSelect(type),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  int _countFor(EvidenceFilterType type) {
    switch (type) {
      case EvidenceFilterType.allDocuments:
        return totalCount;
      case EvidenceFilterType.sellerToBuyer:
        return sellerToBuyerCount;
      case EvidenceFilterType.modingToSeller:
        return modingToSellerCount;
    }
  }
}
