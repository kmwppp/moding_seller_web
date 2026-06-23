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

class ClaimWebList extends ConsumerWidget {
  const ClaimWebList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(claimMainViewModelProvider);

    return Container(
      decoration: AppBoxStyles.borderBox,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     Container(
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 10,
          //         vertical: 5,
          //       ),
          //       decoration: BoxDecoration(
          //         color: const Color(0xFFFFF4E8),
          //         borderRadius: BorderRadius.circular(999),
          //         border: Border.all(color: const Color(0xFFFFE2BF)),
          //       ),
          //       child: Text(
          //         '${state.claimList.length}건',
          //         style: context.bodySmall.copyWith(
          //           color: AppColors.pointColor,
          //           fontWeight: FontWeight.w700,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFFBFCFB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                _header('주문번호', 2, context),
                _header('상품명', 3, context),
                _header('클레임 타입', 2, context),
                _header('날짜', 2, context),
                _header('처리', 2, context),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ...state.claimList.asMap().entries.map((entry) {
            final item = entry.value;
            final isLast = entry.key == state.claimList.length - 1;

            return Container(
              margin: EdgeInsets.only(bottom: isLast ? 0 : 6),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFFDFEFD),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(item.claimCode, style: context.bodySmall),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(item.productName, style: context.bodySmall),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          item.claimType.label,
                          style: context.bodySmall.copyWith(
                            color: AppColors.pointColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          item.createdAt.toDataAndTimeNoLineBreak,
                          style: context.bodySmall,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            context.push('/claim/detail/${item.id}');
                          },
                          child: CustomButton(
                            title: item.status.buttonLabel,
                            boxColor: AppColors.primary,
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (!isLast)
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Divider(height: 1),
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _header(String title, int flex, BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        title,
        style: context.body.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
