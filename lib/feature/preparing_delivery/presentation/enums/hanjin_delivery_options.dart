enum HanjinServiceCategory {
  autoPrint('O', '운송장 자동 출력'),
  manualPrint('M', '운송장 직접 출력');

  const HanjinServiceCategory(this.code, this.label);

  final String code;
  final String label;
}

enum HanjinBoxType {
  small('S', '소형(~60cm)'),
  mediumSmall('A', '중소형(~80cm)'),
  medium('B', '중형(~100cm)'),
  mediumLarge('C', '중대형(~120cm)'),
  large('D', '대형(~140cm)'),
  extraLarge('E', '특대형(~160cm)');

  const HanjinBoxType(this.code, this.label);

  final String code;
  final String label;
}

enum HanjinPayType {
  prepaid('PREPAID', '선불'),
  collect('COLLECT', '착불');

  const HanjinPayType(this.code, this.label);

  final String code;
  final String label;
}
