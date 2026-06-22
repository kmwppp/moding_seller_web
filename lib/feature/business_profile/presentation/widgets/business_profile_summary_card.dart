import 'package:flutter/material.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_box_styles.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/business_profile/domain/entities/business_profile.dart';
import 'package:moding_president_web/feature/business_profile/presentation/utils/business_profile_formatters.dart';

class BusinessProfileSummaryCard extends StatelessWidget {
  const BusinessProfileSummaryCard({super.key, required this.profile});

  final BusinessProfile? profile;

  @override
  Widget build(BuildContext context) {
    final title = profile == null
        ? '재인증 후 사업자 정보를 확인할 수 있어요.'
        : valueOrDash(profile!.businessName);
    final subtitle = profile == null
        ? '비밀번호를 다시 입력하면 민감한 사업자 정보를 안전하게 불러옵니다.'
        : composeBusinessAddress(profile!);

    return Container(
      width: double.infinity,
      decoration: AppBoxStyles.borderBox.copyWith(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFFF7FBF7), Color(0xFFFFFFFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Color(0xFFEAF6E8),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.storefront_outlined,
              color: AppColors.primary,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.bodyLarge.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: context.body.copyWith(
                    color: AppColors.darkGrey,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
