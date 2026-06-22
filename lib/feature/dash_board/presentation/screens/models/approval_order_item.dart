class ApprovalOrderItem {
  final String orderNumber;
  final String date;
  final String product;
  final String address;
  final String phoneNum;
  final String orderer;
  final int quantity;
  final int price;
  final int allPrice;

  ApprovalOrderItem({
    required this.orderNumber,
    required this.date,
    required this.product,
    required this.address,
    required this.phoneNum,
    required this.orderer,
    required this.quantity,
    required this.price,
    required this.allPrice,
  });
}
