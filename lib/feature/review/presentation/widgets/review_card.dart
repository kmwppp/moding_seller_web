import 'package:flutter/material.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/theme/app_box_styles.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/review/domain/entities/review_item.dart';
import 'package:moding_seller_web/feature/review/presentation/widgets/review_photo_strip.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.item});

  static final Uri _deleteRequestUri = Uri.parse(
    'https://pf.kakao.com/_CixjCX',
  );

  final ReviewItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxStyles.borderBox.copyWith(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _InfoChip(label: '작성자', value: item.name),
              _InfoChip(label: '구매옵션', value: item.orderItemOptionName),
              _InfoChip(label: '작성일', value: _formatDate(item.createdAt)),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(
                item.productName,
                style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton.tonal(
                  onPressed: _openDeleteRequest,
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFFFF1E2),
                    foregroundColor: const Color(0xFF8F4D00),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    '삭제요청',
                    style: context.bodySmall.copyWith(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FBF8),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE4EEE4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.content.isNotEmpty ? item.content : '리뷰 내용이 없습니다.',
                  style: context.body.copyWith(height: 1.6),
                ),
                const SizedBox(height: 14),
                ReviewPhotoStrip(photos: item.photos),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openDeleteRequest() async {
    await launchUrl(_deleteRequestUri, mode: LaunchMode.platformDefault);
  }

  String _formatDate(DateTime dateTime) {
    String two(int value) => value.toString().padLeft(2, '0');
    return '${dateTime.year}.${two(dateTime.month)}.${two(dateTime.day)}';
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.boxBorderGrey),
      ),
      child: RichText(
        text: TextSpan(
          style: context.bodySmall,
          children: [
            TextSpan(
              text: '$label ',
              style: context.bodySmall.copyWith(color: AppColors.darkGrey),
            ),
            TextSpan(
              text: value.isNotEmpty ? value : '-',
              style: context.bodySmall.copyWith(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
