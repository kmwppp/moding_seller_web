import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/utils/app_enum.dart';
import 'package:moding_president_web/feature/settlement/presentation/providers/settlement_viewmodel.dart';
import 'package:moding_president_web/feature/settlement/presentation/screens/widgets/settlement_detail_section.dart';
import 'package:moding_president_web/feature/settlement/presentation/screens/widgets/settlement_status_badge.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/string_util.dart';

class SettlementMobileRow extends ConsumerWidget {
  const SettlementMobileRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settlementViewModelProvider);
    final notifier = ref.read(settlementViewModelProvider.notifier);
    return Column(
      children: state.settlementList.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () {
              notifier.toggleExpanded(item.id);
            },
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: AppBoxStyles.borderBox,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.settlementCode,
                          style: context.body.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      Text(
                        item.settledAt?.toDateOnly ?? "-",
                        style: context.caption,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${StringUtil.formatCurrency(item.finalAmount as int?)}원",
                    style: context.bodyLarge.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Row(
                    children: [
                      SettlementStatusBadge(status: item.status),
                      SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          StringUtil.daysUntil(
                            item.settledAt?.toDataAndTimeNoLineBreak ?? "",
                          ),
                          style: context.caption.copyWith(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),

                  if (item.isSelected) SettlementDetailSection(index: index),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
