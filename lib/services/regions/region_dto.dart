import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/services/core/event_counter_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'region_dto.g.dart';

@JsonSerializable()
class RegionDto {
  String id;
  String name;

  RegionDto({
    @required @JsonKey(name: 'dicofre') this.id,
    @required @JsonKey(name: 'designacao') this.name,
  });

  Region toDomain() {
    return Region(
      id: id,
      name: name,
    );
  }

  factory RegionDto.fromJson(Map<String, dynamic> json) =>
      _$RegionDtoFromJson(json);

  static Region fromFirestoreToDomain(DocumentSnapshot doc) {
    final region = getIt<IRegionApi>().region(doc.id);
    region.eventCounter = EventCounterDto.fromFirestore(doc).toDomain();
    return region;
  }
}
