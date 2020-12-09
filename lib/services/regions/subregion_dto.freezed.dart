// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'subregion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SubregionDto _$SubregionDtoFromJson(Map<String, dynamic> json) {
  return _SubregionDto.fromJson(json);
}

/// @nodoc
class _$SubregionDtoTearOff {
  const _$SubregionDtoTearOff();

// ignore: unused_element
  _SubregionDto call(
      {@JsonKey(ignore: true) String id,
      @JsonKey(ignore: true) String regionId,
      @required String name,
      @required List<String> eventIds}) {
    return _SubregionDto(
      id: id,
      regionId: regionId,
      name: name,
      eventIds: eventIds,
    );
  }

// ignore: unused_element
  SubregionDto fromJson(Map<String, Object> json) {
    return SubregionDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $SubregionDto = _$SubregionDtoTearOff();

/// @nodoc
mixin _$SubregionDto {
  @JsonKey(ignore: true)
  String get id;
  @JsonKey(ignore: true)
  String get regionId;
  String get name;
  List<String> get eventIds;

  Map<String, dynamic> toJson();
  $SubregionDtoCopyWith<SubregionDto> get copyWith;
}

/// @nodoc
abstract class $SubregionDtoCopyWith<$Res> {
  factory $SubregionDtoCopyWith(
          SubregionDto value, $Res Function(SubregionDto) then) =
      _$SubregionDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      @JsonKey(ignore: true) String regionId,
      String name,
      List<String> eventIds});
}

/// @nodoc
class _$SubregionDtoCopyWithImpl<$Res> implements $SubregionDtoCopyWith<$Res> {
  _$SubregionDtoCopyWithImpl(this._value, this._then);

  final SubregionDto _value;
  // ignore: unused_field
  final $Res Function(SubregionDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object regionId = freezed,
    Object name = freezed,
    Object eventIds = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      regionId: regionId == freezed ? _value.regionId : regionId as String,
      name: name == freezed ? _value.name : name as String,
      eventIds:
          eventIds == freezed ? _value.eventIds : eventIds as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$SubregionDtoCopyWith<$Res>
    implements $SubregionDtoCopyWith<$Res> {
  factory _$SubregionDtoCopyWith(
          _SubregionDto value, $Res Function(_SubregionDto) then) =
      __$SubregionDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String id,
      @JsonKey(ignore: true) String regionId,
      String name,
      List<String> eventIds});
}

/// @nodoc
class __$SubregionDtoCopyWithImpl<$Res> extends _$SubregionDtoCopyWithImpl<$Res>
    implements _$SubregionDtoCopyWith<$Res> {
  __$SubregionDtoCopyWithImpl(
      _SubregionDto _value, $Res Function(_SubregionDto) _then)
      : super(_value, (v) => _then(v as _SubregionDto));

  @override
  _SubregionDto get _value => super._value as _SubregionDto;

  @override
  $Res call({
    Object id = freezed,
    Object regionId = freezed,
    Object name = freezed,
    Object eventIds = freezed,
  }) {
    return _then(_SubregionDto(
      id: id == freezed ? _value.id : id as String,
      regionId: regionId == freezed ? _value.regionId : regionId as String,
      name: name == freezed ? _value.name : name as String,
      eventIds:
          eventIds == freezed ? _value.eventIds : eventIds as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SubregionDto extends _SubregionDto {
  const _$_SubregionDto(
      {@JsonKey(ignore: true) this.id,
      @JsonKey(ignore: true) this.regionId,
      @required this.name,
      @required this.eventIds})
      : assert(name != null),
        assert(eventIds != null),
        super._();

  factory _$_SubregionDto.fromJson(Map<String, dynamic> json) =>
      _$_$_SubregionDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  @JsonKey(ignore: true)
  final String regionId;
  @override
  final String name;
  @override
  final List<String> eventIds;

  @override
  String toString() {
    return 'SubregionDto(id: $id, regionId: $regionId, name: $name, eventIds: $eventIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubregionDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.regionId, regionId) ||
                const DeepCollectionEquality()
                    .equals(other.regionId, regionId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.eventIds, eventIds) ||
                const DeepCollectionEquality()
                    .equals(other.eventIds, eventIds)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(regionId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(eventIds);

  @override
  _$SubregionDtoCopyWith<_SubregionDto> get copyWith =>
      __$SubregionDtoCopyWithImpl<_SubregionDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubregionDtoToJson(this);
  }
}

abstract class _SubregionDto extends SubregionDto {
  const _SubregionDto._() : super._();
  const factory _SubregionDto(
      {@JsonKey(ignore: true) String id,
      @JsonKey(ignore: true) String regionId,
      @required String name,
      @required List<String> eventIds}) = _$_SubregionDto;

  factory _SubregionDto.fromJson(Map<String, dynamic> json) =
      _$_SubregionDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  @JsonKey(ignore: true)
  String get regionId;
  @override
  String get name;
  @override
  List<String> get eventIds;
  @override
  _$SubregionDtoCopyWith<_SubregionDto> get copyWith;
}
