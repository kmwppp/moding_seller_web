class StringUtil {
  static String formatCurrency(int? n) {
    final s = n.toString();
    final sb = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      final idxFromEnd = s.length - i;
      sb.write(s[i]);
      if (idxFromEnd > 1 && idxFromEnd % 3 == 1) {
        sb.write(',');
      }
    }
    return sb.toString();
  }

  static String daysUntil(String targetDateTime) {
    if (targetDateTime.isEmpty) {
      return "";
    }

    final target = DateTime.parse(targetDateTime);
    final now = DateTime.now();

    final difference = target.difference(now).inDays;

    if (difference > 0) {
      return "D-$difference";
    } else {
      return "D+${difference.abs()}";
    }
  }
}
