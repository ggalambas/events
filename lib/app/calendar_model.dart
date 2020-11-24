import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  DateTime after(int days) => add(Duration(days: days));
  // Date Formats
  String get monthName => DateFormat.MMM('pt_PT').format(this);
  String get weekdayName => DateFormat.E('pt_PT').format(this);
}

class CalendarModel extends ChangeNotifier {
  DateTime _today = DateTime.now();
  DateTime _selected;

  CalendarModel() {
    _selected = _today;
    _refreshAtMidnight();
  }

  void _refreshAtMidnight() {
    final DateTime tomorrow = today.after(1);
    final DateTime midnight =
        DateTime(tomorrow.year, tomorrow.month, tomorrow.day);
    final Duration timeToMidnight = midnight.difference(today);
    Future.delayed(timeToMidnight, () {
      today = DateTime.now();
      Timer.periodic(Duration(days: 1), (_) => today = DateTime.now());
    });
  }

  DateTime get today => _today;
  set today(DateTime day) {
    if (_selected.day == _today.day) _selected = day;
    _today = day;
    notifyListeners();
  }

  // Calendar

  int get totalDays => 14;

  void select(int daysAfter) {
    _selected = today.after(daysAfter);
    notifyListeners();
  }

  bool isSelected(int daysAfter) => today.after(daysAfter).day == _selected.day;
  bool isLastDayOfMonth(int daysAfter) => today.after(daysAfter + 1).day == 1;

  String nextMonth(int daysAfter) => today.after(daysAfter + 1).monthName;
  String weekDay(int daysAfter) => today.after(daysAfter).weekdayName;
  String day(int daysAfter) => today.after(daysAfter).day.toString();

  // Calendar Button

  String get selectedDay => _selected.day.toString();
  String get selectedMonth => _selected.monthName;
}