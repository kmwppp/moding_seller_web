class SupportFaqItem {
  const SupportFaqItem({
    required this.id,
    required this.category,
    required this.question,
    required this.createdAt,
    required this.isVisible,
    this.answer,
  });

  final int id;
  final String category;
  final String question;
  final DateTime createdAt;
  final bool isVisible;
  final String? answer;

  factory SupportFaqItem.fromJson(Map<String, dynamic> json) {
    return SupportFaqItem(
      id: json['id'] as int? ?? 0,
      category: json['category']?.toString() ?? '',
      question: json['question']?.toString() ?? '',
      createdAt:
          DateTime.tryParse(json['createdAt']?.toString() ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      isVisible: json['isVisible'] as bool? ?? false,
    );
  }

  SupportFaqItem copyWith({String? answer}) {
    return SupportFaqItem(
      id: id,
      category: category,
      question: question,
      createdAt: createdAt,
      isVisible: isVisible,
      answer: answer ?? this.answer,
    );
  }
}
