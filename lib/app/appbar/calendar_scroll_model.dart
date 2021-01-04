import 'dart:math';

import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:events/app/helpers/date_time_x.dart';

//TODO
//* Poupar for cycles

class CalendarScrollModel {
  final CalendarModel calendar;

  ScrollController _controller;
  ScrollController get controller => _controller;

  Map<int, double> offsetList = {};
  double get selectedOffset => min(
        offsetList[calendar.selected.difference(calendar.today).inDays],
        controller?.position?.maxScrollExtent ?? double.infinity,
      );

  double get snapWidth => kCalendarItemWidth * 0.75;

  CalendarScrollModel(this.calendar) {
    _updateOffsetList();
    _refreshAtMidnight();
    _controller = ScrollController(
      initialScrollOffset: selectedOffset,
    );
  }

  void _refreshAtMidnight() {
    final DateTime midnight = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).after(1);
    final Duration timeToMidnight = midnight.difference(DateTime.now());
    Future.delayed(timeToMidnight, () {
      _updateOffsetList();
    });
  }

  void _updateOffsetList() {
    double offset = snapWidth;
    double separator;

    for (int i = 0; i < calendar.totalDays; i++) {
      offsetList[i] = offset - snapWidth;
      separator = calendar.isLastDayOfMonth(i)
          ? kCalendarItemSpace * 7 / 3 + 12
          : kCalendarItemSpace;
      offset += separator + kCalendarItemWidth;
    }
  }

  void snapSelected() {
    if (_controller.hasClients) {
      Future.microtask(() => _jump(selectedOffset));
    }
  }

  void snapItems() {
    Future.microtask(() => _snapItems());
  }

  void _snapItems() {
    double offset = snapWidth;
    double separator;

    if (controller.offset != controller.position.maxScrollExtent) {
      for (int i = 0; i < calendar.totalDays - 1; i++) {
        separator = calendar.isLastDayOfMonth(i)
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
