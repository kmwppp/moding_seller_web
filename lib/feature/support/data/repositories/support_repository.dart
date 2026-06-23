import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_seller_web/feature/support/data/data_sources/support_data_source.dart';
import 'package:moding_seller_web/feature/support/domain/entities/support_faq_detail.dart';
import 'package:moding_seller_web/feature/support/domain/entities/support_faq_page_result.dart';
import 'package:moding_seller_web/feature/support/domain/entities/support_notice_detail.dart';
import 'package:moding_seller_web/feature/support/domain/entities/support_notice_page_result.dart';

final supportRepositoryProvider = Provider<SupportRepository>((ref) {
  return SupportRepository(ref.watch(supportDataSourceProvider));
});

class SupportRepository {
  SupportRepository(this._dataSource);

  final SupportDataSource _dataSource;

  Future<SupportNoticePageResult> getNotices({
    required int page,
    required int size,
  }) async {
    final response = await _dataSource.getNotices(page: page, size: size);
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );
    return SupportNoticePageResult.fromJson(data);
  }

  Future<SupportNoticeDetail> getNoticeDetail(int noticeId) async {
    final response = await _dataSource.getNoticeDetail(noticeId);
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );
    return SupportNoticeDetail.fromJson(data);
  }

  Future<SupportFaqPageResult> getFaqs({
    required int page,
    required int size,
    String? category,
  }) async {
    final response = await _dataSource.getFaqs(
      page: page,
      size: size,
      category: category,
    );
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );
    return SupportFaqPageResult.fromJson(data);
  }

  Future<SupportFaqDetail> getFaqDetail(int faqId) async {
    final response = await _dataSource.getFaqDetail(faqId);
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );
    return SupportFaqDetail.fromJson(data);
  }
}
