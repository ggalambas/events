// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$CategoryTearOff {
  const _$CategoryTearOff();

// ignore: unused_element
  _Category call(
      {@required String name,
      @required IconData icon,
      @required EventCounter eventCounter}) {
    return _Category(
      name: name,
      icon: icon,
      eventCounter: eventCounter,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Category = _$CategoryTearOff();

/// @nodoc
mixin _$Category {
  String get name;
  IconData get icon;
  EventCounter get eventCounter;

  $CategoryCopyWith<Category> get copyWith;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res>;
  $Res call({String name, IconData icon, EventCounter eventCounter});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res> implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  final Category _value;
  // ignore: unused_field
  final $Res Function(Category) _then;

  @override
  $Res call({
    Object name = freezed,
    Object icon = freezed,
    Object eventCounter = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      icon: icon == freezed ? _value.icon : icon as IconData,
      eventCounter: eventCounter == freezed
          ? _value.eventCounter
          : eventCounter as EventCounter,
    ));
  }
}

/// @nodoc
abstract class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) then) =
      __$CategoryCopyWithImpl<$Res>;
  @override
  $Res call({String name, IconData icon, EventCounter eventCounter});
}

/// @nodoc
class __$CategoryCopyWithImpl<$Res> extends _$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(_Category _value, $Res Function(_Category) _then)
      : super(_value, (v) => _then(v as _Category));

  @override
  _Category get _value => super._value as _Category;

  @override
  $Res call({
    Object name = freezed,
    Object icon = freezed,
    Object eventCounter = freezed,
  }) {
    return _then(_Category(
      name: name == freezed ? _value.name : name as String,
      icon: icon == freezed ? _value.icon : icon as IconData,
      eventCounter: eventCounter == freezed
          ? _value.eventCounter
          : eventCounter as EventCounter,
    ));
  }
}

/// @nodoc
class _$_Category implements _Category {
  const _$_Category(
      {@required this.name, @required this.icon, @required this.eventCounter})
      : assert(name != null),
        assert(icon != null),
        assert(eventCounter != null);

  @override
  final String name;
  @override
  final IconData icon;
  @override
  final EventCounter eventCounter;

  @override
  String toString() {
    return 'Category(name: $name, icon: $icon, eventCounter: $eventCounter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Category &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.eventCounter, eventCounter) ||
                const DeepCollectionEquality()
                    .equals(other.eventCounter, eventCounter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(eventCounter);

  @override
  _$CategoryCopyWith<_Category> get copyWith =>
      __$CategoryCopyWithImpl<_Category>(this, _$identity);
}

abstract class _Category implements Category {
  const factory _Category(
      {@required String name,
      @required IconData icon,
      @required EventCounter eventCounter}) = _$_Category;

  @override
  String get name;
  @override
  IconData get icon;
  @override
  EventCounter get eventCounter;
  @override
  _$CategoryCopyWith<_Category> get copyWith;
}
