import 'package:flutter/material.dart';
import 'package:moding_president_web/core/constants/app_colors.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';

class DeliveryOptionItem<T> {
  const DeliveryOptionItem({required this.value, required this.label});

  final T value;
  final String label;
}

class DeliveryOptionSelectorSheet<T> extends StatelessWidget {
  const DeliveryOptionSelectorSheet({
    super.key,
    required this.items,
    required this.selectedValue,
    this.description = '항목을 선택해주세요.',
  });

  final List<DeliveryOptionItem<T>> items;
  final T? selectedValue;
  final String description;

  @override
  Widget build(BuildContext context) {
    final maxSheetHeight = MediaQuery.of(context).size.height * 0.5;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: context.body.copyWith(
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: maxSheetHeight,
                maxHeight: maxSheetHeight,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: items.length,
                separatorBuilder: (_, _) =>
                    const Divider(height: 1, color: Color(0xFFE8ECF2)),
                itemBuilder: (context, index) {
                  final item = items[index];
                  final isSelected = selectedValue == item.value;

                  return ListTile(
                    onTap: () => Navigator.of(context).pop(item.value),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    title: Text(
                      item.label,
                      style: context.body.copyWith(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(
                            Icons.check_circle,
                            color: AppColors.primary,
                          )
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
