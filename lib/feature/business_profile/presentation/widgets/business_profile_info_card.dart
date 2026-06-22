import 'package:flutter/material.dart';
import 'package:moding_president_web/core/theme/app_box_styles.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/business_profile/domain/entities/business_profile.dart';
import 'package:moding_president_web/feature/business_profile/presentation/utils/business_profile_formatters.dart';
import 'package:moding_president_web/feature/business_profile/presentation/widgets/business_profile_info_row.dart';

import '../../../../core/presentation/dialogs/app_dialogs.dart';
import '../../../../core/presentation/widgets/text_arrow_widget.dart';
import '../../../../core/services/web_bridge.dart';

class BusinessProfileInfoCard extends StatelessWidget {
  const BusinessProfileInfoCard({super.key, required this.profile});

  final BusinessProfile profile;

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
                '사업자 정보',
                style: context.bodyLarge.copyWith(fontWeight: FontWeight.w800),
              ),
              Spacer(),
              InkWell(
                onTap: () async {
                  if (isAppWebView) {
                    sendOpenIdentityVerification(successRoute: '/edit_my_info');
                    return;
                  }

                  await AppDialog.showError(context, '사업자 정보는 앱에서 변경해주세요.');
                },
                child: TextArrowWidget(text: "사업자 정보 변경"),
              ),
            ],
          ),
          const SizedBox(height: 18),
          BusinessProfileInfoRow(
            title: '상호명',
            content: valueOrDash(profile.businessName),
          ),
          BusinessProfileInfoRow(
            title: '주소',
            content: composeBusinessAddress(profile),
          ),
          BusinessProfileInfoRow(
            title: '사업자등록번호',
            content: valueOrDash(profile.businessNumber),
          ),
          BusinessProfileInfoRow(
            title: '대표자명',
            content: valueOrDash(profile.ownerName),
          ),
          BusinessProfileInfoRow(
            title: '업종 대/소분류',
            content: composeBusinessCategory(profile),
          ),
          BusinessProfileInfoRow(
            title: '업태 / 종목',
            content: composeBusinessIndustry(profile),
          ),
          BusinessProfileInfoRow(
            title: '사업장 전화번호',
            content: valueOrDash(profile.businessPhone),
            isLast: true,
          ),
        ],
      ),
    );
  }
}
