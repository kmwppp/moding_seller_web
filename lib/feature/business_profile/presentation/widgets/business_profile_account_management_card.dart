import 'package:flutter/material.dart';
import 'package:moding_president_web/core/theme/app_box_styles.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/business_profile/domain/entities/refund_account_info.dart';
import 'package:moding_president_web/feature/business_profile/presentation/utils/business_profile_formatters.dart';
import 'package:moding_president_web/feature/business_profile/presentation/widgets/business_profile_info_row.dart';

import '../../../../core/presentation/dialogs/app_dialogs.dart';
import '../../../../core/presentation/widgets/text_arrow_widget.dart';
import '../../../../core/services/web_bridge.dart';

class BusinessProfileAccountManagementCard extends StatelessWidget {
  const BusinessProfileAccountManagementCard({
    super.key,
    required this.refundAccount,
  });

  final RefundAccountInfo? refundAccount;

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
                '환불 계좌',
                style: context.bodyLarge.copyWith(fontWeight: FontWeight.w800),
              ),
              Spacer(),
              InkWell(
                onTap: () async {
                  if (isAppWebView) {
                    sendOpenIdentityVerification(successRoute: '/edit_my_info');
                    return;
                  }

                  await AppDialog.showError(context, '환불 계좌는 앱에서 변경해주세요.');
                },
                child: TextArrowWidget(text: "환불 계좌 변경"),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _AccountSection(
            rows: [
              _InfoRowData(
                title: '은행명',
                content: valueOrDash(refundAccount?.bankName),
              ),
              _InfoRowData(
                title: '계좌번호',
                content: valueOrDash(refundAccount?.accountNumber),
              ),
              _InfoRowData(
                title: '예금주',
                content: valueOrDash(refundAccount?.accountHolder),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccountSection extends StatelessWidget {
  const _AccountSection({required this.rows});

  final List<_InfoRowData> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8FBF8),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++)
            BusinessProfileInfoRow(
              title: rows[i].title,
              content: rows[i].content,
              isLast: i == rows.length - 1,
            ),
        ],
      ),
    );
  }
}

class _InfoRowData {
  const _InfoRowData({required this.title, required this.content});

  final String title;
  final String content;
}
