// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subregion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubregionDto _$SubregionDtoFromJson(Map<String, dynamic> json) {
  return SubregionDto(
    id: json['id'] as String,
    name: json['name'] as String,
    regionName: json['regionName'] as String,
  );
}

Map<String, dynamic> _$SubregionDtoToJson(SubregionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'regionName': instance.regionName,
    };
