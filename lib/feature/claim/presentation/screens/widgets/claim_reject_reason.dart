import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_seller_web/core/theme/app_input_decoration.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/claim/presentation/providers/claim_detail/claim_detail_state.dart';
import 'package:moding_seller_web/feature/claim/presentation/providers/claim_detail/claim_detail_viewmodel.dart';
import 'package:moding_seller_web/feature/claim/presentation/providers/claim_main/claim_main_viewmodel.dart';
import 'package:moding_seller_web/feature/dash_board/presentation/screens/widgets/custom_button.dart';

import '../../models/reason_type.dart';

class ClaimRejectReason extends ConsumerWidget {
  const ClaimRejectReason({super.key, this.claimId});

  final String? claimId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(claimDetailViewModelProvider(claimId));
    final notifier = ref.read(claimDetailViewModelProvider(claimId).notifier);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _radio(
                  notifier,
                  state,
                  ReasonType.normal,
                  "정상 상품입니다.",
                  context,
                ),
                _radio(
                  notifier,
                  state,
                  ReasonType.customerFault,
                  "고객 과실입니다.",
                  context,
                ),
                _radio(
                  notifier,
                  state,
                  ReasonType.afterUse,
                  "사용 후 문제입니다.",
                  context,
                ),
                _radio(notifier, state, ReasonType.etc, "기타", context),

                if (state.selectedReason == ReasonType.etc) ...[
                  const SizedBox(height: 12),
                  TextField(
                    style: context.body,
                    controller: notifier.etcController,
                    maxLines: 3,
                    decoration: AppInputDecoration.focusDecoration(
                      "사유를 입력해주세요.",
                    ),
                  ),
                ],
              ],
            ),
          ),

          GestureDetector(
            onTap: () async {
              final result = await notifier.patchClaimReject(claimId!);
              if (result.success) {
                // 종료
                AppDialog.showSuccess(
                  context,
                  "클레임을 거절하였습니다.",
                  onConfirm: () {
                    context.pop();
                    context.pop();
                    ref.invalidate(claimMainViewModelProvider);
                  },
                );
              } else {
                AppDialog.showError(context, result.message);
              }
            },
            child: CustomButton(
              title: "거절 확정",
              boxColor: AppColors.pointColor,
              paddingVertical: 6,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _radio(
    ClaimDetailViewModel vm,
    ClaimDetailState state,
    ReasonType type,
    String label,
    BuildContext context,
  ) {
    return RadioListTile<ReasonType>(
      value: type,
      activeColor: AppColors.primary,
      groupValue: state.selectedReason,
      contentPadding: EdgeInsets.zero,
      title: Text(label, style: context.body),
      onChanged: (value) {
        if (value != null) {
          vm.selectReason(value);
        }
      },
    );
  }
}
