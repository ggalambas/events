import 'package:events/config/injection.dart';
import 'package:events/domain/regions/region.dart';
import 'package:flutter/foundation.dart';

class RegionDto {
  int level;
  String code;
  String name;

  RegionDto({
    @required this.level,
    @required this.code,
    @required this.name,
  });

  Region toDomain() {
    return Region(
      id: code,
      name: name,
    );
  }

  factory RegionDto.fromJson(Map<String, dynamic> json) => RegionDto(
        level: json['level'] as int,
        code: json['code'].toString(),
        name: json['name'] as String,
      );
}
