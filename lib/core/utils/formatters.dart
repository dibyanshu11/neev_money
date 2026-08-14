import 'package:intl/intl.dart';

class Formatters {
  /// Plain amount — ₹5000 (no comma grouping).
  static String currency(num value) => '₹${value.round()}';

  /// NAV etc. with paise — ₹74.82
  static String currencyDec(num value) => '₹${value.toStringAsFixed(2)}';

  static String percentage(double value, {bool showSign = false}) {
    final sign = showSign && value >= 0 ? '+' : '';
    return '$sign${value.toStringAsFixed(1)}%';
  }

  static String shortDate(DateTime date) =>
      DateFormat('d MMM yyyy').format(date);

  static String dayMonth(DateTime date) => DateFormat('d MMM').format(date);
}
