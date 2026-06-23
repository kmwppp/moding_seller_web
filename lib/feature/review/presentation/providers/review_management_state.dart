import 'package:moding_seller_web/feature/review/domain/entities/review_item.dart';

class ReviewManagementState {
  const ReviewManagementState({
    required this.isMainLoading,
    required this.isLoading,
    required this.isLoadingMore,
    required this.hasMore,
    required this.items,
    required this.totalElements,
    required this.page,
    required this.size,
    required this.startDate,
    required this.endDate,
  });

  final bool isMainLoading;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final List<ReviewItem> items;
  final int totalElements;
  final int page;
  final int size;
  final DateTime? startDate;
  final DateTime? endDate;

  factory ReviewManagementState.initial() {
    return const ReviewManagementState(
      isMainLoading: true,
      isLoading: false,
      isLoadingMore: false,
      hasMore: true,
      items: [],
      totalElements: 0,
      page: 0,
      size: 20,
      startDate: null,
      endDate: null,
    );
  }

  ReviewManagementState copyWith({
    bool? isMainLoading,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    List<ReviewItem>? items,
    int? totalElements,
    int? page,
    int? size,
    DateTime? startDate,
    DateTime? endDate,
    bool clearStartDate = false,
    bool clearEndDate = false,
  }) {
    return ReviewManagementState(
      isMainLoading: isMainLoading ?? this.isMainLoading,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      items: items ?? this.items,
      totalElements: totalElements ?? this.totalElements,
      page: page ?? this.page,
      size: size ?? this.size,
      startDate: clearStartDate ? null : (startDate ?? this.startDate),
      endDate: clearEndDate ? null : (endDate ?? this.endDate),
    );
  }
}
