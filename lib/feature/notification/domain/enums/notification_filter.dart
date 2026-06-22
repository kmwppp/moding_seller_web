enum NotificationFilter {
  activity('ACTIVITY', '주문·배송'),
  notice('NOTICE', '알림');

  const NotificationFilter(this.code, this.label);

  final String code;
  final String label;
}
