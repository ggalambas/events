import 'package:events/domain/auth/user_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_prefs_dto.freezed.dart';
part 'user_prefs_dto.g.dart';

@freezed
abstract class UserPrefsDto implements _$UserPrefsDto {
  const UserPrefsDto._();

  const factory UserPrefsDto({
    @required Map<int, String> categories,
    @required String region,
  }) = _UserPrefsDto;

  factory UserPrefsDto.fromDomain(UserPrefs userPrefs) {
    return UserPrefsDto(
      categories: userPrefs.categories,
      region: userPrefs.region,
    );
  }

  UserPrefs toDomain() {
    return UserPrefs(
      categories: categories,
      region: region,
    );
  }

  factory UserPrefsDto.fromJson(Map<String, dynamic> json) =>
      _$UserPrefsDtoFromJson(json);

  factory UserPrefsDto.fromFirestore(DocumentSnapshot doc) =>
      UserPrefsDto.fromJson(doc.data());
}
