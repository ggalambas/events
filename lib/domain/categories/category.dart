import 'package:events/domain/core/event_counter.dart';
import 'package:events/domain/core/id_object.dart';
import 'package:flutter/material.dart';

class Category extends IdObject {
  IconData icon;
  EventCounter eventCounter;

  Category({
    @required String id,
    @required String name,
    @required this.icon,
    @required this.eventCounter,
  }) : super(id: id, name: name);
}
