import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/utils/string_util.dart';
import 'package:moding_president_web/feature/settlement/presentation/screens/widgets/settlement_detail_section.dart';
import 'package:moding_president_web/feature/settlement/presentation/screens/widgets/settlement_status_badge.dart';

import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_enum.dart';
import '../../providers/settlement_viewmodel.dart';

class SettlementWebRow extends ConsumerWidget {
  const SettlementWebRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settlementViewModelProvider);
    final notifier = ref.read(settlementViewModelProvider.notifier);
    return Container(
      decoration: AppBoxStyles.borderBox,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              _header('정산번호', 2, context),
              _header('정산상태', 2, context),
              _header('정산일자', 2, context),
              _header('', 2, context),
              _header('정산최종금액', 2, context),
            ],
          ),
          const Divider(),
          Column(
            children: state.settlementList.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;

              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      notifier.toggleExpanded(item.id);
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              item.settlementCode,
                              style: context.bodySmall,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SettlementStatusBadge(status: item.status),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              item.settledAt?.toDataAndTimeNoLineBreak ?? "-",
                              style: context.bodySmall,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              StringUtil.daysUntil(
                                item.settledAt?.toDataAndTimeNoLineBreak ?? "",
                              ),
                              style: context.bodySmall,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "${StringUtil.formatCurrency(item.finalAmount as int?)}원",
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (item.isSelected) SettlementDetailSection(index: index),
                  const Divider(),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _header(String title, int flex, BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        title,
        style: context.bodySmall.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
