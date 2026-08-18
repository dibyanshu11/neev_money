import 'package:intl/intl.dart';

class Formatters {
  static final _inrWhole = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 0,
  );

  static final _inrDecimal = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 2,
  );

  /// Indian grouping — ₹4,86,240
  static String currency(num value) => _inrWhole.format(value);

  /// NAV etc. with paise — ₹74.82
  static String currencyDec(num value) => _inrDecimal.format(value);

  static String percentage(double value, {bool showSign = false}) {
    final sign = showSign && value >= 0 ? '+' : '';
    return '$sign${value.toStringAsFixed(1)}%';
  }

  static String shortDate(DateTime date) =>
      DateFormat('d MMM yyyy').format(date);

  static String dayMonth(DateTime date) => DateFormat('d MMM').format(date);
}
