import 'package:moding_president_web/feature/notification/domain/entities/notification_item.dart';

class NotificationPageResult {
  const NotificationPageResult({
    required this.items,
    required this.page,
    required this.size,
    required this.totalPages,
    required this.totalElements,
  });

  final List<NotificationItem> items;
  final int page;
  final int size;
  final int totalPages;
  final int totalElements;

  bool get hasMore => page + 1 < totalPages;
}
