extension DateTimeServerFormat on DateTime {
  /// 서버 전송용 ISO-8601 (UTC, milliseconds 제거)
  String toServerIso8601() {
    return toUtc().toIso8601String().split('.').first + 'Z';
  }

  /// 하루 시작 (00:00:00)
  DateTime startOfDay() {
    return DateTime(year, month, day, 0, 0, 0);
  }

  /// 하루 끝 (23:59:59)
  DateTime endOfDay() {
    return DateTime(year, month, day, 23, 59, 59);
  }
}
