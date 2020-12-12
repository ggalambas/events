import 'dart:async';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:flutter/material.dart';
import 'package:events/app/helpers/date_time_x.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CalendarModel extends ChangeNotifier {
  final IEventRepository _eventRepository;

  DateTime _today;
  DateTime get today => _today;
  set today(DateTime day) {
    _today = day;
    selected.day == _today.day ? selected = day : notifyListeners();
  }

  DateTime get selected => _eventRepository.selectedDate;
  set selected(DateTime date) {
    _eventRepository.selectedDate = date;
    notifyListeners();
  }

  CalendarModel(this._eventRepository) {
    today = _todayDate();
    _refreshAtMidnight();
  }

  void _refreshAtMidnight() {
    final DateTime midnight = today.after(1);
    final Duration timeToMidnight = midnight.difference(DateTime.now());
    Future.delayed(timeToMidnight, () {
      today = _todayDate();
      Timer.periodic(Duration(days: 1), (_) => today = _todayDate());
    });
  }

  DateTime _todayDate() => DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );

  // Calendar

  int get totalDays => 14;

  void select(int daysAfter) {
    selected = today.after(daysAfter);
    // notifyListeners();
  }

  bool isSelected(int daysAfter) => today.after(daysAfter).day == selected.day;
  bool isLastDayOfMonth(int daysAfter) => today.after(daysAfter + 1).day == 1;

  String nextMonth(int daysAfter) => today.after(daysAfter + 1).monthName;
  String weekDay(int daysAfter) => today.after(daysAfter).weekdayName;
  String day(int daysAfter) => today.after(daysAfter).day.toString();

  // Calendar Button

  String get selectedDay => selected.day.toString();
  String get selectedMonth => selected.monthName;
}
