import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/constants/app_http_urls.dart';
import 'package:moding_seller_web/core/network/dio_client.dart';

final reviewDataSourceProvider = Provider<ReviewDataSource>((ref) {
  return ReviewDataSource(ref.watch(dioProvider));
});

class ReviewDataSource {
  ReviewDataSource(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> getReviews({
    String? fromDate,
    String? toDate,
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dio.get(
      AppHttpUrls.getSellerReviews(
        fromDate: fromDate,
        toDate: toDate,
        page: page,
        size: size,
      ),
    );

    return Map<String, dynamic>.from(response.data as Map);
  }
}
