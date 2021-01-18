import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/domain/core/event_counter.dart';
import 'package:flutter/material.dart';

class EventCounterDto {
  int total;
  int live;

  EventCounterDto({
    @required this.total,
    @required this.live,
  });

  EventCounter toDomain() {
    return EventCounter(
      total: total,
      live: live,
    );
  }

  factory EventCounterDto.fromJson(Map<String, dynamic> json) =>
      EventCounterDto(
        total: json['total'] as int,
        live: json['live'] as int,
      );

  factory EventCounterDto.fromFirestore(DocumentSnapshot doc) =>
      EventCounterDto.fromJson(doc.data());
}
