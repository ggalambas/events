// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_counter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventCounterDto _$EventCounterDtoFromJson(Map<String, dynamic> json) {
  return EventCounterDto(
    live: json['live'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$EventCounterDtoToJson(EventCounterDto instance) =>
    <String, dynamic>{
      'live': instance.live,
      'total': instance.total,
    };
