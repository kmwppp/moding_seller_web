class SupportFaqDetail {
  const SupportFaqDetail({
    required this.id,
    required this.category,
    required this.question,
    required this.answer,
  });

  final int id;
  final String category;
  final String question;
  final String answer;

  factory SupportFaqDetail.fromJson(Map<String, dynamic> json) {
    return SupportFaqDetail(
      id: json['id'] as int? ?? 0,
      category: json['category']?.toString() ?? '',
      question: json['question']?.toString() ?? '',
      answer: json['answer']?.toString() ?? '',
    );
  }
}
