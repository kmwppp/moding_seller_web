class SupportNoticeDetail {
  const SupportNoticeDetail({
    required this.id,
    required this.title,
    required this.content,
  });

  final int id;
  final String title;
  final String content;

  factory SupportNoticeDetail.fromJson(Map<String, dynamic> json) {
    return SupportNoticeDetail(
      id: json['id'] as int? ?? 0,
      title: json['title']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
    );
  }
}
