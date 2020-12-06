import 'package:events/domain/core/event_counter.dart';
import 'package:events/domain/core/value_objects.dart';
import 'package:events/domain/events/event.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'region.freezed.dart';

@freezed
abstract class Region with _$Region {
  const factory Region({
    @required UniqueId id,
    @required String name,
    @required EventCounter eventCounter,
  }) = _Region;

  //! this is for 'todos os evetns'
  //! there must be a better way of doing this
  factory Region.empty() => Region(
        id: UniqueId(),
        name: '',
        eventCounter: EventCounter.empty(),
      );
}
