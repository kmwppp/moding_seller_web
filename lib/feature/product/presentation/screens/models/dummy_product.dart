class DummyProduct {
  final String id;
  final String name;
  final String summary;
  final bool isSelling;
  final String? thumbnailUrl;

  DummyProduct({
    required this.id,
    required this.name,
    required this.summary,
    this.isSelling = true,
    this.thumbnailUrl,
  });
}
