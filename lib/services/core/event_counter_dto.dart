import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/domain/core/event_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_counter_dto.g.dart';

@JsonSerializable()
class EventCounterDto {
  int live;
  int total;

  EventCounterDto({
    @JsonKey(defaultValue: 0) this.live,
    @required this.total,
  });

  EventCounter toDomain() {
    return EventCounter(
      live: live,
      total: total,
    );
  }

  factory EventCounterDto.fromJson(Map<String, dynamic> json) =>
      _$EventCounterDtoFromJson(json);

  factory EventCounterDto.fromFirestore(DocumentSnapshot doc) =>
      EventCounterDto.fromJson(doc.data());
}
