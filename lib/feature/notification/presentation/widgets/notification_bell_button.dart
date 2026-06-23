import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/constants/app_colors.dart';
import 'package:moding_seller_web/core/constants/app_responsive_layout.dart';
import 'package:moding_seller_web/feature/notification/presentation/providers/notification_badge_viewmodel.dart';
import 'package:moding_seller_web/feature/notification/presentation/widgets/notification_panel.dart';

class NotificationBellButton extends ConsumerStatefulWidget {
  const NotificationBellButton({super.key, this.iconSize = 26});

  final double iconSize;

  @override
  ConsumerState<NotificationBellButton> createState() =>
      _NotificationBellButtonState();
}

class _NotificationBellButtonState
    extends ConsumerState<NotificationBellButton> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notificationBadgeViewModelProvider.notifier).ensureLoaded();
    });
  }

  @override
  Widget build(BuildContext context) {
    final badgeState = ref.watch(notificationBadgeViewModelProvider);

    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: () => _openPanel(context),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              'assets/images/icons/bellIcon.png',
              width: widget.iconSize,
              height: widget.iconSize,
              color: AppColors.darkGrey,
            ),
            if (badgeState.hasUnreadNotification)
              Positioned(
                right: -1,
                top: -1,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.pointColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _openPanel(BuildContext context) {
    if (!AppResponsiveLayout.isDesktop(context)) {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.only(top: 40),
            child: NotificationPanel(hostContext: context),
          ),
        ),
      );
      return;
    }

    showDialog<void>(
      context: context,
      barrierColor: const Color(0x22000000),
      builder: (_) => Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 72, right: 24),
          child: Material(
            color: Colors.transparent,
            child: NotificationPanel(hostContext: context),
          ),
        ),
      ),
    );
  }
}
