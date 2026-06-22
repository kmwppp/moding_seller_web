class SupportNoticeItem {
  const SupportNoticeItem({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.isVisible,
    this.content,
  });

  final int id;
  final String title;
  final DateTime createdAt;
  final bool isVisible;
  final String? content;

  factory SupportNoticeItem.fromJson(Map<String, dynamic> json) {
    return SupportNoticeItem(
      id: json['id'] as int? ?? 0,
      title: json['title']?.toString() ?? '',
      createdAt:
          DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      isVisible: json['isVisible'] as bool? ?? false,
    );
  }

  SupportNoticeItem copyWith({String? content}) {
    return SupportNoticeItem(
      id: id,
      title: title,
      createdAt: createdAt,
      isVisible: isVisible,
      content: content ?? this.content,
    );
  }
}
