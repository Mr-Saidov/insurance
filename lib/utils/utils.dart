import 'package:intl/intl.dart';

String currencyFormatter(double? number, {decimalDigit = 2}) {
  final formatCurrency = NumberFormat.currency(
      locale: "en_US", symbol: "", decimalDigits: decimalDigit);
  return formatCurrency.format(number).replaceAll(",", " ");
}
