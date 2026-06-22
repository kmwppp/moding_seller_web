import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:moding_president_web/feature/product/presentation/screens/widgets/product_guide_info.dart';
import 'package:moding_president_web/feature/product/presentation/screens/widgets/product_label.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/theme/app_box_styles.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class FoodInfoSection extends StatelessWidget {
  const FoodInfoSection({
    super.key,
    required this.ingredientImage,
    required this.onIngredientImageChanged,
  });

  final dynamic ingredientImage; // ✅ dynamic으로 변경
  final ValueChanged<Uint8List> onIngredientImageChanged;

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null || result.files.isEmpty) return;

    final bytes = result.files.first.bytes;

    /// 웹에서는 bytes가 무조건 있음
    if (bytes != null) {
      onIngredientImageChanged(bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 600;

    return Container(
      decoration: AppBoxStyles.borderBox,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductLabel(
            "식품 성분 표시 정보",
            isTitle: true,
            required: true,
            caption: "식품 표시 스티커 이미지를 등록해주세요.",
            guide: ProductGuideInfo(
              title: "식품 표시 스티커(원재료, 알레르기, 제조정보 등)를 등록하는 영역입니다.",
              body: [],
              caption: "※ 실제 제품과 동일한 정보를 업로드해야 합니다.",
              caption2: "※ 식품위생법 기준 필수 항목입니다.",
            ),
          ),

          const SizedBox(height: 16),

          GestureDetector(
            onTap: _pickImage,
            child: SizedBox(
              width: isWeb ? 200 : double.infinity,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.boxBorderGrey),
                    borderRadius: BorderRadius.circular(10),
                    color: ingredientImage == null
                        ? AppColors.lightGrey
                        : Colors.black,
                  ),
                  child: ingredientImage == null
                      ? _emptyView(context)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: _buildImagePreview(
                            ingredientImage,
                            size: double.infinity,
                            context: context,
                          ),
                        ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline, size: 16, color: AppColors.pointColor),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  '원재료명, 알레르기, 보관방법, 제조원 등 법적 고지사항은 업로드된 식품 표시 스티커 및 상품 상세페이지에서 노출됩니다.',
                  style: context.caption.copyWith(color: AppColors.darkGrey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _emptyView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_photo_alternate_outlined, color: AppColors.darkGrey),
          const SizedBox(height: 4),
          Text(
            '이미지 업로드',
            style: context.caption.copyWith(color: AppColors.darkGrey),
          ),
        ],
      ),
    );
  }

  /// 서버 URL과 로컬 이미지를 모두 처리
  Widget _buildImagePreview(
    dynamic source, {
    required double size,
    required BuildContext context,
  }) {
    if (source == null) {
      return _emptyView(context);
    }

    if (source is Uint8List) {
      return Image.memory(source, fit: BoxFit.cover, width: size, height: size);
    }

    if (source is File) {
      return Image.file(source, fit: BoxFit.cover, width: size, height: size);
    }

    if (source is String && source.startsWith('http')) {
      return Image.network(
        source,
        fit: BoxFit.cover,
        width: size,
        height: size,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) =>
            Center(child: Icon(Icons.broken_image, color: AppColors.darkGrey)),
      );
    }

    return Center(child: Icon(Icons.image, color: AppColors.darkGrey));
  }
}
