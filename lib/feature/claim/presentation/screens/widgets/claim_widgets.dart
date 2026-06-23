import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/claim/presentation/providers/claim_main/claim_main_state.dart';
import 'package:moding_seller_web/feature/claim/presentation/providers/claim_main/claim_main_viewmodel.dart';

import '../../../domain/enums/claim_enum.dart';

class ClaimStatusTopSection extends ConsumerWidget {
  const ClaimStatusTopSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(claimMainViewModelProvider);
    final notifier = ref.read(claimMainViewModelProvider.notifier);

    const statusList = ClaimSearchStatus.values;

    return Row(
      children: statusList.map((status) {
        final isSelected = state.selectedStatus == status;
        final value = _getClaimCount(status, state);
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${status.label}: ",
                      style: context.body.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : AppColors.darkGrey,
                      ),
                    ),
                    Text(
                      "$value",
                      style: context.body.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : AppColors.pointColor,
                      ),
                    ),
                  ],
                ),
              ),
              showCheckmark: false,
              selected: isSelected,
              selectedColor: AppColors.primary,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: AppColors.boxBorderGrey),
              ),
              onSelected: (_) async {
                await notifier.selectStatus(status);
              },
            ),
          ),
        );
      }).toList(),
    );
  }

  int _getClaimCount(ClaimSearchStatus status, ClaimMainState state) {
    switch (status) {
      case ClaimSearchStatus.waiting:
        return state.summary!.requested;
      case ClaimSearchStatus.processing:
        return state.summary!.inProgress;
      case ClaimSearchStatus.completed:
        return state.summary!.completed;
    }
  }
}
