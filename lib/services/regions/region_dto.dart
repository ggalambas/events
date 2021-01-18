import 'package:events/domain/regions/region.dart';
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
}
