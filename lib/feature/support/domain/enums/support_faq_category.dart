enum SupportFaqCategory {
  all(label: '전체', queryValue: null),
  shipping(label: '배송', queryValue: 'SHIPPING'),
  payment(label: '결제', queryValue: 'PAYMENT'),
  order(label: '주문', queryValue: 'ORDER'),
  product(label: '상품', queryValue: 'PRODUCT'),
  account(label: '계정', queryValue: 'ACCOUNT'),
  etc(label: '그 외', queryValue: 'ETC');

  const SupportFaqCategory({required this.label, required this.queryValue});

  final String label;
  final String? queryValue;

  static String toDisplayLabel(String raw) {
    for (final category in values) {
      if (category.queryValue == raw) {
        return category.label;
      }
    }
    return raw;
  }
}
