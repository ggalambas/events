import 'package:events/domain/core/id_object.dart';
import 'package:flutter/material.dart';

class Subregion extends IdObject {
  String regionName; //?
  List<String> events;

  Subregion({
    @required String id,
    @required String name,
    @required this.regionName,
    this.events,
  }) : super(id: id, name: name);
}
