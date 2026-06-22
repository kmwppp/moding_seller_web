import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/constants/app_strings.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/dash_board/presentation/providers/dash_board_viewmodel.dart';
import 'package:moding_president_web/feature/dash_board/presentation/screens/sections/widgets/approval_mobile_row.dart';
import 'package:moding_president_web/feature/dash_board/presentation/screens/sections/widgets/approval_web_row.dart';

import '../../../../../core/theme/app_box_styles.dart';
import '../../../../order/domain/entities/order_model.dart';

class ApprovalSection extends ConsumerWidget {
  const ApprovalSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashBoardViewModelProvider);
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                          AppStrings.orderApproval,
                          style: context.bodyLarge.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF4E8),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(color: const Color(0xFFFFE2BF)),
                        ),
                        child: Text(
                          '${state.orderList.length}건',
                          style: context.bodySmall.copyWith(
                            color: AppColors.pointColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  if (state.orderList.isNotEmpty) ...[
                    if (constraints.maxWidth > 600)
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFBFCFB),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: _buildApprovalHeader(context),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    if (constraints.maxWidth < 600) const SizedBox(height: 4),
                    Column(
                      children: [
                        for (int i = 0; i < state.orderList.length; i++) ...[
                          if (i == 0) const SizedBox(height: 4),
                          _buildApprovalRow(model: state.orderList[i]),
                          if (i != state.orderList.length - 1)
                            const Divider(height: 32),
                        ],
                      ],
                    ),
                  ] else
                    Center(
                      child: Text(
                        "등록된 주문이 없습니다.",
                        style: context.body.copyWith(color: AppColors.darkGrey),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApprovalHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            AppStrings.orderNumber,
            style: context.body.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            AppStrings.date,
            style: context.body.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            AppStrings.productName,
            style: context.body.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            AppStrings.count,
            style: context.body.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            AppStrings.paymentAmount,
            style: context.body.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "",
            style: context.body.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildApprovalRow({required OrderModel model}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return ApprovalMobileRow(model: model);
        } else {
          return ApprovalWebRow(model: model);
        }
      },
    );
  }
}
