import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/feature/settlement/presentation/providers/settlement_viewmodel.dart';
import 'package:moding_seller_web/feature/settlement/presentation/screens/widgets/settlement_mobile_row.dart';
import 'package:moding_seller_web/feature/settlement/presentation/screens/widgets/settlement_web_row.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_responsive_layout.dart';
import '../../../../../core/theme/app_text_styles.dart';

class SettlementListSection extends ConsumerWidget {
  const SettlementListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settlementViewModelProvider);
    return Column(
      children: [
        if (state.settlementList.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: Text(
                '등록된 정산이 없습니다.',
                style: context.body.copyWith(color: AppColors.darkGrey),
              ),
            ),
          ),
        if (state.settlementList.isNotEmpty)
          AppResponsiveLayout.isDesktop(context)
              ? SettlementWebRow()
              : SettlementMobileRow(),
      ],
    );
  }
}
