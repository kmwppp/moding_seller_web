import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/constants/app_http_urls.dart';
import 'package:moding_president_web/core/network/dio_client.dart';

final supportDataSourceProvider = Provider<SupportDataSource>((ref) {
  return SupportDataSource(ref.watch(dioProvider));
});

class SupportDataSource {
  SupportDataSource(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> getNotices({
    required int page,
    required int size,
  }) async {
    final response = await _dio.get(
      AppHttpUrls.getNoticeList(page: page, size: size),
    );
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> getNoticeDetail(int noticeId) async {
    final response = await _dio.get(AppHttpUrls.getNoticeDetail(noticeId));
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> getFaqs({
    required int page,
    required int size,
    String? category,
  }) async {
    final response = await _dio.get(
      AppHttpUrls.getFaqList(page: page, size: size, category: category),
    );
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> getFaqDetail(int faqId) async {
    final response = await _dio.get(AppHttpUrls.getFaqDetail(faqId));
    return Map<String, dynamic>.from(response.data as Map);
  }
}
