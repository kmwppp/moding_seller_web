import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/services/token_storage.dart';
import 'package:moding_seller_web/core/theme/app_text_styles.dart';
import 'package:moding_seller_web/feature/auth/presentation/widgets/auth_center_card.dart';
import 'package:moding_seller_web/feature/auth/presentation/widgets/auth_page_header.dart';

class AuthResultCard extends ConsumerWidget {
  const AuthResultCard({
    super.key,
    required this.title,
    required this.description,
    required this.resultLabel,
    required this.resultValue,
    required this.primaryButtonText,
    this.onPrimaryTap,
  });

  final String title;
  final String description;
  final String resultLabel;
  final String resultValue;
  final String primaryButtonText;
  final FutureOr<void> Function()? onPrimaryTap;

  Future<void> _handlePrimaryTap(BuildContext context, WidgetRef ref) async {
    if (onPrimaryTap != null) {
      await onPrimaryTap!();
      return;
    }

    await ref.read(tokenStorageProvider).deleteAll();

    if (!context.mounted) {
      return;
    }

    context.go('/login?forceLogin=1');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AuthCenterCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthPageHeader(title: title, description: description),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FBF8),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFDDE9DD)),
            ),
            child: Column(
              children: [
                Text(
                  resultLabel,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  resultValue,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 48,
            child: FilledButton(
              onPressed: () => _handlePrimaryTap(context, ref),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              child: Text(primaryButtonText),
            ),
          ),
        ],
      ),
    );
  }
}
