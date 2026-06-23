import 'package:flutter/material.dart';
import 'package:moding_seller_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_seller_web/core/services/web_bridge.dart';
import 'package:moding_seller_web/core/theme/app_box_styles.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/business_profile/domain/entities/my_account_info.dart';
import 'package:moding_seller_web/feature/business_profile/presentation/utils/business_profile_formatters.dart';
import 'package:moding_seller_web/feature/business_profile/presentation/widgets/business_profile_info_row.dart';

import '../../../../core/presentation/widgets/text_arrow_widget.dart';

class BusinessProfileAccountInfoCard extends StatelessWidget {
  const BusinessProfileAccountInfoCard({super.key, required this.accountInfo});

  final MyAccountInfo? accountInfo;

  @override
  Widget build(BuildContext context) {
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
            children: [
              Text(
                '계정 정보',
                style: context.bodyLarge.copyWith(fontWeight: FontWeight.w800),
              ),
              Spacer(),
              InkWell(
                onTap: () async {
                  if (isAppWebView) {
                    sendOpenIdentityVerification(
                      successRoute: '/edit_my_info',
                    );
                    return;
                  }

                  await AppDialog.showError(
                    context,
                    '계정정보는 앱에서 변경해주세요.',
                  );
                },
                child: TextArrowWidget(text: "계정정보 변경"),
              ),
            ],
          ),
          const SizedBox(height: 18),
          BusinessProfileInfoRow(
            title: '아이디',
            content: valueOrDash(accountInfo?.loginId),
          ),
          BusinessProfileInfoRow(
            title: '사업자명',
            content: valueOrDash(accountInfo?.name),
          ),
          BusinessProfileInfoRow(
            title: '이메일',
            content: valueOrDash(accountInfo?.email),
          ),
          BusinessProfileInfoRow(
            title: '연락처',
            content: valueOrDash(accountInfo?.phone),
            isLast: true,
          ),
        ],
      ),
    );
  }
}
