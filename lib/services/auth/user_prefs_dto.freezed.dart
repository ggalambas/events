// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_prefs_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserPrefsDto _$UserPrefsDtoFromJson(Map<String, dynamic> json) {
  return _UserPrefsDto.fromJson(json);
}

/// @nodoc
class _$UserPrefsDtoTearOff {
  const _$UserPrefsDtoTearOff();

// ignore: unused_element
  _UserPrefsDto call(
      {@required Map<int, String> categories, @required String region}) {
    return _UserPrefsDto(
      categories: categories,
      region: region,
    );
  }

// ignore: unused_element
  UserPrefsDto fromJson(Map<String, Object> json) {
    return UserPrefsDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserPrefsDto = _$UserPrefsDtoTearOff();

/// @nodoc
mixin _$UserPrefsDto {
  Map<int, String> get categories;
  String get region;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $UserPrefsDtoCopyWith<UserPrefsDto> get copyWith;
}

/// @nodoc
abstract class $UserPrefsDtoCopyWith<$Res> {
  factory $UserPrefsDtoCopyWith(
          UserPrefsDto value, $Res Function(UserPrefsDto) then) =
      _$UserPrefsDtoCopyWithImpl<$Res>;
  $Res call({Map<int, String> categories, String region});
}

/// @nodoc
class _$UserPrefsDtoCopyWithImpl<$Res> implements $UserPrefsDtoCopyWith<$Res> {
  _$UserPrefsDtoCopyWithImpl(this._value, this._then);

  final UserPrefsDto _value;
  // ignore: unused_field
  final $Res Function(UserPrefsDto) _then;

  @override
  $Res call({
    Object categories = freezed,
    Object region = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories as Map<int, String>,
      region: region == freezed ? _value.region : region as String,
    ));
  }
}

/// @nodoc
abstract class _$UserPrefsDtoCopyWith<$Res>
    implements $UserPrefsDtoCopyWith<$Res> {
  factory _$UserPrefsDtoCopyWith(
          _UserPrefsDto value, $Res Function(_UserPrefsDto) then) =
      __$UserPrefsDtoCopyWithImpl<$Res>;
  @override
  $Res call({Map<int, String> categories, String region});
}

/// @nodoc
class __$UserPrefsDtoCopyWithImpl<$Res> extends _$UserPrefsDtoCopyWithImpl<$Res>
    implements _$UserPrefsDtoCopyWith<$Res> {
  __$UserPrefsDtoCopyWithImpl(
      _UserPrefsDto _value, $Res Function(_UserPrefsDto) _then)
      : super(_value, (v) => _then(v as _UserPrefsDto));

  @override
  _UserPrefsDto get _value => super._value as _UserPrefsDto;

  @override
  $Res call({
    Object categories = freezed,
    Object region = freezed,
  }) {
    return _then(_UserPrefsDto(
      categories: categories == freezed
          ? _value.categories
          : categories as Map<int, String>,
      region: region == freezed ? _value.region : region as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserPrefsDto extends _UserPrefsDto {
  const _$_UserPrefsDto({@required this.categories, @required this.region})
      : assert(categories != null),
        assert(region != null),
        super._();

  factory _$_UserPrefsDto.fromJson(Map<String, dynamic> json) =>
      _$_$_UserPrefsDtoFromJson(json);

  @override
  final Map<int, String> categories;
  @override
  final String region;

  @override
  String toString() {
    return 'UserPrefsDto(categories: $categories, region: $region)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserPrefsDto &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.region, region) ||
                const DeepCollectionEquality().equals(other.region, region)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(region);

  @JsonKey(ignore: true)
  @override
  _$UserPrefsDtoCopyWith<_UserPrefsDto> get copyWith =>
      __$UserPrefsDtoCopyWithImpl<_UserPrefsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserPrefsDtoToJson(this);
  }
}

abstract class _UserPrefsDto extends UserPrefsDto {
  const _UserPrefsDto._() : super._();
  const factory _UserPrefsDto(
      {@required Map<int, String> categories,
      @required String region}) = _$_UserPrefsDto;

  factory _UserPrefsDto.fromJson(Map<String, dynamic> json) =
      _$_UserPrefsDto.fromJson;

  @override
  Map<int, String> get categories;
  @override
  String get region;
  @override
  @JsonKey(ignore: true)
  _$UserPrefsDtoCopyWith<_UserPrefsDto> get copyWith;
}
