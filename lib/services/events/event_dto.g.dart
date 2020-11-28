// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventDto _$_$_EventDtoFromJson(Map<String, dynamic> json) {
  return _$_EventDto(
    name: json['name'] as String,
    time: const ServerTimeStampConverter().fromJson(json['time'] as int),
    link: json['link'] as String,
  );
}

Map<String, dynamic> _$_$_EventDtoToJson(_$_EventDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'time': const ServerTimeStampConverter().toJson(instance.time),
      'link': instance.link,
    };
