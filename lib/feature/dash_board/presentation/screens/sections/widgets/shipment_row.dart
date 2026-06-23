import 'package:flutter/material.dart';
import 'package:moding_seller_web/core/constants/app_responsive_layout.dart';
import 'package:moding_seller_web/feature/dash_board/presentation/screens/sections/widgets/shipment_mobile_row.dart';
import 'package:moding_seller_web/feature/dash_board/presentation/screens/sections/widgets/shipment_web_row.dart';

import '../../../../../order/domain/entities/order_model.dart';
import '../../models/approval_order_item.dart';

class ShipmentRow extends StatelessWidget {
  const ShipmentRow({super.key, required this.item});

  final OrderModel item;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return ShipmentMobileRow(item: item);
        }
        return ShipmentWebRow(item: item);
      },
    );
  }
}
