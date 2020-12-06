import 'dart:async';
import 'package:flutter/material.dart';
import 'package:events/app/helpers/date_time_x.dart';

class CalendarModel extends ChangeNotifier {
  DateTime _today = DateTime.now();
  DateTime _selected;
  DateTime get selected => _selected;

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
  bool isLastShownDay(int daysAfter) => daysAfter == totalDays - 1;

  String nextMonth(int daysAfter) => today.after(daysAfter + 1).monthName;
  String weekDay(int daysAfter) => today.after(daysAfter).weekdayName;
  String day(int daysAfter) => today.after(daysAfter).day.toString();

  // Calendar Button

  String get selectedDay => _selected.day.toString();
  String get selectedMonth => _selected.monthName;
}
