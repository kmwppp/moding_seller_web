import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/theme/app_input_decoration.dart';
import 'package:moding_seller_web/feature/product/presentation/providers/product_register/product_register_viewmodel.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/theme/app_box_styles.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class ReturnInfoSection extends ConsumerWidget {
  const ReturnInfoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(productRegisterViewModelProvider(null).notifier);

    return Container(
      decoration: AppBoxStyles.borderBox,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '반품 및 교환 정보',
            style: context.bodyLarge.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),

          /// 반품지 주소
          _Label('반품지 주소'),
          const SizedBox(height: 8),
          TextField(
            maxLines: 2,
            onChanged: vm.updateReturnAddress,
            decoration: AppInputDecoration.focusDecoration("반품지 주소를 입력하세요."),
          ),

          const SizedBox(height: 12),

          /// 초도 배송비
          _Label('초도 배송비(편도)'),
          const SizedBox(height: 8),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: vm.updateInitialShippingFee,
            decoration: AppInputDecoration.focusDecoration("ex) 3000"),
          ),

          const SizedBox(height: 12),

          /// 반품 배송비
          _Label('반품 배송비(편도)'),
          const SizedBox(height: 8),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: vm.updateReturnShippingFee,
            decoration: AppInputDecoration.focusDecoration("ex) 3000"),
          ),

          const SizedBox(height: 12),

          /// 안내문
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline, size: 16, color: Colors.red),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  '고객사유로 인한 반품 시, 왕복 반품/배송비는 초도배송비 + 반품배송비의 합계 금액이 청구됩니다.',
                  style: context.caption.copyWith(color: AppColors.darkGrey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.body.copyWith(
        color: AppColors.darkGrey,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
