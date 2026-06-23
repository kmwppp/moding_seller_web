import 'package:flutter/material.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/review/domain/entities/review_item.dart';
import 'package:moding_seller_web/feature/review/presentation/widgets/review_photo_viewer.dart';

class ReviewPhotoStrip extends StatelessWidget {
  const ReviewPhotoStrip({super.key, required this.photos});

  final List<ReviewPhoto> photos;

  @override
  Widget build(BuildContext context) {
    if (photos.isEmpty) {
      return Container(
        height: 88,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          '첨부된 리뷰 이미지가 없어요.',
          style: context.bodySmall.copyWith(color: AppColors.darkGrey),
        ),
      );
    }

    return SizedBox(
      height: 108,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final photo = photos[index];

          return GestureDetector(
            onTap: () => showDialog<void>(
              context: context,
              barrierColor: const Color(0xD9000000),
              builder: (_) =>
                  ReviewPhotoViewer(photos: photos, initialIndex: index),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 108,
                height: 108,
                color: AppColors.lightGrey,
                child: Image.network(
                  photo.photoUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.lightGrey,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '이미지를\n불러올 수 없어요',
                        textAlign: TextAlign.center,
                        style: context.caption.copyWith(
                          color: AppColors.darkGrey,
                          height: 1.4,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
