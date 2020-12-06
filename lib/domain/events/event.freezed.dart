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
      @required EventLink link}) {
    return _Event(
      id: id,
      name: name,
      date: date,
      link: link,
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

  $EventCopyWith<Event> get copyWith;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call({UniqueId id, EventName name, DateTime date, EventLink link});
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
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as EventName,
      date: date == freezed ? _value.date : date as DateTime,
      link: link == freezed ? _value.link : link as EventLink,
    ));
  }
}

/// @nodoc
abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, EventName name, DateTime date, EventLink link});
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
  }) {
    return _then(_Event(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as EventName,
      date: date == freezed ? _value.date : date as DateTime,
      link: link == freezed ? _value.link : link as EventLink,
    ));
  }
}

/// @nodoc
class _$_Event implements _Event {
  const _$_Event(
      {@required this.id,
      @required this.name,
      @required this.date,
      @required this.link})
      : assert(id != null),
        assert(name != null),
        assert(date != null),
        assert(link != null);

  @override
  final UniqueId id;
  @override
  final EventName name;
  @override
  final DateTime date;
  @override
  final EventLink link;

  @override
  String toString() {
    return 'Event(id: $id, name: $name, date: $date, link: $link)';
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
                const DeepCollectionEquality().equals(other.link, link)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(link);

  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);
}

abstract class _Event implements Event {
  const factory _Event(
      {@required UniqueId id,
      @required EventName name,
      @required DateTime date,
      @required EventLink link}) = _$_Event;

  @override
  UniqueId get id;
  @override
  EventName get name;
  @override
  DateTime get date;
  @override
  EventLink get link;
  @override
  _$EventCopyWith<_Event> get copyWith;
}
