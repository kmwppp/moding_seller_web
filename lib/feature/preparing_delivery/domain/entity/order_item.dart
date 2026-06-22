class OrderItem {
  final String name;
  final String option;
  final int quantity;
  final int unitPrice;

  const OrderItem({
    required this.name,
    required this.option,
    required this.quantity,
    required this.unitPrice,
  });

  int get totalPrice => quantity * unitPrice;
}
