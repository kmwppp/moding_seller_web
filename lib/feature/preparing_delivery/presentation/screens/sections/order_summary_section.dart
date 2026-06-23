import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/feature/preparing_delivery/presentation/providers/dash_delivery_viewmodel.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_box_styles.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../order/domain/enums/order_status_enum.dart';

class OrderSummarySection extends ConsumerWidget {
  const OrderSummarySection({super.key, required this.orderId});

  final String? orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashDeliveryViewModelProvider(orderId));
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
                    '주문 요약',
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
                    color: const Color(0xFFEFF7EF),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '기본 정보',
                    style: context.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            _KeyValueRow(label: '주문번호', value: state.orderCode),
            const SizedBox(height: 10),
            _KeyValueRow(
              label: '주문 상태',
              value: state.orderStatus.toOrderStatus().label,
            ),
            const SizedBox(height: 10),
            _KeyValueRow(label: '주문일시', value: state.orderDate),
            const SizedBox(height: 10),
            _KeyValueRow(label: '수취인', value: state.recipientName),
            const SizedBox(height: 10),
            _KeyValueRow(label: '배송지', value: state.address),
            const SizedBox(height: 10),
            _KeyValueRow(label: '전화번호', value: state.phone),
            const SizedBox(height: 10),
            _KeyValueRow(
              label: '주문 상품',
              value: state.items.isEmpty ? '-' : state.items[0].productName,
            ),
            const SizedBox(height: 10),
            _KeyValueRow(label: '요청 사항', value: state.deliveryRequest),
          ],
        ),
      ),
    );
  }
}

class _KeyValueRow extends StatelessWidget {
  const _KeyValueRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width >= 900;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: isWide ? 120 : 88,
          padding: const EdgeInsets.only(top: 2),
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
            value.isEmpty ? '-' : value,
            style: context.body.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
