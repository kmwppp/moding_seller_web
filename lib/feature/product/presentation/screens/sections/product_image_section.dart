import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/feature/product/presentation/screens/widgets/product_label.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/theme/app_box_styles.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../providers/product_register/product_register_viewmodel.dart';
import '../widgets/product_guide_info.dart';

class ProductImageSection extends ConsumerWidget {
  const ProductImageSection({super.key, required this.productId});

  final String? productId;

  Future<void> _pickImage(
    BuildContext context,
    WidgetRef ref,
    _ProductImageType type,
  ) async {
    final vm = ref.read(productRegisterViewModelProvider(productId).notifier);

    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: type != _ProductImageType.main,
    );

    if (result == null || result.files.isEmpty) return;

    if (type == _ProductImageType.main) {
      final f = result.files.first;

      if (f.bytes != null) {
        vm.updateMainImage(f.bytes); // bytes로 통일
      }
    } else if (type == _ProductImageType.gallery) {
      final files = result.files
          .where((f) => f.bytes != null)
          .map((f) => f.bytes!)
          .toList();

      vm.addGalleryImages(files);
    } else {
      final files = result.files
          .where((f) => f.bytes != null)
          .map((f) => f.bytes!)
          .toList();

      vm.addDescriptionImages(files);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productRegisterViewModelProvider(productId));
    final vm = ref.read(productRegisterViewModelProvider(productId).notifier);
    final isWeb = MediaQuery.of(context).size.width > 600;

    return Container(
      width: double.infinity,
      decoration: AppBoxStyles.borderBox,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '상품 이미지 등록',
              style: context.bodyLarge.copyWith(fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 16),

            /// 대표 이미지
            ProductLabel(
              "대표 이미지",
              required: true,
              caption: "실제 상품이 잘 보이는 이미지를 등록해주세요.",
              guide: ProductGuideInfo(
                title: "상품 이미지는 실제 상품을 기준으로 등록해야 합니다.",
                body: [
                  "상품의 형태와 구성이 명확히 보이는 이미지 사용",
                  "과도한 보정 이미지, AI 생성 이미지는 반려될 수 있습니다.",
                ],
                caption: "※ 이미지 품질은 구매 전환에 직접적인 영향을 줍니다.",
              ),
            ),

            const SizedBox(height: 8),

            GestureDetector(
              onTap: () => _pickImage(context, ref, _ProductImageType.main),
              child: SizedBox(
                width: isWeb ? 200 : double.infinity, // 여기로 이동
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.boxBorderGrey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _buildImagePreview(
                      state.mainImage,
                      size: double.infinity,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// 추가 이미지
            ProductLabel("추가이미지"),

            const SizedBox(height: 8),

            _buildImageList(
              context: context,
              items: state.galleryImages,
              onAdd: () => _pickImage(context, ref, _ProductImageType.gallery),
              onRemove: vm.removeGalleryImage,
            ),
            const SizedBox(height: 20),

            ProductLabel("상품 설명 이미지"),
            const SizedBox(height: 8),
            _buildImageList(
              context: context,
              items: state.descriptionImages,
              onAdd: () =>
                  _pickImage(context, ref, _ProductImageType.description),
              onRemove: vm.removeDescriptionImage,
            ),
          ],
        ),
      ),
    );
  }

  Wrap _buildImageList({
    required BuildContext context,
    required List<dynamic> items,
    required VoidCallback onAdd,
    required void Function(int index) onRemove,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ...items.asMap().entries.map((e) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () => _showImageViewer(context, items, e.key),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: _buildImagePreview(e.value, size: 80),
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  icon: const Icon(Icons.close, size: 14, color: Colors.white),
                  style: IconButton.styleFrom(backgroundColor: Colors.black54),
                  onPressed: () => onRemove(e.key),
                ),
              ),
            ],
          );
        }),

        GestureDetector(
          onTap: onAdd,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.boxBorderGrey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.add_photo_alternate_outlined,
              color: AppColors.darkGrey,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showImageViewer(
    BuildContext context,
    List<dynamic> items,
    int initialIndex,
  ) async {
    final previewableItems = items.where(_canPreviewImage).toList();
    if (previewableItems.isEmpty) return;

    final safeIndex = initialIndex.clamp(0, previewableItems.length - 1);

    await showDialog<void>(
      context: context,
      builder: (_) => _ProductImageViewer(
        items: previewableItems,
        initialIndex: safeIndex,
      ),
    );
  }

  bool _canPreviewImage(dynamic source) {
    if (source == null) return false;
    if (source is Uint8List) return true;
    if (source is File) return true;
    if (source is String && source.trim().isNotEmpty) return true;
    return false;
  }

  Widget _buildImagePreview(dynamic source, {required double size}) {
    if (source == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_a_photo, color: AppColors.darkGrey, size: 32),
            const SizedBox(height: 4),
            Text(
              '클릭하여 선택',
              style: TextStyle(fontSize: 10, color: AppColors.darkGrey),
            ),
          ],
        ),
      );
    }

    /// Web / Memory 이미지
    if (source is Uint8List) {
      return Image.memory(source, fit: BoxFit.cover, width: size, height: size);
    }

    /// Mobile File 이미지
    if (source is File) {
      return Image.file(source, fit: BoxFit.cover, width: size, height: size);
    }

    /// 서버 URL 이미지
    if (source is String && source.trim().isNotEmpty) {
      final imageUrl = source.trim();
      return Image.network(
        imageUrl,
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

enum _ProductImageType { main, gallery, description }

class _ProductImageViewer extends StatefulWidget {
  const _ProductImageViewer({
    required this.items,
    required this.initialIndex,
  });

  final List<dynamic> items;
  final int initialIndex;

  @override
  State<_ProductImageViewer> createState() => _ProductImageViewerState();
}

class _ProductImageViewerState extends State<_ProductImageViewer> {
  late final PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;
    final showArrowButtons = kIsWeb && widget.items.length > 1;

    return Dialog.fullscreen(
      backgroundColor: const Color(0xE6000000),
      child: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.items.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final item = widget.items[index];

                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isWide ? 56 : 20,
                      vertical: isWide ? 32 : 20,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        color: Colors.black,
                        child: InteractiveViewer(
                          minScale: 0.8,
                          maxScale: 4,
                          constrained: false,
                          boundaryMargin: const EdgeInsets.all(120),
                          child: _buildViewerImage(item),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            if (showArrowButtons)
              Positioned(
                left: isWide ? 24 : 8,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _ViewerArrowButton(
                    icon: Icons.chevron_left,
                    onPressed: _currentIndex > 0 ? _goToPrevious : null,
                  ),
                ),
              ),
            if (showArrowButtons)
              Positioned(
                right: isWide ? 24 : 8,
                top: 0,
                bottom: 0,
                child: Center(
                  child: _ViewerArrowButton(
                    icon: Icons.chevron_right,
                    onPressed: _currentIndex < widget.items.length - 1
                        ? _goToNext
                        : null,
                  ),
                ),
              ),
            Positioned(
              top: 16,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0x3DFFFFFF),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      '${_currentIndex + 1} / ${widget.items.length}',
                      style: context.bodySmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0x3DFFFFFF),
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewerImage(dynamic source) {
    if (source is Uint8List) {
      return _viewerFrame(
        child: Image.memory(source, fit: BoxFit.contain),
      );
    }

    if (source is File) {
      return _viewerFrame(
        child: Image.file(source, fit: BoxFit.contain),
      );
    }

    if (source is String && source.trim().isNotEmpty) {
      return _viewerFrame(
        child: Image.network(
          source.trim(),
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const SizedBox(
              width: 120,
              height: 120,
              child: Center(child: CircularProgressIndicator()),
            );
          },
          errorBuilder: (context, error, stackTrace) => Container(
            color: const Color(0xFF141414),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(24),
            child: Text(
              '이미지를 불러올 수 없어요.',
              style: context.body.copyWith(color: Colors.white70),
            ),
          ),
        ),
      );
    }

    return _viewerFrame(
      child: Container(
        color: const Color(0xFF141414),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(24),
        child: Text(
          '이미지를 불러올 수 없어요.',
          style: context.body.copyWith(color: Colors.white70),
        ),
      ),
    );
  }

  Widget _viewerFrame({required Widget child}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width * 0.82;
        final maxHeight = constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : MediaQuery.of(context).size.height * 0.82;

        return SizedBox(
          width: maxWidth,
          height: maxHeight,
          child: Center(child: child),
        );
      },
    );
  }

  Future<void> _goToPrevious() async {
    if (_currentIndex <= 0) return;
    await _pageController.previousPage(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _goToNext() async {
    if (_currentIndex >= widget.items.length - 1) return;
    await _pageController.nextPage(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
    );
  }
}

class _ViewerArrowButton extends StatelessWidget {
  const _ViewerArrowButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: onPressed == null
            ? const Color(0x1FFFFFFF)
            : const Color(0x3DFFFFFF),
        foregroundColor: onPressed == null ? Colors.white38 : Colors.white,
        minimumSize: const Size(52, 52),
      ),
      icon: Icon(icon, size: 30),
    );
  }
}
