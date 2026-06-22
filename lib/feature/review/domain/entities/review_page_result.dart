import 'package:moding_president_web/feature/review/domain/entities/review_item.dart';

class ReviewPageResult {
  const ReviewPageResult({
    required this.content,
    required this.number,
    required this.size,
    required this.totalElements,
    required this.totalPages,
  });

  final List<ReviewItem> content;
  final int number;
  final int size;
  final int totalElements;
  final int totalPages;

  factory ReviewPageResult.fromJson(Map<String, dynamic> json) {
    return ReviewPageResult(
      content: ((json['content'] as List?) ?? const [])
          .map(
            (item) =>
                ReviewItem.fromJson(Map<String, dynamic>.from(item as Map)),
          )
          .toList(),
      number: (json['number'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 20,
      totalElements: (json['totalElements'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
    );
  }
}
