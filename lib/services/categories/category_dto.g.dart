// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryDto _$_$_CategoryDtoFromJson(Map<String, dynamic> json) {
  return _$_CategoryDto(
    name: json['name'] as String,
    icon: json['icon'] as int,
    liveEvents: json['liveEvents'] as int,
    totalEvents: json['totalEvents'] as int,
  );
}

Map<String, dynamic> _$_$_CategoryDtoToJson(_$_CategoryDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'liveEvents': instance.liveEvents,
      'totalEvents': instance.totalEvents,
    };