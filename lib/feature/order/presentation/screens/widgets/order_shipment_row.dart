import 'package:flutter/material.dart';

import '../../../../../core/constants/app_responsive_layout.dart';

import '../../../domain/entities/order_model.dart';
import 'order_shipment_mobile_row.dart';
import 'order_shipment_web_row.dart';

class OrderShipmentRow extends StatelessWidget {
  const OrderShipmentRow({super.key, required this.item});

  final OrderModel item;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (!AppResponsiveLayout.isDesktop(context)) {
          return OrderShipmentMobileRow(item: item);
        }
        return OrderShipmentWebRow(item: item);
      },
    );
  }
}
