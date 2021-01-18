import 'package:flutter/material.dart';

class EventCounter {
  int live;
  int total;

  EventCounter({@required this.live, @required this.total});

  @override
  String toString() {
    return 'total: $total, live: $live';
  }

  factory EventCounter.empty() => EventCounter(live: 0, total: 0);
}
