import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/feature/preparing_delivery/presentation/providers/dash_delivery_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/utils/app_enum.dart';
import '../../../../../core/utils/string_util.dart';

class OrderItemsSection extends ConsumerWidget {
  const OrderItemsSection({super.key, required this.orderId});

  final String? orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashDeliveryViewModelProvider(orderId));
    final size = MediaQuery.of(context).size;
    final isWide = size.width >= 900;
    final totalQuantity = state.items.fold<int>(
      0,
      (sum, item) => sum + item.quantity,
    );
    final payment = state.payment;
    final cancelledAmount = (state.payment?.cancelledAmount ?? 0).toInt();
    final netAmount = (state.payment?.netAmount ?? 0).toInt();

    return Container(
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
                    '주문 상품 확인',
                    style: context.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
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
                    '${state.items.length}건',
                    style: context.bodySmall.copyWith(
                      color: AppColors.pointColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Column(
              children: [
                ...state.items.asMap().entries.map((entry) {
                  final e = entry.value;
                  final isLast = entry.key == state.items.length - 1;

                  return Container(
                    margin: EdgeInsets.only(bottom: isLast ? 0 : 8),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE5ECE5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ItemInfoRow(
                          label: '상품명',
                          value: e.productName,
                          labelWidth: isWide ? 120 : 88,
                        ),
                        const SizedBox(height: 8),
                        _ItemInfoRow(
                          label: '옵션 및 수량',
                          value: '${e.optionName ?? ""} × ${e.quantity}개',
                          labelWidth: isWide ? 120 : 88,
                        ),
                        const SizedBox(height: 8),
                        _ItemInfoRow(
                          label: '총 가격',
                          value: '${StringUtil.formatCurrency(e.totalPrice)}원',
                          labelWidth: isWide ? 120 : 88,
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
            if (payment != null) ...[
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5ECE5)),
                ),
                child: Column(
                  children: [
                    _ItemInfoRow(
                      label: '결제 상태',
                      value: _paymentStatusLabel(payment.status),
                      labelWidth: isWide ? 120 : 88,
                    ),
                    const SizedBox(height: 10),
                    _ItemInfoRow(
                      label: '결제 방법',
                      value: _paymentMethodLabel(payment.paymentMethod),
                      labelWidth: isWide ? 120 : 88,
                    ),
                    if (payment.paidAt != null) ...[
                      const SizedBox(height: 10),
                      _ItemInfoRow(
                        label: '결제완료 시각',
                        value: payment.paidAt!.toDataAndTimeNoLineBreak,
                        labelWidth: isWide ? 120 : 88,
                      ),
                    ],
                    if ((payment.receiptUrl ?? '').trim().isNotEmpty) ...[
                      const SizedBox(height: 10),
                      _LinkRow(url: payment.receiptUrl!.trim()),
                    ],
                  ],
                ),
              ),
            ],
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5ECE5)),
              ),
              child: Column(
                children: [
                  _AmountRow(
                    label: '총 상품 수량',
                    value: '${StringUtil.formatCurrency(totalQuantity)}개',
                  ),
                  const SizedBox(height: 10),
                  _AmountRow(
                    label: '취소 및 환불 금액',
                    value: '${StringUtil.formatCurrency(cancelledAmount)}원',
                  ),
                  const SizedBox(height: 10),
                  _AmountRow(
                    label: '최종 결제 금액',
                    value: '${StringUtil.formatCurrency(netAmount)}원',
                    emphasize: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _paymentStatusLabel(String value) {
  switch (value) {
    case 'PENDING':
      return '결제대기';
    case 'PAID':
      return '결제완료';
    case 'PARTIALLY_CANCELLED':
      return '부분취소';
    case 'CANCELLED':
      return '결제취소';
    case 'REFUNDED':
      return '환불완료';
    default:
      return value;
  }
}

String _paymentMethodLabel(String value) {
  switch (value) {
    case 'CARD':
      return '카드';
    case 'VIRTUAL_ACCOUNT':
      return '가상계좌';
    default:
      return value;
  }
}

class _ItemInfoRow extends StatelessWidget {
  const _ItemInfoRow({
    required this.label,
    required this.value,
    required this.labelWidth,
  });

  final String label;
  final String value;
  final double labelWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: labelWidth,
          child: Text(
            label,
            style: context.body.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: context.body.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

class _AmountRow extends StatelessWidget {
  const _AmountRow({
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  final String label;
  final String value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.body.copyWith(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: emphasize
              ? context.bodyLarge.copyWith(fontWeight: FontWeight.w800)
              : context.body.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _LinkRow extends StatelessWidget {
  const _LinkRow({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '결제 영수증',
          style: context.body.copyWith(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () async {
            final uri = Uri.tryParse(url);
            if (uri == null) {
              return;
            }
            await launchUrl(uri, mode: LaunchMode.platformDefault);
          },
          child: Text(
            '영수증 보기',
            style: context.body.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
