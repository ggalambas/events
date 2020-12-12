import 'package:events/config/injection.dart';
import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/subregion.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subregion_dto.g.dart';

@JsonSerializable()
class SubregionDto {
  String id;
  String name;
  String regionName;

  SubregionDto({
    @required @JsonKey(name: 'dicofre') this.id,
    @required @JsonKey(name: 'freguesia') this.name,
    @required @JsonKey(name: 'concelho') this.regionName,
  });

  Subregion toDomain() {
    return Subregion(
      id: id,
      name: name,
      regionName: regionName,
    );
  }

  factory SubregionDto.fromJson(Map<String, dynamic> json) =>
      _$SubregionDtoFromJson(json);

  static Subregion fromFirestoreToDomain(DocumentSnapshot doc) {
    final subregion = getIt<IRegionApi>().subregion(doc.id);
    subregion.events = doc.data()['events'] as List<String>;
    return subregion;
  }
}
