import 'package:flutter/material.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_box_styles.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/support/domain/enums/support_center_type.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessProfileSupportSection extends StatelessWidget {
  const BusinessProfileSupportSection({super.key, required this.onOpenSupport});

  final ValueChanged<SupportCenterType> onOpenSupport;

  static final Uri _kakaoUri = Uri.parse('https://pf.kakao.com/_CixjCX');

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
          Text(
            '고객센터',
            style: context.bodyLarge.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            '궁금한 점이 있으면 공지와 FAQ를 먼저 확인하고, 추가 문의는 카카오톡으로 이어가보세요.',
            style: context.body.copyWith(
              color: AppColors.darkGrey,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          InkWell(
            onTap: _openKakao,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: double.infinity,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFFFEE500),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/icons/kakaoTalkIcon.png',
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '카카오톡 문의하기',
                    style: context.body.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _SupportActionButton(
                  label: '공지사항',
                  onTap: () => onOpenSupport(SupportCenterType.notice),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _SupportActionButton(
                  label: '자주 묻는 질문',
                  onTap: () => onOpenSupport(SupportCenterType.faq),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _openKakao() async {
    await launchUrl(_kakaoUri, mode: LaunchMode.platformDefault);
  }
}

class _SupportActionButton extends StatelessWidget {
  const _SupportActionButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFDCE5DC)),
        ),
        child: Text(
          label,
          style: context.body.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
