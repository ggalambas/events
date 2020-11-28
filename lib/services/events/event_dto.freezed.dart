// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
EventDto _$EventDtoFromJson(Map<String, dynamic> json) {
  return _EventDto.fromJson(json);
}

/// @nodoc
class _$EventDtoTearOff {
  const _$EventDtoTearOff();

// ignore: unused_element
  _EventDto call(
      {@JsonKey(ignore: true) String id,
      @required String name,
      @required @ServerTimeStampConverter() Timestamp time,
      @required String link}) {
    return _EventDto(
      id: id,
      name: name,
      time: time,
      link: link,
    );
  }

// ignore: unused_element
  EventDto fromJson(Map<String, Object> json) {
    return EventDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $EventDto = _$EventDtoTearOff();

/// @nodoc
mixin _$EventDto {
  @JsonKey(ignore: true)
  String get id;
  String get name;
  @ServerTimeStampConverter()
  Timestamp get time;
  String get link;

  Map<String, dynamic> toJson();
  $EventDtoCopyWith<EventDto> get copyWith;
}

/// @nodoc
abstract class $EventDtoCopyWith<$Res> {
  factory $EventDtoCopyWith(EventDto value, $Res Function(EventDto) then) =
      _$EventDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      String name,
      @ServerTimeStampConverter() Timestamp time,
      String link});
}

/// @nodoc
class _$EventDtoCopyWithImpl<$Res> implements $EventDtoCopyWith<$Res> {
  _$EventDtoCopyWithImpl(this._value, this._then);

  final EventDto _value;
  // ignore: unused_field
  final $Res Function(EventDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object time = freezed,
    Object link = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      time: time == freezed ? _value.time : time as Timestamp,
      link: link == freezed ? _value.link : link as String,
    ));
  }
}

/// @nodoc
abstract class _$EventDtoCopyWith<$Res> implements $EventDtoCopyWith<$Res> {
  factory _$EventDtoCopyWith(_EventDto value, $Res Function(_EventDto) then) =
      __$EventDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String id,
      String name,
      @ServerTimeStampConverter() Timestamp time,
      String link});
}

/// @nodoc
class __$EventDtoCopyWithImpl<$Res> extends _$EventDtoCopyWithImpl<$Res>
    implements _$EventDtoCopyWith<$Res> {
  __$EventDtoCopyWithImpl(_EventDto _value, $Res Function(_EventDto) _then)
      : super(_value, (v) => _then(v as _EventDto));

  @override
  _EventDto get _value => super._value as _EventDto;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object time = freezed,
    Object link = freezed,
  }) {
    return _then(_EventDto(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      time: time == freezed ? _value.time : time as Timestamp,
      link: link == freezed ? _value.link : link as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_EventDto extends _EventDto {
  const _$_EventDto(
      {@JsonKey(ignore: true) this.id,
      @required this.name,
      @required @ServerTimeStampConverter() this.time,
      @required this.link})
      : assert(name != null),
        assert(time != null),
        assert(link != null),
        super._();

  factory _$_EventDto.fromJson(Map<String, dynamic> json) =>
      _$_$_EventDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String name;
  @override
  @ServerTimeStampConverter()
  final Timestamp time;
  @override
  final String link;

  @override
  String toString() {
    return 'EventDto(id: $id, name: $name, time: $time, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.link, link) ||
                const DeepCollectionEquality().equals(other.link, link)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(link);

  @override
  _$EventDtoCopyWith<_EventDto> get copyWith =>
      __$EventDtoCopyWithImpl<_EventDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EventDtoToJson(this);
  }
}

abstract class _EventDto extends EventDto {
  const _EventDto._() : super._();
  const factory _EventDto(
      {@JsonKey(ignore: true) String id,
      @required String name,
      @required @ServerTimeStampConverter() Timestamp time,
      @required String link}) = _$_EventDto;

  factory _EventDto.fromJson(Map<String, dynamic> json) = _$_EventDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get name;
  @override
  @ServerTimeStampConverter()
  Timestamp get time;
  @override
  String get link;
  @override
  _$EventDtoCopyWith<_EventDto> get copyWith;
}
