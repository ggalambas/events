// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_prefs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserPrefsDto _$_$_UserPrefsDtoFromJson(Map<String, dynamic> json) {
  return _$_UserPrefsDto(
    categories: (json['categories'] as List)?.map((e) => e as String)?.toList(),
    region: json['region'] as String,
    events: (json['events'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_UserPrefsDtoToJson(_$_UserPrefsDto instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'region': instance.region,
      'events': instance.events,
    };
