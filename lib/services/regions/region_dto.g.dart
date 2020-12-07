// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegionDto _$_$_RegionDtoFromJson(Map<String, dynamic> json) {
  return _$_RegionDto(
    name: json['name'] as String,
    liveEvents: json['liveEvents'] as int ?? 0,
    totalEvents: json['totalEvents'] as int,
  );
}

Map<String, dynamic> _$_$_RegionDtoToJson(_$_RegionDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'liveEvents': instance.liveEvents,
      'totalEvents': instance.totalEvents,
    };
