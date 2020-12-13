import 'dart:math';

import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

//TODO
//* Poupar for cycles

class CalendarScrollModel {
  final CalendarModel calendar;

  ScrollController _controller;
  ScrollController get controller => _controller;

  CalendarScrollModel(this.calendar) {
    _controller = ScrollController(
      initialScrollOffset: selectedOffset,
    );
  }

  double get snapWidth => kCalendarItemWidth * 0.75;
  double get selectedOffset {
    double offset = snapWidth;
    double separator;

    for (int i = 0; i < calendar.selected.day - calendar.today.day; i++) {
      separator = calendar.isLastDayOfMonth(i)
          ? kCalendarItemSpace * 7 / 3 + 12
          : kCalendarItemSpace;
      offset += separator + kCalendarItemWidth;
    }

    return min(
      offset - snapWidth,
      controller?.position?.maxScrollExtent ?? double.infinity,
    );
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
