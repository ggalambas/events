import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/domain/auth/user_prefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_prefs_dto.freezed.dart';
part 'user_prefs_dto.g.dart';

@freezed
abstract class UserPrefsDto implements _$UserPrefsDto {
  const UserPrefsDto._();

  const factory UserPrefsDto({
    @required List<String> categories,
    @required String region,
    @required List<String> events,
  }) = _UserPrefsDto;

  factory UserPrefsDto.fromDomain(UserPrefs userPrefs) {
    return UserPrefsDto(
      categories: userPrefs.categories,
      region: userPrefs.region,
      events: userPrefs.events,
    );
  }

  UserPrefs toDomain() {
    return UserPrefs(
      categories: categories,
      region: region,
      events: events,
    );
  }

  factory UserPrefsDto.fromJson(Map<String, dynamic> json) =>
      _$UserPrefsDtoFromJson(json);

  factory UserPrefsDto.fromFirestore(DocumentSnapshot doc) =>
      UserPrefsDto.fromJson(doc.data());
}
