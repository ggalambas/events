import 'package:events/domain/core/event_counter.dart';
import 'package:events/domain/core/value_objects.dart';
import 'package:events/domain/regions/region.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'region_dto.freezed.dart';
part 'region_dto.g.dart';

@freezed
abstract class RegionDto implements _$RegionDto {
  const RegionDto._();

  const factory RegionDto({
    @JsonKey(ignore: true) String id,
    @required String name,
    @Default(0) int liveEvents,
    @required int totalEvents,
  }) = _RegionDto;

  factory RegionDto.fromDomain(Region region) {
    return RegionDto(
      id: region.id,
      name: region.name,
      liveEvents: region.eventCounter.live,
      totalEvents: region.eventCounter.total,
    );
  }

  Region toDomain() {
    return Region(
      id: id,
      name: name,
      eventCounter: EventCounter(live: liveEvents, total: totalEvents),
    );
  }

  factory RegionDto.fromJson(Map<String, dynamic> json) =>
      _$RegionDtoFromJson(json);

  factory RegionDto.fromFirestore(DocumentSnapshot doc) =>
      RegionDto.fromJson(doc.data()).copyWith(id: doc.id);
}
