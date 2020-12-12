import 'package:events/domain/regions/subregion.dart';
import 'package:flutter/material.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'subregion_dto.g.dart';

// @JsonSerializable()
class SubregionDto {
  String id;
  String name;
  String regionName;

  SubregionDto({
    @required /*@JsonKey(name: 'dicofre')*/ this.id,
    @required /*@JsonKey(name: 'freguesia')*/ this.name,
    @required /*@JsonKey(name: 'concelho')*/ this.regionName,
  });

  Subregion toDomain() {
    return Subregion(
      id: id,
      name: name,
      regionName: regionName,
    );
  }

  // factory SubregionDto.fromJson(Map<String, dynamic> json) =>
  //     _$SubregionDtoFromJson(json);

  factory SubregionDto.fromJson(Map<String, dynamic> json) => SubregionDto(
        id: json['dicofre'] as String,
        name: json['freguesia'] as String,
        regionName: json['concelho'] as String,
      );
}
