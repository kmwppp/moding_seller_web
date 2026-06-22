import 'package:flutter/material.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/business_profile/domain/entities/seller_profile_edit_file.dart';

const _previewBoxSize = 300.0;

class BusinessProfileFileField extends StatelessWidget {
  const BusinessProfileFileField({
    super.key,
    required this.label,
    this.subLabel = "",
    required this.onTap,
    this.onRemove,
    this.onRemoveAt,
    this.file,
    this.files = const [],
    this.allowMultiple = false,
  });

  final String label;
  final String subLabel;
  final VoidCallback onTap;
  final VoidCallback? onRemove;
  final ValueChanged<int>? onRemoveAt;
  final SellerProfileEditFile? file;
  final List<SellerProfileEditFile> files;
  final bool allowMultiple;

  @override
  Widget build(BuildContext context) {
    final items = allowMultiple
        ? files
        : (file == null ? const <SellerProfileEditFile>[] : [file!]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.body.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        if (subLabel.isNotEmpty) ...[
          Text(
            subLabel,
            style: context.bodySmall.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.pointColor,
            ),
          ),
          const SizedBox(height: 8),
        ],

        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FBF8),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFDCE5DC)),
            ),
            child: allowMultiple
                ? _MultipleFileBox(items: items, onRemoveAt: onRemoveAt)
                : _SingleFileBox(
                    file: items.isEmpty ? null : items.first,
                    label: label,
                    onRemove: onRemove,
                  ),
          ),
        ),
      ],
    );
  }
}

class _SingleFileBox extends StatelessWidget {
  const _SingleFileBox({
    required this.file,
    required this.label,
    this.onRemove,
  });

  final SellerProfileEditFile? file;
  final String label;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    if (file == null) {
      return const _EmptyUploadBox();
    }

    if (_isPreviewableImage(file!.fileName)) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: _previewBoxSize,
                height: _previewBoxSize,
                child: Image.memory(
                  file!.bytes,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.58),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  file!.fileName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodySmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            if (onRemove != null)
              Positioned(
                top: 10,
                right: 10,
                child: _RemoveButton(onTap: onRemove!),
              ),
          ],
        ),
      );
    }

    return _DocumentPreviewCard(file: file!, onRemove: onRemove);
  }
}

class _MultipleFileBox extends StatelessWidget {
  const _MultipleFileBox({required this.items, this.onRemoveAt});

  final List<SellerProfileEditFile> items;
  final ValueChanged<int>? onRemoveAt;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const _EmptyUploadBox(helperText: '클릭해서 파일을 여러 개 선택해주세요.');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '선택된 파일 ${items.length}개',
          style: context.bodySmall.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: _previewBoxSize,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final item = items[index];

              return _isPreviewableImage(item.fileName)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: _previewBoxSize,
                            height: _previewBoxSize,
                            child: Image.memory(
                              item.bytes,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.58),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                item.fileName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.bodySmall.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          if (onRemoveAt != null)
                            Positioned(
                              top: 10,
                              right: 10,
                              child: _RemoveButton(
                                onTap: () => onRemoveAt!(index),
                              ),
                            ),
                        ],
                      ),
                    )
                  : SizedBox(
                      width: _previewBoxSize,
                      child: _DocumentPreviewCard(
                        file: item,
                        onRemove: onRemoveAt == null
                            ? null
                            : () => onRemoveAt!(index),
                      ),
                    );
            },
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: items
              .map(
                (item) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: const Color(0xFFDCE5DC)),
                  ),
                  child: Text(
                    item.fileName,
                    style: context.bodySmall.copyWith(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _EmptyUploadBox extends StatelessWidget {
  const _EmptyUploadBox({this.helperText = '클릭해서 파일을 선택해주세요.'});

  final String helperText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _previewBoxSize,
      height: _previewBoxSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFD9E3D9),
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: Color(0xFFF0F5F0),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add_rounded,
              color: AppColors.darkGrey,
              size: 22,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            helperText,
            style: context.bodySmall.copyWith(
              color: AppColors.darkGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _DocumentPreviewCard extends StatelessWidget {
  const _DocumentPreviewCard({required this.file, this.onRemove});

  final SellerProfileEditFile file;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFD9E3D9)),
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F5F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.insert_drive_file_rounded,
                  color: AppColors.darkGrey,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  file.fileName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.body.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        if (onRemove != null)
          Positioned(
            top: 10,
            right: 10,
            child: _RemoveButton(onTap: onRemove!),
          ),
      ],
    );
  }
}

class _RemoveButton extends StatelessWidget {
  const _RemoveButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(999),
          child: Ink(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.62),
              // shape: BoxShape.circle,
              // border: Border.all(color: Colors.white.withValues(alpha: 0.9)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.close_rounded,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

bool _isPreviewableImage(String fileName) {
  final lower = fileName.toLowerCase();
  return lower.endsWith('.png') ||
      lower.endsWith('.jpg') ||
      lower.endsWith('.jpeg') ||
      lower.endsWith('.gif') ||
      lower.endsWith('.webp');
}
