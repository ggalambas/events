import 'package:events/domain/core/event_counter.dart';
import 'package:events/domain/events/event.dart';
import 'package:flutter/foundation.dart';

class Region {
  final String id;
  final String name;

  Region({@required this.id, @required this.name});

  Region parent;
  EventCounter eventCounter = EventCounter.empty();
  List<Event> events = [];

  Region add({Region parent, EventCounter eventCounter, List<Event> events}) {
    this.parent = parent;
    this.eventCounter = eventCounter;
    this.events = events;
    return this;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Region && o.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => name;
}
