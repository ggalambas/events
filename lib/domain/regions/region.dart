import 'package:events/domain/core/event_counter.dart';
import 'package:events/domain/core/id_object.dart';
import 'package:flutter/material.dart';

class Region extends IdObject {
  EventCounter eventCounter;

  Region({
    @required String id,
    @required String name,
    this.eventCounter,
  }) : super(id: id, name: name);
}
