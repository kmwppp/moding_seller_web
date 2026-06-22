import 'package:moding_president_web/feature/main/presentation/main_page.dart';

import '../../../../settlement/domain/enums/settlement_tab.dart';
import '../../../../settlement/presentation/providers/settlement_state.dart';

class SummaryItem {
  final String title;
  final String value;
  final MainMenu menu;
  final SettlementTab? tab;

  const SummaryItem({
    required this.title,
    required this.value,
    required this.menu,
    this.tab,
  });
}
