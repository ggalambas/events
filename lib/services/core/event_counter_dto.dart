import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/domain/core/event_counter.dart';
import 'package:flutter/material.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'event_counter_dto.g.dart';

// @JsonSerializable(nullable: false)
class EventCounterDto {
  int live;
  int total;

  EventCounterDto({
    @required /*@JsonKey(defaultValue: 0, nullable: false)*/ this.live,
    @required /*@JsonKey(nullable: false, required: true)*/ this.total,
  });

  EventCounter toDomain() {
    return EventCounter(
      live: live,
      total: total,
    );
  }

  // factory EventCounterDto.fromJson(Map<String, dynamic> json) =>
  //     _$EventCounterDtoFromJson(json);

  factory EventCounterDto.fromJson(Map<String, dynamic> json) =>
      EventCounterDto(
        live: (json['liveEvents'] as int) ?? 0,
        total: json['totalEvents'] as int,
      );

  factory EventCounterDto.fromFirestore(DocumentSnapshot doc) =>
      EventCounterDto.fromJson(doc.data());
}
