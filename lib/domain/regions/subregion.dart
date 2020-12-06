import 'package:events/domain/core/value_objects.dart';
import 'package:events/domain/events/event.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subregion.freezed.dart';

@freezed
abstract class Subregion with _$Subregion {
  const factory Subregion({
    @required UniqueId id,
    @required UniqueId regionId,
    @required String name,
    @required List<Event> events,
  }) = _Subregion;
}
