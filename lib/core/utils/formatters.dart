import 'package:intl/intl.dart';

class Formatters {
  static String dateDmyhFormat(DateTime? date) {
    if (date == null) return "-";
    return DateFormat('d MMM ').format(date);
  }
}
