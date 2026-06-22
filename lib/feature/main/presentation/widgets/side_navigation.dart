import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/presentation/dialogs/app_dialogs.dart';
import '../../../../core/services/token_storage.dart';
import '../../../../core/services/web_bridge.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../main_page.dart';

class SideNavigation extends ConsumerWidget {
  const SideNavigation({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final MainMenu selected;
  final ValueChanged<MainMenu> onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItems = MainMenu.values.where((m) => !m.isBottomItem).toList();
    final bottomItem = MainMenu.values.firstWhere(
      (m) => m.isBottomItem,
      orElse: () => MainMenu.moveToPurchase,
    );
    final showPurchaseButton = isAppWebView;
    final showLogoutButton = kIsWeb && !isAppWebView;

    Future<void> handleLogout() async {
      final shouldLogout = await AppDialog.showConfirm(
        context,
        message: '로그아웃 하시겠습니까?',
      );

      if (!shouldLogout) {
        return;
      }

      await ref.read(tokenStorageProvider).deleteAll();
      if (!context.mounted) {
        return;
      }

      context.go('/login?forceLogin=1');
    }

    return Container(
      width: 240,
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(AppStrings.merchantCenter, style: context.title),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final menu = menuItems[index];
                  final isSelected = menu == selected;

                  return ListTile(
                    leading: Image.asset(
                      menu.iconUrl,
                      width: 24,
                      color: isSelected
                          ? AppColors.pointColor
                          : AppColors.darkGrey,
                    ),
                    title: Text(
                      menu.label,
                      style: context.body.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: isSelected
                            ? AppColors.pointColor
                            : AppColors.textColor,
                      ),
                    ),
                    selected: isSelected,
                    selectedTileColor: AppColors.lightGrey,
                    onTap: () => onSelected(menu),
                  );
                },
              ),
            ),
            const Divider(height: 1),
            if (showPurchaseButton)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      onSelected(bottomItem);

                      if (kIsWeb) {
                        sendGoMain();
                      }
                    },
                    icon: const Icon(Icons.shopping_cart_outlined, size: 18),
                    label: Text(
                      bottomItem.label,
                      style: context.body.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            if (showLogoutButton)
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textColor,
                      side: const BorderSide(color: AppColors.boxBorderGrey),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: handleLogout,
                    icon: const Icon(Icons.logout_rounded, size: 18),
                    label: Text(
                      '로그아웃',
                      style: context.body.copyWith(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
