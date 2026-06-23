import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/core/constants/app_http_urls.dart';
import 'package:moding_seller_web/core/network/dio_client.dart';

final reauthDataSourceProvider = Provider<ReauthDataSource>((ref) {
  return ReauthDataSource(ref.watch(dioProvider));
});

class ReauthDataSource {
  ReauthDataSource(this._dio);

  final Dio _dio;

  Future<String> issueReauthKey(String password) async {
    final response = await _dio.post(
      AppHttpUrls.postReauth,
      data: {'password': password},
    );

    final payload = Map<String, dynamic>.from(response.data as Map);
    final data = Map<String, dynamic>.from(
      (payload['data'] as Map?) ?? <String, dynamic>{},
    );
    return data['reauthKey']?.toString() ?? '';
  }
}
