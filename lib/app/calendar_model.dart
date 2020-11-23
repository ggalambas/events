import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarModel extends ChangeNotifier {
  DateTime _today = DateTime.now();
  set today(DateTime day) {
    _today = day;
    notifyListeners();
  }

  CalendarModel() {
    _refreshAtMidnight();
  }

  void _refreshAtMidnight() {
    final DateTime tomorrow = _tomorrow();
    final DateTime midnight =
        DateTime(tomorrow.year, tomorrow.month, tomorrow.day);
    final Duration timeToMidnight = midnight.difference(_today);
    Future.delayed(timeToMidnight, () {
      today = DateTime.now();
      Timer.periodic(Duration(days: 1), (_) => today = DateTime.now());
    });
  }

  final int _totalDays = 14;
  int get totalDays => _totalDays;

  int _selectedDay = 0;
  bool isSelected(int day) => day == _selectedDay;
  void select(int day) {
    _selectedDay = day;
    notifyListeners();
  }

  String selectedDay() => _fromNow(_selectedDay).day.toString();
  String selectedMonth() =>
      DateFormat.MMM('pt_PT').format(_fromNow(_selectedDay));

  bool isLastDayOfMonth(int day) => day + 1 < _totalDays && _day(day + 1) == 1;
  String nextMonth(int day) =>
      DateFormat.MMM('pt_PT').format(_fromNow(day + 1));

  String weekday(int day) => _weekDay(_fromNow(day));
  String day(int day) => _day(day).toString();

  int _day(int day) => _fromNow(day).day;
  DateTime _fromNow(int days) => _today.add(Duration(days: days));
  String _weekDay(DateTime day) => DateFormat.E('pt_PT').format(day);
  DateTime _tomorrow() => _fromNow(1);
}
