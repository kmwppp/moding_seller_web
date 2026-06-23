import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/network/entities/response_model.dart';
import 'package:moding_seller_web/feature/notification/data/data_sources/notification_data_source.dart';
import 'package:moding_seller_web/feature/notification/domain/entities/notification_item.dart';
import 'package:moding_seller_web/feature/notification/domain/entities/notification_page_result.dart';

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository(ref.watch(notificationDataSourceProvider));
});

class NotificationRepository {
  NotificationRepository(this._dataSource);

  final NotificationDataSource _dataSource;

  Future<bool> getHasUnreadNotificationBadge() async {
    final response = await _dataSource.getSellerBadges();
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );
    return data['hasUnreadNotification'] as bool? ?? false;
  }

  Future<NotificationPageResult> getNotifications({
    required String filter,
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dataSource.getNotifications(
      filter: filter,
      page: page,
      size: size,
    );

    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );
    final content = (data['content'] as List?) ?? const [];

    final items = content
        .map(
          (item) =>
              NotificationItem.fromJson(Map<String, dynamic>.from(item as Map)),
        )
        .toList();

    return NotificationPageResult(
      items: items,
      page: (data['number'] as num?)?.toInt() ?? page,
      size: (data['size'] as num?)?.toInt() ?? size,
      totalPages: (data['totalPages'] as num?)?.toInt() ?? 0,
      totalElements: (data['totalElements'] as num?)?.toInt() ?? items.length,
    );
  }

  Future<ResponseModel> patchNotificationRead(int notificationId) {
    return _dataSource.patchNotificationRead(notificationId);
  }

  Future<ResponseModel> patchSellerNotificationsReadAll() {
    return _dataSource.patchSellerNotificationsReadAll();
  }
}
