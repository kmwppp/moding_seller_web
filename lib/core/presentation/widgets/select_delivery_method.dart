import 'package:flutter/material.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/dash_board/presentation/screens/widgets/custom_button.dart';

import '../../constants/app_colors.dart';
import '../enums/select_delivery_method_enum.dart';

class SelectDeliveryMethod extends StatefulWidget {
  final void Function(SelectDeliveryMethodEnum deliveryMethod)? onConfirm;

  const SelectDeliveryMethod({super.key, this.onConfirm});

  @override
  State<SelectDeliveryMethod> createState() => _SelectDeliveryMethodState();
}

class _SelectDeliveryMethodState extends State<SelectDeliveryMethod> {
  SelectDeliveryMethodEnum selectedIndex = SelectDeliveryMethodEnum.courier;

  Widget buildButton(IconData icon, SelectDeliveryMethodEnum deliveryMethod) {
    final selected = selectedIndex == deliveryMethod;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = deliveryMethod;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: selected ? Colors.white : Colors.grey, size: 100),
            Text(
              deliveryMethod == SelectDeliveryMethodEnum.courier
                  ? "택배 배송"
                  : "직접 배송",
              style: context.body.copyWith(
                color: selected ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton(
                    Icons.local_shipping,
                    SelectDeliveryMethodEnum.courier,
                  ),
                  const SizedBox(width: 8),
                  buildButton(Icons.person_2, SelectDeliveryMethodEnum.direct),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.onConfirm?.call(selectedIndex);
              Navigator.of(context).pop();
            },
            child: CustomButton(
              title: "확정",
              boxColor: AppColors.primary,
              textColor: Colors.white,
              paddingVertical: 6,
            ),
          ),
        ],
      ),
    );
  }
}
