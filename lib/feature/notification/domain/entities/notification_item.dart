import 'package:moding_president_web/feature/notification/domain/enums/notification_target_page.dart';

class NotificationItem {
  const NotificationItem({
    required this.id,
    required this.category,
    required this.label,
    required this.title,
    required this.body,
    required this.page,
    required this.referenceId,
    required this.sentAt,
    required this.isRead,
  });

  final int id;
  final String category;
  final String label;
  final String title;
  final String body;
  final NotificationTargetPage page;
  final int? referenceId;
  final DateTime sentAt;
  final bool isRead;

  NotificationItem copyWith({bool? isRead}) {
    return NotificationItem(
      id: id,
      category: category,
      label: label,
      title: title,
      body: body,
      page: page,
      referenceId: referenceId,
      sentAt: sentAt,
      isRead: isRead ?? this.isRead,
    );
  }

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      category: json['category']?.toString() ?? '',
      label: json['label']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      body: json['body']?.toString() ?? '',
      page: NotificationTargetPage.fromCode(json['page']?.toString()),
      referenceId: (json['referenceId'] as num?)?.toInt(),
      sentAt: _parseLocalDateTime(json['sentAt']),
      isRead: json['isRead'] as bool? ?? false,
    );
  }

  static DateTime _parseLocalDateTime(dynamic value) {
    if (value is! String || value.trim().isEmpty) {
      return DateTime.now();
    }

    return DateTime.parse(value).toLocal();
  }
}
