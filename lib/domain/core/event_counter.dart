import 'package:flutter/material.dart';

class EventCounter {
  final int live;
  final int total;

  const EventCounter({@required this.live, @required this.total});

  factory EventCounter.empty() => EventCounter(live: 0, total: 0);
}
