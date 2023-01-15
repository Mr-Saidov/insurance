import 'package:intl/intl.dart';

String dateHourFormatter(DateTime date) {
  final formatter = DateFormat('dd.MM.yyyy hh:mm:ss');

  return formatter.format(date);
}

String dateFormatter(DateTime date) {
  final formatter = DateFormat('dd.MM.yyyy');

  return formatter.format(date);
}
