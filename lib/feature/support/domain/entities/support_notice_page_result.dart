import 'package:moding_seller_web/feature/support/domain/entities/support_notice_item.dart';

class SupportNoticePageResult {
  const SupportNoticePageResult({
    required this.items,
    required this.page,
    required this.totalPages,
  });

  final List<SupportNoticeItem> items;
  final int page;
  final int totalPages;

  bool get hasMore => page + 1 < totalPages;

  factory SupportNoticePageResult.fromJson(Map<String, dynamic> json) {
    final content = (json['content'] as List? ?? const [])
        .whereType<Map>()
        .map(
          (item) => SupportNoticeItem.fromJson(Map<String, dynamic>.from(item)),
        )
        .toList();

    return SupportNoticePageResult(
      items: content,
      page: json['number'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
    );
  }
}
