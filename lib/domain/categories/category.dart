import 'package:events/domain/core/event_counter.dart';
import 'package:flutter/material.dart';

class Category {
  String id;
  String name;
  IconData icon;
  EventCounter eventCounter = EventCounter.empty();

  Category({
    @required this.id,
    @required this.name,
    @required this.icon,
  });

  Category add({EventCounter eventCounter}) {
    this.eventCounter = eventCounter;
    return this;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Category && o.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
