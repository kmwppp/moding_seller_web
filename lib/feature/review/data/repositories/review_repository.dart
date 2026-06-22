import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/feature/review/data/data_sources/review_data_source.dart';
import 'package:moding_president_web/feature/review/domain/entities/review_page_result.dart';

final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  return ReviewRepository(ref.watch(reviewDataSourceProvider));
});

class ReviewRepository {
  ReviewRepository(this._dataSource);

  final ReviewDataSource _dataSource;

  Future<ReviewPageResult> getReviews({
    String? fromDate,
    String? toDate,
    int page = 0,
    int size = 20,
  }) async {
    final response = await _dataSource.getReviews(
      fromDate: fromDate,
      toDate: toDate,
      page: page,
      size: size,
    );
    final data = Map<String, dynamic>.from(
      (response['data'] as Map?) ?? <String, dynamic>{},
    );

    return ReviewPageResult.fromJson(data);
  }
}
