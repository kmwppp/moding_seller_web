import 'package:flutter/material.dart';

import 'package:moding_seller_web/feature/settlement/presentation/screens/sections/settlement_period_selector_section.dart';

class EvidencePeriodSelectorSection extends StatelessWidget {
  const EvidencePeriodSelectorSection({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onRangeSelected,
  });

  final DateTime startDate;
  final DateTime endDate;
  final void Function(DateTime start, DateTime end) onRangeSelected;

  @override
  Widget build(BuildContext context) {
    return SettlementPeriodSelectorSection(
      startDate: startDate,
      endDate: endDate,
      onRangeSelected: onRangeSelected,
    );
  }
}
