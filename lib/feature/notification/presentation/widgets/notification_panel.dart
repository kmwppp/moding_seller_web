import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/constants/app_responsive_layout.dart';
import 'package:moding_president_web/core/presentation/widgets/loading_indicator.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/notification/domain/entities/notification_item.dart';
import 'package:moding_president_web/feature/notification/domain/enums/notification_filter.dart';
import 'package:moding_president_web/feature/notification/presentation/providers/notification_panel_viewmodel.dart';
import 'package:moding_president_web/feature/notification/presentation/utils/notification_navigation.dart';

class NotificationPanel extends ConsumerStatefulWidget {
  const NotificationPanel({super.key, required this.hostContext});

  final BuildContext hostContext;

  @override
  ConsumerState<NotificationPanel> createState() => _NotificationPanelState();
}

class _NotificationPanelState extends ConsumerState<NotificationPanel>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notificationPanelViewModelProvider.notifier).loadAll();
    });
  }

  void _handleTabChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationPanelViewModelProvider);
    final isDesktop = AppResponsiveLayout.isDesktop(context);

    return Container(
      width: isDesktop ? 420 : double.infinity,
      height: isDesktop ? 620 : MediaQuery.of(context).size.height * 0.82,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isDesktop ? 24 : 20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 28,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 12, 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '알림',
                    style: context.title.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _NotificationSegmentedTabs(
              currentIndex: _tabController.index,
              onTap: (index) => _tabController.animateTo(index),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _NotificationList(
                  filter: NotificationFilter.activity,
                  hostContext: widget.hostContext,
                  items: state.activityItems,
                  isLoading: state.isActivityLoading,
                  isLoadingMore: state.isActivityLoadingMore,
                  hasMore: state.activityHasMore,
                ),
                _NotificationList(
                  filter: NotificationFilter.notice,
                  hostContext: widget.hostContext,
                  items: state.noticeItems,
                  isLoading: state.isNoticeLoading,
                  isLoadingMore: state.isNoticeLoadingMore,
                  hasMore: state.noticeHasMore,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationList extends ConsumerWidget {
  const _NotificationList({
    required this.filter,
    required this.hostContext,
    required this.items,
    required this.isLoading,
    required this.isLoadingMore,
    required this.hasMore,
  });

  final NotificationFilter filter;
  final BuildContext hostContext;
  final List<NotificationItem> items;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isLoading) {
      return const Center(child: LoadingIndicator());
    }

    if (items.isEmpty) {
      return Center(
        child: Text(
          '알림이 없어요.',
          style: context.body.copyWith(color: AppColors.darkGrey),
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.extentAfter < 220 &&
            hasMore &&
            !isLoadingMore) {
          ref
              .read(notificationPanelViewModelProvider.notifier)
              .loadMore(filter);
        }
        return false;
      },
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        itemCount: items.length + (isLoadingMore ? 1 : 0),
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          if (index >= items.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Center(child: LoadingIndicator()),
            );
          }

          final item = items[index];
          return InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () async {
              if (!item.isRead) {
                await ref
                    .read(notificationPanelViewModelProvider.notifier)
                    .markAsRead(item.id);
              }

              if (!context.mounted) {
                return;
              }

              Navigator.of(context).pop();
              await navigateByNotification(hostContext, ref, item);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: item.isRead ? Colors.white : const Color(0xFFF7FBF7),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.lightGrey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.label.isNotEmpty ? item.label : item.category,
                          style: context.bodySmall.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      if (!item.isRead)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.pointColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.title,
                    style: context.body.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.bodySmall.copyWith(
                      color: AppColors.darkGrey,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _formatDate(item.sentAt),
                    style: context.caption.copyWith(color: AppColors.darkGrey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    String two(int value) => value.toString().padLeft(2, '0');
    return '${dateTime.year}.${two(dateTime.month)}.${two(dateTime.day)} ${two(dateTime.hour)}:${two(dateTime.minute)}';
  }
}

class _NotificationSegmentedTabs extends StatelessWidget {
  const _NotificationSegmentedTabs({
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2EAE2)),
      ),
      child: Row(
        children: List.generate(NotificationFilter.values.length, (index) {
          final filter = NotificationFilter.values[index];
          final isSelected = currentIndex == index;

          return Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOutCubic,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                boxShadow: isSelected
                    ? const [
                        BoxShadow(
                          color: Color(0x1F238B22),
                          blurRadius: 14,
                          offset: Offset(0, 6),
                        ),
                      ]
                    : null,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onTap(index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Text(
                      filter.label,
                      style: context.body.copyWith(
                        fontWeight: FontWeight.w700,
                        color: isSelected ? Colors.white : AppColors.darkGrey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
