// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'subregion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SubregionTearOff {
  const _$SubregionTearOff();

// ignore: unused_element
  _Subregion call(
      {@required String id,
      @required String regionId,
      @required String name,
      @required List<String> eventIds}) {
    return _Subregion(
      id: id,
      regionId: regionId,
      name: name,
      eventIds: eventIds,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Subregion = _$SubregionTearOff();

/// @nodoc
mixin _$Subregion {
  String get id;
  String get regionId; //?
  String get name;
  List<String> get eventIds;

  $SubregionCopyWith<Subregion> get copyWith;
}

/// @nodoc
abstract class $SubregionCopyWith<$Res> {
  factory $SubregionCopyWith(Subregion value, $Res Function(Subregion) then) =
      _$SubregionCopyWithImpl<$Res>;
  $Res call({String id, String regionId, String name, List<String> eventIds});
}

/// @nodoc
class _$SubregionCopyWithImpl<$Res> implements $SubregionCopyWith<$Res> {
  _$SubregionCopyWithImpl(this._value, this._then);

  final Subregion _value;
  // ignore: unused_field
  final $Res Function(Subregion) _then;

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
abstract class _$SubregionCopyWith<$Res> implements $SubregionCopyWith<$Res> {
  factory _$SubregionCopyWith(
          _Subregion value, $Res Function(_Subregion) then) =
      __$SubregionCopyWithImpl<$Res>;
  @override
  $Res call({String id, String regionId, String name, List<String> eventIds});
}

/// @nodoc
class __$SubregionCopyWithImpl<$Res> extends _$SubregionCopyWithImpl<$Res>
    implements _$SubregionCopyWith<$Res> {
  __$SubregionCopyWithImpl(_Subregion _value, $Res Function(_Subregion) _then)
      : super(_value, (v) => _then(v as _Subregion));

  @override
  _Subregion get _value => super._value as _Subregion;

  @override
  $Res call({
    Object id = freezed,
    Object regionId = freezed,
    Object name = freezed,
    Object eventIds = freezed,
  }) {
    return _then(_Subregion(
      id: id == freezed ? _value.id : id as String,
      regionId: regionId == freezed ? _value.regionId : regionId as String,
      name: name == freezed ? _value.name : name as String,
      eventIds:
          eventIds == freezed ? _value.eventIds : eventIds as List<String>,
    ));
  }
}

/// @nodoc
class _$_Subregion implements _Subregion {
  const _$_Subregion(
      {@required this.id,
      @required this.regionId,
      @required this.name,
      @required this.eventIds})
      : assert(id != null),
        assert(regionId != null),
        assert(name != null),
        assert(eventIds != null);

  @override
  final String id;
  @override
  final String regionId;
  @override //?
  final String name;
  @override
  final List<String> eventIds;

  @override
  String toString() {
    return 'Subregion(id: $id, regionId: $regionId, name: $name, eventIds: $eventIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Subregion &&
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
  _$SubregionCopyWith<_Subregion> get copyWith =>
      __$SubregionCopyWithImpl<_Subregion>(this, _$identity);
}

abstract class _Subregion implements Subregion {
  const factory _Subregion(
      {@required String id,
      @required String regionId,
      @required String name,
      @required List<String> eventIds}) = _$_Subregion;

  @override
  String get id;
  @override
  String get regionId;
  @override //?
  String get name;
  @override
  List<String> get eventIds;
  @override
  _$SubregionCopyWith<_Subregion> get copyWith;
}
