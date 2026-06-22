import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_president_web/feature/claim/domain/enums/claim_enum.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/presentation/dialogs/app_dialogs.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../dash_board/presentation/screens/widgets/custom_button.dart';
import '../../models/approve_type.dart';
import '../../providers/claim_detail/claim_detail_state.dart';
import '../../providers/claim_detail/claim_detail_viewmodel.dart';
import '../../providers/claim_main/claim_main_viewmodel.dart';

class ClaimApprove extends ConsumerWidget {
  const ClaimApprove({super.key, this.claimId});

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
                  ApproveType.refund,
                  "환불을 희망합니다.",
                  context,
                ),

                _radio(
                  notifier,
                  state,
                  ApproveType.reship,
                  "재배송을 희망합니다.",
                  context,
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () async {
              final result = await notifier.patchClaimApprove(claimId!);
              if (result.success) {
                // 종료
                AppDialog.showSuccess(
                  context,
                  "클레임을 승인하였습니다.",
                  onConfirm: () async {
                    if (state.selectApprove == ApproveType.reship) {
                      await ref
                          .read(claimMainViewModelProvider.notifier)
                          .resetToWaiting(ClaimSearchStatus.processing);
                    } else {
                      ref.invalidate(claimMainViewModelProvider);
                    }

                    context.pop();
                    context.pop();
                  },
                );
              } else {
                AppDialog.showError(context, result.message);
              }
            },
            child: CustomButton(
              title: "승인 확정",
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
    ApproveType type,
    String label,
    BuildContext context,
  ) {
    return RadioListTile<ApproveType>(
      value: type,
      activeColor: AppColors.primary,
      groupValue: state.selectApprove,
      contentPadding: EdgeInsets.zero,
      title: Text(label, style: context.body),
      onChanged: (value) {
        if (value != null) {
          vm.selectApprove(value);
        }
      },
    );
  }
}
