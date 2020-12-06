// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'region_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
RegionDto _$RegionDtoFromJson(Map<String, dynamic> json) {
  return _RegionDto.fromJson(json);
}

/// @nodoc
class _$RegionDtoTearOff {
  const _$RegionDtoTearOff();

// ignore: unused_element
  _RegionDto call(
      {@JsonKey(ignore: true) String id,
      @required String name,
      @required int liveEvents,
      @required int totalEvents}) {
    return _RegionDto(
      id: id,
      name: name,
      liveEvents: liveEvents,
      totalEvents: totalEvents,
    );
  }

// ignore: unused_element
  RegionDto fromJson(Map<String, Object> json) {
    return RegionDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $RegionDto = _$RegionDtoTearOff();

/// @nodoc
mixin _$RegionDto {
  @JsonKey(ignore: true)
  String get id;
  String get name;
  int get liveEvents;
  int get totalEvents;

  Map<String, dynamic> toJson();
  $RegionDtoCopyWith<RegionDto> get copyWith;
}

/// @nodoc
abstract class $RegionDtoCopyWith<$Res> {
  factory $RegionDtoCopyWith(RegionDto value, $Res Function(RegionDto) then) =
      _$RegionDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      String name,
      int liveEvents,
      int totalEvents});
}

/// @nodoc
class _$RegionDtoCopyWithImpl<$Res> implements $RegionDtoCopyWith<$Res> {
  _$RegionDtoCopyWithImpl(this._value, this._then);

  final RegionDto _value;
  // ignore: unused_field
  final $Res Function(RegionDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object liveEvents = freezed,
    Object totalEvents = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      liveEvents: liveEvents == freezed ? _value.liveEvents : liveEvents as int,
      totalEvents:
          totalEvents == freezed ? _value.totalEvents : totalEvents as int,
    ));
  }
}

/// @nodoc
abstract class _$RegionDtoCopyWith<$Res> implements $RegionDtoCopyWith<$Res> {
  factory _$RegionDtoCopyWith(
          _RegionDto value, $Res Function(_RegionDto) then) =
      __$RegionDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String id,
      String name,
      int liveEvents,
      int totalEvents});
}

/// @nodoc
class __$RegionDtoCopyWithImpl<$Res> extends _$RegionDtoCopyWithImpl<$Res>
    implements _$RegionDtoCopyWith<$Res> {
  __$RegionDtoCopyWithImpl(_RegionDto _value, $Res Function(_RegionDto) _then)
      : super(_value, (v) => _then(v as _RegionDto));

  @override
  _RegionDto get _value => super._value as _RegionDto;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object liveEvents = freezed,
    Object totalEvents = freezed,
  }) {
    return _then(_RegionDto(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      liveEvents: liveEvents == freezed ? _value.liveEvents : liveEvents as int,
      totalEvents:
          totalEvents == freezed ? _value.totalEvents : totalEvents as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_RegionDto extends _RegionDto {
  const _$_RegionDto(
      {@JsonKey(ignore: true) this.id,
      @required this.name,
      @required this.liveEvents,
      @required this.totalEvents})
      : assert(name != null),
        assert(liveEvents != null),
        assert(totalEvents != null),
        super._();

  factory _$_RegionDto.fromJson(Map<String, dynamic> json) =>
      _$_$_RegionDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String name;
  @override
  final int liveEvents;
  @override
  final int totalEvents;

  @override
  String toString() {
    return 'RegionDto(id: $id, name: $name, liveEvents: $liveEvents, totalEvents: $totalEvents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegionDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.liveEvents, liveEvents) ||
                const DeepCollectionEquality()
                    .equals(other.liveEvents, liveEvents)) &&
            (identical(other.totalEvents, totalEvents) ||
                const DeepCollectionEquality()
                    .equals(other.totalEvents, totalEvents)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(liveEvents) ^
      const DeepCollectionEquality().hash(totalEvents);

  @override
  _$RegionDtoCopyWith<_RegionDto> get copyWith =>
      __$RegionDtoCopyWithImpl<_RegionDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RegionDtoToJson(this);
  }
}

abstract class _RegionDto extends RegionDto {
  const _RegionDto._() : super._();
  const factory _RegionDto(
      {@JsonKey(ignore: true) String id,
      @required String name,
      @required int liveEvents,
      @required int totalEvents}) = _$_RegionDto;

  factory _RegionDto.fromJson(Map<String, dynamic> json) =
      _$_RegionDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get name;
  @override
  int get liveEvents;
  @override
  int get totalEvents;
  @override
  _$RegionDtoCopyWith<_RegionDto> get copyWith;
}
