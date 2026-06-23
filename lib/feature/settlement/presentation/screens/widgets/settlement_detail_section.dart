import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_seller_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_seller_web/core/utils/app_enum.dart';
import 'package:moding_seller_web/core/utils/string_util.dart';
import 'package:moding_seller_web/feature/settlement/presentation/providers/settlement_viewmodel.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../dash_board/presentation/screens/widgets/custom_button.dart';
import '../../models/settlement_item.dart';
import 'settlement_detail_key_value_row.dart';

class SettlementDetailSection extends ConsumerWidget {
  const SettlementDetailSection({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settlementViewModelProvider);
    final size = MediaQuery.of(context).size;
    final isWide = size.width >= 900;
    return !state.settlementList[index].detail!.isDetailLoading
        ? Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.boxBorderGrey),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2) 금액 영역
                  SettlementDetailKeyValueRow(
                    label: '상품 금액:',
                    valueText:
                        "${StringUtil.formatCurrency(state.settlementList[index].detail?.productAmount)}원",
                  ),
                  SettlementDetailKeyValueRow(
                    label: '할인 금액:',
                    valueText:
                        "${StringUtil.formatCurrency(state.settlementList[index].detail?.discountAmount)}원",
                  ),
                  SettlementDetailKeyValueRow(
                    label: '실 결제 금액:',
                    valueText:
                        "${StringUtil.formatCurrency(state.settlementList[index].detail?.totalPaidAmount)}원",
                  ),
                  SettlementDetailKeyValueRow(
                    label: '모딩 수수료:',
                    valueText:
                        "${StringUtil.formatCurrency(state.settlementList[index].detail?.commissionAmount)}원",
                  ),
                  SettlementDetailKeyValueRow(
                    label: '클레임 차감:',
                    valueText:
                        "${StringUtil.formatCurrency(state.settlementList[index].detail?.claimDeductAmount)}원",
                  ),
                  Divider(),
                  SettlementDetailKeyValueRow(
                    label: '최종 정산금액:',
                    valueText:
                        "${StringUtil.formatCurrency(state.settlementList[index].detail?.finalAmount)}원",
                    isBoldValue: true,
                  ),

                  const SizedBox(height: 10),
                  // 3) 정산상태 + 보류 전용 영역
                  RichText(
                    text: TextSpan(
                      text: '정산상태: ',
                      style: context.bodyLarge.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      // 기본 스타일
                      children: [
                        TextSpan(
                          text:
                              state
                                  .settlementList[index]
                                  .detail
                                  ?.status
                                  .label ??
                              "",
                          style: context.bodyLarge.copyWith(
                            fontWeight: FontWeight.w700,
                            color: getStatusColor(
                              state.settlementList[index].detail!.status,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.settlementList[index].detail?.payoutStatus !=
                          null ||
                      state.settlementList[index].detail?.paidOutAt != null) ...[
                    const SizedBox(height: 10),
                    if (state.settlementList[index].detail?.payoutStatus !=
                        null)
                      SettlementDetailKeyValueRow(
                        label: '지급 상태:',
                        valueText:
                            state
                                .settlementList[index]
                                .detail
                                ?.payoutStatus
                                ?.label ??
                            '-',
                      ),
                    if (state.settlementList[index].detail?.paidOutAt != null)
                      SettlementDetailKeyValueRow(
                        label: '실입금 일자:',
                        valueText:
                            state
                                .settlementList[index]
                                .detail
                                ?.paidOutAt
                                ?.toDataAndTimeNoLineBreak ??
                            '-',
                      ),
                  ],

                  if (state.settlementList[index].detail?.status ==
                          SettlementStatusType.hold ||
                      state.settlementList[index].detail?.status ==
                          SettlementStatusType.cancelled) ...[
                    const SizedBox(height: 12),
                    if (state.settlementList[index].detail?.status ==
                        SettlementStatusType.hold) ...[
                      SettlementDetailKeyValueRow(
                        label: '보류사유:',
                        valueText: "클레임으로 인하여 정산이 보류되었습니다.",
                      ),
                      const SizedBox(height: 6),
                    ],

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          state.settlementList[index].detail?.status ==
                                  SettlementStatusType.hold
                              ? Icons.pause_circle_outline
                              : Icons.stop_circle_outlined,
                          color: Colors.red,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            state.settlementList[index].detail?.status ==
                                    SettlementStatusType.hold
                                ? '클레임 처리중으로 정산이 일시중지 되었습니다.'
                                : "환불로 인하여 정산이 취소되었습니다.",
                            style: context.bodySmall.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        if (state.settlementList[index].detail?.claimId != '' &&
                            state.settlementList[index].detail?.claimId !=
                                null) {
                          context.push(
                            '/claim/detail/${state.settlementList[index].detail?.claimId}',
                          );
                        }
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: const CustomButton(
                          title: '클레임 확인하기',
                          boxColor: Colors.red,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 12),

                  // 참고 문구 (상태와 무관하게 항상 노출)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 18,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '실제 입금은 영업일 기준 1~2일 소요될 수 있습니다.',
                          style: context.bodySmall.copyWith(
                            color: AppColors.darkGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.all(isWide ? 200 : 100),
            child: LoadingIndicator(),
          );
  }

  Color getStatusColor(SettlementStatusType status) {
    switch (status) {
      case SettlementStatusType.pending:
        return AppColors.pointColor;
      case SettlementStatusType.hold:
        return Colors.red;
      case SettlementStatusType.confirmed:
        return AppColors.primary;
      case SettlementStatusType.cancelled:
        return Colors.red;
    }
  }
}
