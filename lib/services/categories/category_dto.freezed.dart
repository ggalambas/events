// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) {
  return _CategoryDto.fromJson(json);
}

/// @nodoc
class _$CategoryDtoTearOff {
  const _$CategoryDtoTearOff();

// ignore: unused_element
  _CategoryDto call(
      {@JsonKey(ignore: true) String name,
      @required int icon,
      @required int liveEvents,
      @required int totalEvents}) {
    return _CategoryDto(
      name: name,
      icon: icon,
      liveEvents: liveEvents,
      totalEvents: totalEvents,
    );
  }

// ignore: unused_element
  CategoryDto fromJson(Map<String, Object> json) {
    return CategoryDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CategoryDto = _$CategoryDtoTearOff();

/// @nodoc
mixin _$CategoryDto {
  @JsonKey(ignore: true)
  String get name;
  int get icon;
  int get liveEvents;
  int get totalEvents;

  Map<String, dynamic> toJson();
  $CategoryDtoCopyWith<CategoryDto> get copyWith;
}

/// @nodoc
abstract class $CategoryDtoCopyWith<$Res> {
  factory $CategoryDtoCopyWith(
          CategoryDto value, $Res Function(CategoryDto) then) =
      _$CategoryDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String name,
      int icon,
      int liveEvents,
      int totalEvents});
}

/// @nodoc
class _$CategoryDtoCopyWithImpl<$Res> implements $CategoryDtoCopyWith<$Res> {
  _$CategoryDtoCopyWithImpl(this._value, this._then);

  final CategoryDto _value;
  // ignore: unused_field
  final $Res Function(CategoryDto) _then;

  @override
  $Res call({
    Object name = freezed,
    Object icon = freezed,
    Object liveEvents = freezed,
    Object totalEvents = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      icon: icon == freezed ? _value.icon : icon as int,
      liveEvents: liveEvents == freezed ? _value.liveEvents : liveEvents as int,
      totalEvents:
          totalEvents == freezed ? _value.totalEvents : totalEvents as int,
    ));
  }
}

/// @nodoc
abstract class _$CategoryDtoCopyWith<$Res>
    implements $CategoryDtoCopyWith<$Res> {
  factory _$CategoryDtoCopyWith(
          _CategoryDto value, $Res Function(_CategoryDto) then) =
      __$CategoryDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String name,
      int icon,
      int liveEvents,
      int totalEvents});
}

/// @nodoc
class __$CategoryDtoCopyWithImpl<$Res> extends _$CategoryDtoCopyWithImpl<$Res>
    implements _$CategoryDtoCopyWith<$Res> {
  __$CategoryDtoCopyWithImpl(
      _CategoryDto _value, $Res Function(_CategoryDto) _then)
      : super(_value, (v) => _then(v as _CategoryDto));

  @override
  _CategoryDto get _value => super._value as _CategoryDto;

  @override
  $Res call({
    Object name = freezed,
    Object icon = freezed,
    Object liveEvents = freezed,
    Object totalEvents = freezed,
  }) {
    return _then(_CategoryDto(
      name: name == freezed ? _value.name : name as String,
      icon: icon == freezed ? _value.icon : icon as int,
      liveEvents: liveEvents == freezed ? _value.liveEvents : liveEvents as int,
      totalEvents:
          totalEvents == freezed ? _value.totalEvents : totalEvents as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CategoryDto extends _CategoryDto {
  const _$_CategoryDto(
      {@JsonKey(ignore: true) this.name,
      @required this.icon,
      @required this.liveEvents,
      @required this.totalEvents})
      : assert(icon != null),
        assert(liveEvents != null),
        assert(totalEvents != null),
        super._();

  factory _$_CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$_$_CategoryDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String name;
  @override
  final int icon;
  @override
  final int liveEvents;
  @override
  final int totalEvents;

  @override
  String toString() {
    return 'CategoryDto(name: $name, icon: $icon, liveEvents: $liveEvents, totalEvents: $totalEvents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CategoryDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
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
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(liveEvents) ^
      const DeepCollectionEquality().hash(totalEvents);

  @override
  _$CategoryDtoCopyWith<_CategoryDto> get copyWith =>
      __$CategoryDtoCopyWithImpl<_CategoryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CategoryDtoToJson(this);
  }
}

abstract class _CategoryDto extends CategoryDto {
  const _CategoryDto._() : super._();
  const factory _CategoryDto(
      {@JsonKey(ignore: true) String name,
      @required int icon,
      @required int liveEvents,
      @required int totalEvents}) = _$_CategoryDto;

  factory _CategoryDto.fromJson(Map<String, dynamic> json) =
      _$_CategoryDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get name;
  @override
  int get icon;
  @override
  int get liveEvents;
  @override
  int get totalEvents;
  @override
  _$CategoryDtoCopyWith<_CategoryDto> get copyWith;
}
