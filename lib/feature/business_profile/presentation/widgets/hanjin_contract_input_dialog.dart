import 'package:flutter/material.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';

class HanjinContractInputDialog extends StatefulWidget {
  const HanjinContractInputDialog({super.key, this.initialValue});

  final String? initialValue;

  @override
  State<HanjinContractInputDialog> createState() =>
      _HanjinContractInputDialogState();
}

class _HanjinContractInputDialogState extends State<HanjinContractInputDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
      actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      title: Text(
        '한진 택배코드 ${_controller.text.trim().isEmpty ? '등록' : '수정'}',
        style: context.bodyLarge.copyWith(fontWeight: FontWeight.w800),
      ),
      content: SizedBox(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '한진 원클릭 배송과 연결되는 한진 계약 번호를 입력해주세요.',
              style: context.body.copyWith(
                color: AppColors.darkGrey,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              style: context.body,
              decoration: InputDecoration(
                hintText: '예: S12345678',
                hintStyle: context.body.copyWith(color: AppColors.darkGrey),
                filled: true,
                fillColor: const Color(0xFFF8FBF8),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFDDE6DD)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFDDE6DD)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('취소'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(_controller.text.trim()),
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
          ),
          child: const Text('저장'),
        ),
      ],
    );
  }
}
