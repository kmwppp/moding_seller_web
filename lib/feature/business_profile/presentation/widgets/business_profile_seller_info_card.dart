import 'package:flutter/material.dart';
import 'package:moding_seller_web/core/presentation/widgets/text_arrow_widget.dart';
import 'package:moding_seller_web/core/theme/app_box_styles.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/business_profile/domain/entities/seller_profile_info.dart';
import 'package:moding_seller_web/feature/business_profile/presentation/utils/business_profile_formatters.dart';
import 'package:moding_seller_web/feature/business_profile/presentation/widgets/business_profile_info_row.dart';

class BusinessProfileSellerInfoCard extends StatelessWidget {
  const BusinessProfileSellerInfoCard({
    super.key,
    required this.sellerProfile,
    required this.onEditPressed,
  });

  final SellerProfileInfo? sellerProfile;
  final VoidCallback onEditPressed;

  @override
  Widget build(BuildContext context) {
    final bankName = valueOrDash(sellerProfile?.bankName);
    final bankAccountNumber = valueOrDash(sellerProfile?.bankAccountNumber);
    final bankAccountHolder = valueOrDash(sellerProfile?.bankAccountHolder);
    final settlementAccount = bankName == '-' && bankAccountNumber == '-'
        ? '-'
        : '[$bankName] $bankAccountNumber (예금주: $bankAccountHolder)';

    return Container(
      width: double.infinity,
      decoration: AppBoxStyles.borderBox.copyWith(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '판매자 정보',
                style: context.bodyLarge.copyWith(fontWeight: FontWeight.w800),
              ),
              Spacer(),
              InkWell(
                onTap: onEditPressed,
                child: TextArrowWidget(text: "판매자 정보 변경"),
              ),
            ],
          ),
          const SizedBox(height: 18),
          BusinessProfileInfoRow(
            title: '과세',
            content: mapTaxTypeLabel(sellerProfile?.taxType),
          ),
          BusinessProfileInfoRow(title: '정산계좌', content: settlementAccount),
          BusinessProfileInfoRow(
            title: '판매 가능 상품 수',
            content: sellerProfile?.productLimit == null
                ? '-'
                : '${sellerProfile!.productLimit}개',
            isLast: true,
          ),
        ],
      ),
    );
  }
}
