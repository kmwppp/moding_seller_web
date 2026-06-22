import '../../../domain/enums/order_status_enum.dart';

class StatusItem {
  final String title;
  final String countText;
  final OrderStatus? status;

  const StatusItem({required this.title, required this.countText, this.status});
}
