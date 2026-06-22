import 'package:flutter/material.dart';
import 'package:moding_president_web/core/presentation/enums/order_reject_reason_enum.dart';
import 'package:moding_president_web/core/theme/app_input_decoration.dart';
import 'package:moding_president_web/core/utils/app_enum.dart';
import 'package:moding_president_web/core/utils/string_util.dart';

import '../../../feature/dash_board/presentation/screens/widgets/custom_button.dart';
import '../../../feature/order/domain/entities/order_model.dart';
import '../../constants/app_colors.dart';
import '../../theme/app_text_styles.dart';

class NewOrderCheck extends StatelessWidget {
  const NewOrderCheck({
    super.key,
    required this.isDashBoard,
    required this.model,
    this.onConfirm,
    this.onReject,
  });

  final void Function()? onConfirm;
  final void Function(RejectModel rejectModel)? onReject;
  final bool isDashBoard;
  final OrderModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "주문 시간: ${model.createdAt.toDataAndTimeNoLineBreak}",
            style: context.body,
          ),
          SizedBox(height: 6),
          Text("상품명: ${model.items[0].productName}", style: context.body),
          SizedBox(height: 6),
          Text("수령 주소: ${model.deliveryAddressFull}", style: context.body),
          SizedBox(height: 6),
          Text("주문자: ${model.buyerBusinessName}", style: context.body),
          SizedBox(height: 6),
          Text(
            "주문 단가 및 수량: ${StringUtil.formatCurrency(model.items[0].unitPrice)}원 * ${model.items[0].quantity}",
            style: context.body,
          ),
          SizedBox(height: 6),
          Text(
            "주문 금액: ${StringUtil.formatCurrency(model.items[0].totalPrice)}원",
            style: context.body,
          ),
          SizedBox(height: 60),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    onConfirm?.call();
                  },
                  child: CustomButton(
                    title: "주문 승인",
                    paddingVertical: 6,
                    boxColor: AppColors.primary,
                    textColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 6),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();

                    final rejectModel = await _showRejectReasonDialog(context);

                    if (rejectModel != null) {
                      onReject?.call(rejectModel);
                    }
                  },
                  child: CustomButton(
                    title: "주문 거절",
                    paddingVertical: 6,
                    boxColor: AppColors.pointColor,
                    textColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<RejectModel?> _showRejectReasonDialog(BuildContext context) async {
    OrderRejectReasonEnum? selected;
    final TextEditingController etcController = TextEditingController();

    final result = await showDialog<RejectModel>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text("거절 사유 선택", style: context.title),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final reason in OrderRejectReasonEnum.values)
                      _buildReasonItem(
                        context: context,
                        label: reason.label,
                        selected: selected?.label ?? '',
                        onTap: () {
                          setState(() {
                            selected = reason;
                          });
                        },
                      ),

                    if (selected == OrderRejectReasonEnum.other) ...[
                      const SizedBox(height: 8),
                      TextField(
                        controller: etcController,
                        style: context.body,
                        decoration: AppInputDecoration.focusDecoration(
                          "사유를 입력해주세요.",
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      if (selected == null) return;

                      Navigator.of(context).pop(
                        RejectModel(
                          reason: selected!,
                          etcReason: selected == OrderRejectReasonEnum.other
                              ? etcController.text
                              : null,
                        ),
                      );
                    },
                    child: CustomButton(
                      title: "거절 확정",
                      boxColor: Colors.red,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );

    return result;
  }

  Widget _buildReasonItem({
    required BuildContext context,
    required String label,
    required String selected,
    required VoidCallback onTap,
  }) {
    final bool isSelected = selected == label;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
          ),
          color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.white,
        ),
        child: Text(
          label,
          style: context.body.copyWith(
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class RejectModel {
  final OrderRejectReasonEnum reason;
  final String? etcReason;

  RejectModel({required this.reason, this.etcReason});
}
