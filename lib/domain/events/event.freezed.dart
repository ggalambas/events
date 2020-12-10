// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

// ignore: unused_element
  _Event call(
      {@required UniqueId id,
      @required EventName name,
      @required DateTime date,
      @required EventLink link,
      @required String regionId,
      @required String subregionId,
      @required String categoryId,
      @required Poster poster}) {
    return _Event(
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
}

/// @nodoc
// ignore: unused_element
const $Event = _$EventTearOff();

/// @nodoc
mixin _$Event {
  UniqueId get id;
  EventName get name;
  DateTime get date;
  EventLink get link;
  String get regionId;
  String get subregionId;
  String get categoryId;
  Poster get poster;

  $EventCopyWith<Event> get copyWith;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      EventName name,
      DateTime date,
      EventLink link,
      String regionId,
      String subregionId,
      String categoryId,
      Poster poster});
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

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
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as EventName,
      date: date == freezed ? _value.date : date as DateTime,
      link: link == freezed ? _value.link : link as EventLink,
      regionId: regionId == freezed ? _value.regionId : regionId as String,
      subregionId:
          subregionId == freezed ? _value.subregionId : subregionId as String,
      categoryId:
          categoryId == freezed ? _value.categoryId : categoryId as String,
      poster: poster == freezed ? _value.poster : poster as Poster,
    ));
  }
}

/// @nodoc
abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      EventName name,
      DateTime date,
      EventLink link,
      String regionId,
      String subregionId,
      String categoryId,
      Poster poster});
}

/// @nodoc
class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

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
    return _then(_Event(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as EventName,
      date: date == freezed ? _value.date : date as DateTime,
      link: link == freezed ? _value.link : link as EventLink,
      regionId: regionId == freezed ? _value.regionId : regionId as String,
      subregionId:
          subregionId == freezed ? _value.subregionId : subregionId as String,
      categoryId:
          categoryId == freezed ? _value.categoryId : categoryId as String,
      poster: poster == freezed ? _value.poster : poster as Poster,
    ));
  }
}

/// @nodoc
class _$_Event implements _Event {
  const _$_Event(
      {@required this.id,
      @required this.name,
      @required this.date,
      @required this.link,
      @required this.regionId,
      @required this.subregionId,
      @required this.categoryId,
      @required this.poster})
      : assert(id != null),
        assert(name != null),
        assert(date != null),
        assert(link != null),
        assert(regionId != null),
        assert(subregionId != null),
        assert(categoryId != null),
        assert(poster != null);

  @override
  final UniqueId id;
  @override
  final EventName name;
  @override
  final DateTime date;
  @override
  final EventLink link;
  @override
  final String regionId;
  @override
  final String subregionId;
  @override
  final String categoryId;
  @override
  final Poster poster;

  @override
  String toString() {
    return 'Event(id: $id, name: $name, date: $date, link: $link, regionId: $regionId, subregionId: $subregionId, categoryId: $categoryId, poster: $poster)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Event &&
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
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);
}

abstract class _Event implements Event {
  const factory _Event(
      {@required UniqueId id,
      @required EventName name,
      @required DateTime date,
      @required EventLink link,
      @required String regionId,
      @required String subregionId,
      @required String categoryId,
      @required Poster poster}) = _$_Event;

  @override
  UniqueId get id;
  @override
  EventName get name;
  @override
  DateTime get date;
  @override
  EventLink get link;
  @override
  String get regionId;
  @override
  String get subregionId;
  @override
  String get categoryId;
  @override
  Poster get poster;
  @override
  _$EventCopyWith<_Event> get copyWith;
}
