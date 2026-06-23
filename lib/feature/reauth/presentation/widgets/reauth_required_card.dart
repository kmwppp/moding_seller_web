import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/theme/app_box_styles.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/reauth/presentation/providers/reauth_viewmodel.dart';

class ReauthRequiredCard extends ConsumerStatefulWidget {
  const ReauthRequiredCard({
    super.key,
    required this.onSuccess,
    this.title = '비밀번호 재확인',
    this.description = '민감한 정보를 확인하기 전에 계정 비밀번호를 다시 입력해주세요.',
    this.buttonLabel = '확인',
  });

  final Future<void> Function() onSuccess;
  final String title;
  final String description;
  final String buttonLabel;

  @override
  ConsumerState<ReauthRequiredCard> createState() => _ReauthRequiredCardState();
}

class _ReauthRequiredCardState extends ConsumerState<ReauthRequiredCard> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();

    final message = await ref
        .read(reauthViewModelProvider.notifier)
        .submitPassword(_passwordController.text);

    if (!mounted) {
      return;
    }

    if (message != null && message.isNotEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
        );
      return;
    }

    _passwordController.clear();
    await widget.onSuccess();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reauthViewModelProvider);

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
            widget.title,
            style: context.bodyLarge.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text(
            widget.description,
            style: context.body.copyWith(
              color: AppColors.darkGrey,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: _passwordController,
            obscureText: true,
            onSubmitted: (_) => _submit(),
            style: context.body,
            decoration: InputDecoration(
              hintText: '비밀번호를 입력해주세요',
              hintStyle: context.body.copyWith(color: AppColors.darkGrey),
              filled: true,
              fillColor: const Color(0xFFF9FBF9),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppColors.boxBorderGrey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppColors.boxBorderGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: state.isSubmitting ? null : _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: state.isSubmitting
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      widget.buttonLabel,
                      style: context.body.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
