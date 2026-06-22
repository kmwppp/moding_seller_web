import 'package:flutter/material.dart';
import 'package:moding_president_web/core/network/entities/response_model.dart';
import 'package:moding_president_web/core/presentation/dialogs/app_dialogs.dart';
import 'package:moding_president_web/core/theme/app_text_styles.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/entities/preparing_order_model.dart';
import 'package:moding_president_web/feature/preparing_delivery/domain/entities/variable_weight_delivery_item_request.dart';

import '../../../../../core/constants/app_colors.dart';

class VariableWeightDeliveryCompleteSheet extends StatefulWidget {
  const VariableWeightDeliveryCompleteSheet({
    super.key,
    required this.items,
    required this.onSubmit,
  });

  final List<PreparingOrderItemModel> items;
  final Future<ResponseModel> Function(
    List<VariableWeightDeliveryItemRequest> items,
  )
  onSubmit;

  @override
  State<VariableWeightDeliveryCompleteSheet> createState() =>
      _VariableWeightDeliveryCompleteSheetState();
}

class _VariableWeightDeliveryCompleteSheetState
    extends State<VariableWeightDeliveryCompleteSheet> {
  late final List<TextEditingController> _controllers;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _controllers = widget.items.map((item) {
      final initial = item.orderedCapacity;
      return TextEditingController(
        text: initial == null ? '' : _formatCapacity(initial),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sheetHeight = MediaQuery.of(context).size.height * 0.72;

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: SizedBox(
          height: sheetHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '실제 출고 중량을 확인해주세요.',
                style: context.body.copyWith(
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: widget.items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = widget.items[index];
                    return _VariableWeightItemRow(
                      item: item,
                      controller: _controllers[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          '배송 완료',
                          style: context.body.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    final payload = <VariableWeightDeliveryItemRequest>[];

    for (var i = 0; i < widget.items.length; i++) {
      final raw = _controllers[i].text.trim();
      final normalized = raw.replaceAll(',', '');
      final parsed = double.tryParse(normalized);

      if (parsed == null) {
        await AppDialog.showError(context, '실제 출고 중량을 올바르게 입력해주세요.');
        return;
      }

      payload.add(
        VariableWeightDeliveryItemRequest(
          orderItemId: widget.items[i].id,
          actualCapacity: parsed,
        ),
      );
    }

    setState(() {
      _isSubmitting = true;
    });

    final result = await widget.onSubmit(payload);

    if (!mounted) return;

    setState(() {
      _isSubmitting = false;
    });

    if (result.success) {
      Navigator.of(context).pop(true);
      return;
    }

    await AppDialog.showError(context, result.message);
  }

  String _formatCapacity(double value) {
    final text = value.toString();
    if (text.endsWith('.0')) {
      return text.substring(0, text.length - 2);
    }
    return text;
  }
}

class _VariableWeightItemRow extends StatelessWidget {
  const _VariableWeightItemRow({required this.item, required this.controller});

  final PreparingOrderItemModel item;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE6EAF0)),
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.productName,
            style: context.body.copyWith(fontWeight: FontWeight.w700),
          ),
          if (item.optionName != null && item.optionName!.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              item.optionName!,
              style: context.caption.copyWith(color: AppColors.darkGrey),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                  ),
                  style: context.body,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                item.orderedCapacityUnit ?? '',
                style: context.body.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
