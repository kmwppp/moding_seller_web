import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../providers/claim_detail/claim_detail_viewmodel.dart';

class ClaimImageGallery extends ConsumerWidget {
  const ClaimImageGallery({
    super.key,
    required this.isWide,
    required this.claimId,
  });

  final bool isWide;
  final String claimId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(claimDetailViewModelProvider(claimId));
    final notifier = ref.read(claimDetailViewModelProvider(claimId).notifier);

    if (isWide) {
      return SizedBox(
        height: 300,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: state.model!.photos.length,
          separatorBuilder: (_, _) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => openFullScreenImageViewer(
                context: context,
                images: state.model!.photos,
                initialIndex: index,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  state.model!.photos[index],
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      );
    } else {
      final pageController = PageController(
        initialPage: state.imageCurrentIndex,
      );
      return AspectRatio(
        aspectRatio: 1 / 1,
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: state.model!.photos.length,
              onPageChanged: (index) => notifier.changeImageCurrentIndex(index),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => openFullScreenImageViewer(
                    context: context,
                    images: state.model!.photos,
                    initialIndex: index,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        state.model!.photos[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 6,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "${state.imageCurrentIndex + 1}/${state.model!.photos.length}",
                    style: context.body.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

void openFullScreenImageViewer({
  required BuildContext context,
  required List<String> images,
  required int initialIndex,
}) {
  showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (_) =>
        _ClaimPhotoViewer(images: images, initialIndex: initialIndex),
  );
}

class _ClaimPhotoViewer extends StatefulWidget {
  const _ClaimPhotoViewer({required this.images, required this.initialIndex});

  final List<String> images;
  final int initialIndex;

  @override
  State<_ClaimPhotoViewer> createState() => _ClaimPhotoViewerState();
}

class _ClaimPhotoViewerState extends State<_ClaimPhotoViewer> {
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
    return Dialog.fullscreen(
      backgroundColor: const Color(0xE6000000),
      child: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Center(
                  child: InteractiveViewer(
                    maxScale: 4.0,
                    child: Image.network(
                      widget.images[index],
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.lightGrey,
                          child: const Icon(Icons.broken_image, size: 60),
                        );
                      },
                    ),
                  ),
                );
              },
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
                      '${_currentIndex + 1} / ${widget.images.length}',
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
}
