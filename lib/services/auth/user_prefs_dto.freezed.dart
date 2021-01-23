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
      {@required List<String> categories,
      @required String region,
      @required List<String> events}) {
    return _UserPrefsDto(
      categories: categories,
      region: region,
      events: events,
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
  List<String> get categories;
  String get region;
  List<String> get events;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $UserPrefsDtoCopyWith<UserPrefsDto> get copyWith;
}

/// @nodoc
abstract class $UserPrefsDtoCopyWith<$Res> {
  factory $UserPrefsDtoCopyWith(
          UserPrefsDto value, $Res Function(UserPrefsDto) then) =
      _$UserPrefsDtoCopyWithImpl<$Res>;
  $Res call({List<String> categories, String region, List<String> events});
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
    Object events = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories as List<String>,
      region: region == freezed ? _value.region : region as String,
      events: events == freezed ? _value.events : events as List<String>,
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
  $Res call({List<String> categories, String region, List<String> events});
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
    Object events = freezed,
  }) {
    return _then(_UserPrefsDto(
      categories: categories == freezed
          ? _value.categories
          : categories as List<String>,
      region: region == freezed ? _value.region : region as String,
      events: events == freezed ? _value.events : events as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserPrefsDto extends _UserPrefsDto {
  const _$_UserPrefsDto(
      {@required this.categories, @required this.region, @required this.events})
      : assert(categories != null),
        assert(region != null),
        assert(events != null),
        super._();

  factory _$_UserPrefsDto.fromJson(Map<String, dynamic> json) =>
      _$_$_UserPrefsDtoFromJson(json);

  @override
  final List<String> categories;
  @override
  final String region;
  @override
  final List<String> events;

  @override
  String toString() {
    return 'UserPrefsDto(categories: $categories, region: $region, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserPrefsDto &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.region, region) ||
                const DeepCollectionEquality().equals(other.region, region)) &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(region) ^
      const DeepCollectionEquality().hash(events);

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
      {@required List<String> categories,
      @required String region,
      @required List<String> events}) = _$_UserPrefsDto;

  factory _UserPrefsDto.fromJson(Map<String, dynamic> json) =
      _$_UserPrefsDto.fromJson;

  @override
  List<String> get categories;
  @override
  String get region;
  @override
  List<String> get events;
  @override
  @JsonKey(ignore: true)
  _$UserPrefsDtoCopyWith<_UserPrefsDto> get copyWith;
}
