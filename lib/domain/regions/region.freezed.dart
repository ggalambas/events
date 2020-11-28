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
      {@required String name,
      @required int liveEvents,
      @required int totalEvents}) {
    return _Region(
      name: name,
      liveEvents: liveEvents,
      totalEvents: totalEvents,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Region = _$RegionTearOff();

/// @nodoc
mixin _$Region {
  String get name;
  int get liveEvents;
  int get totalEvents;

  $RegionCopyWith<Region> get copyWith;
}

/// @nodoc
abstract class $RegionCopyWith<$Res> {
  factory $RegionCopyWith(Region value, $Res Function(Region) then) =
      _$RegionCopyWithImpl<$Res>;
  $Res call({String name, int liveEvents, int totalEvents});
}

/// @nodoc
class _$RegionCopyWithImpl<$Res> implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._value, this._then);

  final Region _value;
  // ignore: unused_field
  final $Res Function(Region) _then;

  @override
  $Res call({
    Object name = freezed,
    Object liveEvents = freezed,
    Object totalEvents = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      liveEvents: liveEvents == freezed ? _value.liveEvents : liveEvents as int,
      totalEvents:
          totalEvents == freezed ? _value.totalEvents : totalEvents as int,
    ));
  }
}

/// @nodoc
abstract class _$RegionCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$RegionCopyWith(_Region value, $Res Function(_Region) then) =
      __$RegionCopyWithImpl<$Res>;
  @override
  $Res call({String name, int liveEvents, int totalEvents});
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
    Object name = freezed,
    Object liveEvents = freezed,
    Object totalEvents = freezed,
  }) {
    return _then(_Region(
      name: name == freezed ? _value.name : name as String,
      liveEvents: liveEvents == freezed ? _value.liveEvents : liveEvents as int,
      totalEvents:
          totalEvents == freezed ? _value.totalEvents : totalEvents as int,
    ));
  }
}

/// @nodoc
class _$_Region implements _Region {
  const _$_Region(
      {@required this.name,
      @required this.liveEvents,
      @required this.totalEvents})
      : assert(name != null),
        assert(liveEvents != null),
        assert(totalEvents != null);

  @override
  final String name;
  @override
  final int liveEvents;
  @override
  final int totalEvents;

  @override
  String toString() {
    return 'Region(name: $name, liveEvents: $liveEvents, totalEvents: $totalEvents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Region &&
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
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(liveEvents) ^
      const DeepCollectionEquality().hash(totalEvents);

  @override
  _$RegionCopyWith<_Region> get copyWith =>
      __$RegionCopyWithImpl<_Region>(this, _$identity);
}

abstract class _Region implements Region {
  const factory _Region(
      {@required String name,
      @required int liveEvents,
      @required int totalEvents}) = _$_Region;

  @override
  String get name;
  @override
  int get liveEvents;
  @override
  int get totalEvents;
  @override
  _$RegionCopyWith<_Region> get copyWith;
}
