// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subregion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubregionDto _$_$_SubregionDtoFromJson(Map<String, dynamic> json) {
  return _$_SubregionDto(
    name: json['name'] as String,
    eventIds: (json['eventIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_SubregionDtoToJson(_$_SubregionDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'eventIds': instance.eventIds,
    };
