import 'package:moding_president_web/feature/support/domain/entities/support_faq_item.dart';

class SupportFaqPageResult {
  const SupportFaqPageResult({
    required this.items,
    required this.page,
    required this.totalPages,
  });

  final List<SupportFaqItem> items;
  final int page;
  final int totalPages;

  bool get hasMore => page + 1 < totalPages;

  factory SupportFaqPageResult.fromJson(Map<String, dynamic> json) {
    final content = (json['content'] as List? ?? const [])
        .whereType<Map>()
        .map((item) => SupportFaqItem.fromJson(Map<String, dynamic>.from(item)))
        .toList();

    return SupportFaqPageResult(
      items: content,
      page: json['number'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
    );
  }
}
