import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  DateTime after(int days) => add(Duration(days: days));
  // Date Formats
  String get monthName => DateFormat.MMM('pt_PT').format(this);
  String get weekdayName => DateFormat.E('pt_PT').format(this);
  String get time => DateFormat.Hm('pt-PT').format(this);
}
