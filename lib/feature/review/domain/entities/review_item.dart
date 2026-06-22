class ReviewItem {
  const ReviewItem({
    required this.id,
    required this.productId,
    required this.productName,
    required this.name,
    required this.orderItemOptionName,
    required this.content,
    required this.photos,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int productId;
  final String productName;
  final String name;
  final String orderItemOptionName;
  final String content;
  final List<ReviewPhoto> photos;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory ReviewItem.fromJson(Map<String, dynamic> json) {
    return ReviewItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      productId: (json['productId'] as num?)?.toInt() ?? 0,
      productName: json['productName']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      orderItemOptionName: json['orderItemOptionName']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      photos: ((json['photos'] as List?) ?? const [])
          .map(
            (item) =>
                ReviewPhoto.fromJson(Map<String, dynamic>.from(item as Map)),
          )
          .toList(),
      createdAt: _parseDate(json['createdAt']),
      updatedAt: _parseDate(json['updatedAt']),
    );
  }

  static DateTime _parseDate(dynamic value) {
    if (value is! String || value.trim().isEmpty) {
      return DateTime.now();
    }

    return DateTime.parse(value).toLocal();
  }
}

class ReviewPhoto {
  const ReviewPhoto({required this.photoUrl, required this.sortOrder});

  final String photoUrl;
  final int sortOrder;

  factory ReviewPhoto.fromJson(Map<String, dynamic> json) {
    return ReviewPhoto(
      photoUrl: json['photoUrl']?.toString() ?? '',
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
    );
  }
}
