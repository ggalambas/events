import 'package:events/domain/core/event_counter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'region.freezed.dart';

@freezed
abstract class Region with _$Region {
  const factory Region({
    // @required int id,
    @required String name,
    @required EventCounter eventCounter,
  }) = _Region;

  factory Region.empty() => Region(
        name: '',
        eventCounter: EventCounter.empty(),
      );
}
