import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/constants/app_http_urls.dart';
import 'package:moding_seller_web/core/network/dio_client.dart';
import 'package:moding_seller_web/core/network/entities/response_model.dart';

final notificationDataSourceProvider = Provider<NotificationDataSource>((ref) {
  return NotificationDataSource(ref.watch(dioProvider));
});

class NotificationDataSource {
  NotificationDataSource(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> getSellerBadges() async {
    final response = await _dio.get(AppHttpUrls.getSellerBadges);
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> getNotifications({
    required String filter,
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dio.get(
      AppHttpUrls.getSellerNotifications,
      queryParameters: {'filter': filter, 'page': page, 'size': size},
    );
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<ResponseModel> patchSellerNotificationsReadAll() async {
    final response = await _dio.patch(
      AppHttpUrls.patchSellerNotificationsReadAll,
    );
    return ResponseModel.fromJson(
      Map<String, dynamic>.from(response.data as Map),
    );
  }

  Future<ResponseModel> patchNotificationRead(int notificationId) async {
    final response = await _dio.patch(
      AppHttpUrls.patchNotificationRead(notificationId),
    );
    return ResponseModel.fromJson(
      Map<String, dynamic>.from(response.data as Map),
    );
  }
}
