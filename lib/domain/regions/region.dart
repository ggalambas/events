import 'package:events/domain/core/event_counter.dart';
import 'package:events/domain/core/id_object.dart';
import 'package:flutter/material.dart';

class Region extends IdObject {
  EventCounter eventCounter = EventCounter.empty();

  Region({
    @required String id,
    @required String name,
  }) : super(id: id, name: name);

  Region add({EventCounter eventCounter}) {
    this.eventCounter = eventCounter;
    return this;
  }
}
