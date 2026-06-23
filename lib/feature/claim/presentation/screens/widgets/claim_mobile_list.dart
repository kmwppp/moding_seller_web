import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_seller_web/core/utils/app_enum.dart';
import 'package:moding_seller_web/feature/claim/domain/enums/claim_enum.dart';
import 'package:moding_seller_web/feature/claim/domain/enums/claim_status.dart';
import 'package:moding_seller_web/feature/claim/presentation/providers/claim_main/claim_main_viewmodel.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../dash_board/presentation/screens/widgets/custom_button.dart';

class ClaimMobileList extends ConsumerWidget {
  const ClaimMobileList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(claimMainViewModelProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //   decoration: BoxDecoration(
        //     color: const Color(0xFFFFF4E8),
        //     borderRadius: BorderRadius.circular(999),
        //     border: Border.all(color: const Color(0xFFFFE2BF)),
        //   ),
        //   child: Text(
        //     '${state.claimList.length}건',
        //     style: context.bodySmall.copyWith(
        //       color: AppColors.pointColor,
        //       fontWeight: FontWeight.w700,
        //     ),
        //   ),
        // ),
        // const SizedBox(height: 10),
        ...state.claimList.map(
          (item) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: AppBoxStyles.borderBox,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.claimCode,
                        style: context.body.copyWith(
                          color: AppColors.darkGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF4E8),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        item.claimType.label,
                        style: context.caption.copyWith(
                          color: AppColors.pointColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item.productName,
                  style: context.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${item.createdAt.toDataAndTimeNoLineBreak} 접수',
                  style: context.body.copyWith(color: AppColors.darkGrey),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => context.push('/claim/detail/${item.id}'),
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      title: item.status.buttonLabel,
                      boxColor: AppColors.primary,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
