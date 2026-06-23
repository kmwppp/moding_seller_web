import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/review/domain/entities/review_item.dart';

class ReviewPhotoViewer extends StatefulWidget {
  const ReviewPhotoViewer({
    super.key,
    required this.photos,
    required this.initialIndex,
  });

  final List<ReviewPhoto> photos;
  final int initialIndex;

  @override
  State<ReviewPhotoViewer> createState() => _ReviewPhotoViewerState();
}

class _ReviewPhotoViewerState extends State<ReviewPhotoViewer> {
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
    final showArrowButtons = kIsWeb && widget.photos.length > 1;

    return Dialog.fullscreen(
      backgroundColor: const Color(0xE6000000),
      child: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.photos.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final photo = widget.photos[index];

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
                          child: Image.network(
                            photo.photoUrl,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: const Color(0xFF141414),
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(24),
                                child: Text(
                                  '이미지를 불러올 수 없어요.',
                                  style: context.body.copyWith(
                                    color: Colors.white70,
                                  ),
                                ),
                              );
                            },
                          ),
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
                  child: _ArrowButton(
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
                  child: _ArrowButton(
                    icon: Icons.chevron_right,
                    onPressed: _currentIndex < widget.photos.length - 1
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
                      '${_currentIndex + 1} / ${widget.photos.length}',
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
            if (widget.photos.length > 1)
              Positioned(
                bottom: 22,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0x3DFFFFFF),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      '좌우로 넘겨 다른 이미지를 볼 수 있어요',
                      style: context.caption.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _goToPrevious() async {
    if (_currentIndex <= 0) {
      return;
    }

    await _pageController.previousPage(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _goToNext() async {
    if (_currentIndex >= widget.photos.length - 1) {
      return;
    }

    await _pageController.nextPage(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({required this.icon, required this.onPressed});

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
