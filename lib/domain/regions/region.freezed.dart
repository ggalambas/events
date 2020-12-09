// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'region.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RegionTearOff {
  const _$RegionTearOff();

// ignore: unused_element
  _Region call(
      {@required String id,
      @required String name,
      @required EventCounter eventCounter}) {
    return _Region(
      id: id,
      name: name,
      eventCounter: eventCounter,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Region = _$RegionTearOff();

/// @nodoc
mixin _$Region {
  String get id;
  String get name;
  EventCounter get eventCounter;

  $RegionCopyWith<Region> get copyWith;
}

/// @nodoc
abstract class $RegionCopyWith<$Res> {
  factory $RegionCopyWith(Region value, $Res Function(Region) then) =
      _$RegionCopyWithImpl<$Res>;
  $Res call({String id, String name, EventCounter eventCounter});
}

/// @nodoc
class _$RegionCopyWithImpl<$Res> implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._value, this._then);

  final Region _value;
  // ignore: unused_field
  final $Res Function(Region) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object eventCounter = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      eventCounter: eventCounter == freezed
          ? _value.eventCounter
          : eventCounter as EventCounter,
    ));
  }
}

/// @nodoc
abstract class _$RegionCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$RegionCopyWith(_Region value, $Res Function(_Region) then) =
      __$RegionCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, EventCounter eventCounter});
}

/// @nodoc
class __$RegionCopyWithImpl<$Res> extends _$RegionCopyWithImpl<$Res>
    implements _$RegionCopyWith<$Res> {
  __$RegionCopyWithImpl(_Region _value, $Res Function(_Region) _then)
      : super(_value, (v) => _then(v as _Region));

  @override
  _Region get _value => super._value as _Region;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object eventCounter = freezed,
  }) {
    return _then(_Region(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      eventCounter: eventCounter == freezed
          ? _value.eventCounter
          : eventCounter as EventCounter,
    ));
  }
}

/// @nodoc
class _$_Region implements _Region {
  const _$_Region(
      {@required this.id, @required this.name, @required this.eventCounter})
      : assert(id != null),
        assert(name != null),
        assert(eventCounter != null);

  @override
  final String id;
  @override
  final String name;
  @override
  final EventCounter eventCounter;

  @override
  String toString() {
    return 'Region(id: $id, name: $name, eventCounter: $eventCounter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Region &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.eventCounter, eventCounter) ||
                const DeepCollectionEquality()
                    .equals(other.eventCounter, eventCounter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(eventCounter);

  @override
  _$RegionCopyWith<_Region> get copyWith =>
      __$RegionCopyWithImpl<_Region>(this, _$identity);
}

abstract class _Region implements Region {
  const factory _Region(
      {@required String id,
      @required String name,
      @required EventCounter eventCounter}) = _$_Region;

  @override
  String get id;
  @override
  String get name;
  @override
  EventCounter get eventCounter;
  @override
  _$RegionCopyWith<_Region> get copyWith;
}
