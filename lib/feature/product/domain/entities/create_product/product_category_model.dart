class ProductCategoryModel {
  final int id;
  final String name;

  ProductCategoryModel(this.id, this.name);

  // ID가 같으면 같은 객체로 인식하도록 설정
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCategoryModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
