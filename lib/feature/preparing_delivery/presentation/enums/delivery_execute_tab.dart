enum DeliveryExecuteTab {
  hanjinOneClick,
  courier,
  direct;

  String get label {
    switch (this) {
      case DeliveryExecuteTab.hanjinOneClick:
        return '한진(원클릭)배송';
      case DeliveryExecuteTab.courier:
        return '택배배송';
      case DeliveryExecuteTab.direct:
        return '직접배송';
    }
  }
}
