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
      @required @ServerTimeStampConverter() Timestamp date,
      @required String link,
      @required String regionId,
      @required String subregionId,
      @required String categoryId,
      @required String poster}) {
    return _EventDto(
      id: id,
      name: name,
      date: date,
      link: link,
      regionId: regionId,
      subregionId: subregionId,
      categoryId: categoryId,
      poster: poster,
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
  Timestamp get date;
  String get link;
  String get regionId;
  String get subregionId;
  String get categoryId;
  String get poster;

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
      @ServerTimeStampConverter() Timestamp date,
      String link,
      String regionId,
      String subregionId,
      String categoryId,
      String poster});
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
    Object date = freezed,
    Object link = freezed,
    Object regionId = freezed,
    Object subregionId = freezed,
    Object categoryId = freezed,
    Object poster = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      date: date == freezed ? _value.date : date as Timestamp,
      link: link == freezed ? _value.link : link as String,
      regionId: regionId == freezed ? _value.regionId : regionId as String,
      subregionId:
          subregionId == freezed ? _value.subregionId : subregionId as String,
      categoryId:
          categoryId == freezed ? _value.categoryId : categoryId as String,
      poster: poster == freezed ? _value.poster : poster as String,
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
      @ServerTimeStampConverter() Timestamp date,
      String link,
      String regionId,
      String subregionId,
      String categoryId,
      String poster});
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
    Object date = freezed,
    Object link = freezed,
    Object regionId = freezed,
    Object subregionId = freezed,
    Object categoryId = freezed,
    Object poster = freezed,
  }) {
    return _then(_EventDto(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      date: date == freezed ? _value.date : date as Timestamp,
      link: link == freezed ? _value.link : link as String,
      regionId: regionId == freezed ? _value.regionId : regionId as String,
      subregionId:
          subregionId == freezed ? _value.subregionId : subregionId as String,
      categoryId:
          categoryId == freezed ? _value.categoryId : categoryId as String,
      poster: poster == freezed ? _value.poster : poster as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_EventDto extends _EventDto {
  const _$_EventDto(
      {@JsonKey(ignore: true) this.id,
      @required this.name,
      @required @ServerTimeStampConverter() this.date,
      @required this.link,
      @required this.regionId,
      @required this.subregionId,
      @required this.categoryId,
      @required this.poster})
      : assert(name != null),
        assert(date != null),
        assert(link != null),
        assert(regionId != null),
        assert(subregionId != null),
        assert(categoryId != null),
        assert(poster != null),
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
  final Timestamp date;
  @override
  final String link;
  @override
  final String regionId;
  @override
  final String subregionId;
  @override
  final String categoryId;
  @override
  final String poster;

  @override
  String toString() {
    return 'EventDto(id: $id, name: $name, date: $date, link: $link, regionId: $regionId, subregionId: $subregionId, categoryId: $categoryId, poster: $poster)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.link, link) ||
                const DeepCollectionEquality().equals(other.link, link)) &&
            (identical(other.regionId, regionId) ||
                const DeepCollectionEquality()
                    .equals(other.regionId, regionId)) &&
            (identical(other.subregionId, subregionId) ||
                const DeepCollectionEquality()
                    .equals(other.subregionId, subregionId)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.poster, poster) ||
                const DeepCollectionEquality().equals(other.poster, poster)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(link) ^
      const DeepCollectionEquality().hash(regionId) ^
      const DeepCollectionEquality().hash(subregionId) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(poster);

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
      @required @ServerTimeStampConverter() Timestamp date,
      @required String link,
      @required String regionId,
      @required String subregionId,
      @required String categoryId,
      @required String poster}) = _$_EventDto;

  factory _EventDto.fromJson(Map<String, dynamic> json) = _$_EventDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get name;
  @override
  @ServerTimeStampConverter()
  Timestamp get date;
  @override
  String get link;
  @override
  String get regionId;
  @override
  String get subregionId;
  @override
  String get categoryId;
  @override
  String get poster;
  @override
  _$EventDtoCopyWith<_EventDto> get copyWith;
}
