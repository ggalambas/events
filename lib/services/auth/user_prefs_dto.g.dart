// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_prefs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserPrefsDto _$_$_UserPrefsDtoFromJson(Map<String, dynamic> json) {
  return _$_UserPrefsDto(
    categories: (json['categories'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
    region: json['region'] as String,
  );
}

Map<String, dynamic> _$_$_UserPrefsDtoToJson(_$_UserPrefsDto instance) =>
    <String, dynamic>{
      'categories':
          instance.categories?.map((k, e) => MapEntry(k.toString(), e)),
      'region': instance.region,
    };
