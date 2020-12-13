import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/services/core/event_counter_dto.dart';
import 'package:flutter/material.dart';

class RegionDto {
  String id;
  String name;

  RegionDto({
    @required this.id,
    @required this.name,
  });

  Region toDomain() {
    return Region(
      id: id,
      name: name,
    );
  }

  factory RegionDto.fromJson(Map<String, dynamic> json) => RegionDto(
        id: json['dicofre'] as String,
        name: json['designacao'] as String,
      );

  static Region fromFirestoreToDomain(DocumentSnapshot doc) {
    final region = getIt<IRegionApi>().region(doc.id);
    region.eventCounter = EventCounterDto.fromFirestore(doc).toDomain();
    return region;
  }
}
