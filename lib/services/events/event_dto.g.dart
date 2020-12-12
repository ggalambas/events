// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventDto _$_$_EventDtoFromJson(Map<String, dynamic> json) {
  return _$_EventDto(
    name: json['name'] as String,
    date: const ServerTimeStampConverter().fromJson(json['date'] as int),
    link: json['link'] as String,
    regionId: json['regionId'] as String,
    subregionId: json['subregionId'] as String,
    categoryId: json['categoryId'] as String,
    poster: json['poster'] as String,
  );
}

Map<String, dynamic> _$_$_EventDtoToJson(_$_EventDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': const ServerTimeStampConverter().toJson(instance.date),
      'link': instance.link,
      'regionId': instance.regionId,
      'subregionId': instance.subregionId,
      'categoryId': instance.categoryId,
      'poster': instance.poster,
    };
