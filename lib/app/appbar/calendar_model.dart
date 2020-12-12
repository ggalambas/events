import 'dart:async';
import 'dart:math';
import 'package:events/config/constants.dart';
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

  // Scroll Controller

  final ScrollController _controller = ScrollController();
  ScrollController get controller => _controller;

  void snapSelected() {
    Future.microtask(() => _snapSelected());
  }

  void _snapSelected() {
    final double snapWidth = kCalendarItemWidth * 0.75;
    double offset = snapWidth;
    double separator;

    for (int i = 0; i < selected.day - today.day; i++) {
      separator = isLastDayOfMonth(i)
          ? kCalendarItemSpace * 7 / 3 + 12
          : kCalendarItemSpace;
      offset += separator + kCalendarItemWidth;
    }

    _jump(min(offset - snapWidth, controller.position.maxScrollExtent));
  }

  void snapItems() {
    Future.microtask(() => _snapItems());
  }

  void _snapItems() {
    final double snapWidth = kCalendarItemWidth * 0.75;
    double offset = snapWidth;
    double separator;

    if (controller.offset != controller.position.maxScrollExtent) {
      for (int i = 0; i < totalDays - 1; i++) {
        separator = isLastDayOfMonth(i)
            ? kCalendarItemSpace * 7 / 3 + 12
            : kCalendarItemSpace;
        if (controller.offset < offset) {
          _animate(offset - snapWidth);
          break;
        }
        offset += separator + kCalendarItemWidth;
      }
    }
  }

  void _animate(double snapOffset) {
    controller.animateTo(
      snapOffset,
      duration: kAnimationDuration,
      curve: Curves.easeOut,
    );
  }

  void _jump(double snapOffset) {
    controller.jumpTo(
      snapOffset,
    );
  }
}
