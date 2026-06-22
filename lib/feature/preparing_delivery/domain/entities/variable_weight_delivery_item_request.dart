class VariableWeightDeliveryItemRequest {
  const VariableWeightDeliveryItemRequest({
    required this.orderItemId,
    required this.actualCapacity,
  });

  final int orderItemId;
  final double actualCapacity;

  Map<String, dynamic> toJson() {
    return {
      'orderItemId': orderItemId,
      'actualCapacity': actualCapacity,
    };
  }
}
