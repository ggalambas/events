// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'value_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

// ignore: unused_element
  ExceedingLength<T> exceedingLength<T>(
      {@required T failedValue, @required int max}) {
    return ExceedingLength<T>(
      failedValue: failedValue,
      max: max,
    );
  }

// ignore: unused_element
  Empty<T> empty<T>({@required T failedValue}) {
    return Empty<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  Multiline<T> multiline<T>({@required T failedValue}) {
    return Multiline<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  InvalidUrl<T> invalidUrl<T>({@required T failedValue}) {
    return InvalidUrl<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  WrongFileFormat<T> wrongFileFormat<T>({@required T failedValue}) {
    return WrongFileFormat<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  WrongImageDimensions<T> wrongImageDimensions<T>({@required T failedValue}) {
    return WrongImageDimensions<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  InvalidEmail<T> invalidEmail<T>({@required T failedValue}) {
    return InvalidEmail<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  ShortPassword<T> shortPassword<T>({@required T failedValue}) {
    return ShortPassword<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ValueFailure = _$ValueFailureTearOff();

/// @nodoc
mixin _$ValueFailure<T> {
  T get failedValue;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult exceedingLength(T failedValue, int max),
    @required TResult empty(T failedValue),
    @required TResult multiline(T failedValue),
    @required TResult invalidUrl(T failedValue),
    @required TResult wrongFileFormat(T failedValue),
    @required TResult wrongImageDimensions(T failedValue),
    @required TResult invalidEmail(T failedValue),
    @required TResult shortPassword(T failedValue),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult exceedingLength(T failedValue, int max),
    TResult empty(T failedValue),
    TResult multiline(T failedValue),
    TResult invalidUrl(T failedValue),
    TResult wrongFileFormat(T failedValue),
    TResult wrongImageDimensions(T failedValue),
    TResult invalidEmail(T failedValue),
    TResult shortPassword(T failedValue),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult exceedingLength(ExceedingLength<T> value),
    @required TResult empty(Empty<T> value),
    @required TResult multiline(Multiline<T> value),
    @required TResult invalidUrl(InvalidUrl<T> value),
    @required TResult wrongFileFormat(WrongFileFormat<T> value),
    @required TResult wrongImageDimensions(WrongImageDimensions<T> value),
    @required TResult invalidEmail(InvalidEmail<T> value),
    @required TResult shortPassword(ShortPassword<T> value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult exceedingLength(ExceedingLength<T> value),
    TResult empty(Empty<T> value),
    TResult multiline(Multiline<T> value),
    TResult invalidUrl(InvalidUrl<T> value),
    TResult wrongFileFormat(WrongFileFormat<T> value),
    TResult wrongImageDimensions(WrongImageDimensions<T> value),
    TResult invalidEmail(InvalidEmail<T> value),
    TResult shortPassword(ShortPassword<T> value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

/// @nodoc
abstract class $ExceedingLengthCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $ExceedingLengthCopyWith(
          ExceedingLength<T> value, $Res Function(ExceedingLength<T>) then) =
      _$ExceedingLengthCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue, int max});
}

/// @nodoc
class _$ExceedingLengthCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $ExceedingLengthCopyWith<T, $Res> {
  _$ExceedingLengthCopyWithImpl(
      ExceedingLength<T> _value, $Res Function(ExceedingLength<T>) _then)
      : super(_value, (v) => _then(v as ExceedingLength<T>));

  @override
  ExceedingLength<T> get _value => super._value as ExceedingLength<T>;

  @override
  $Res call({
    Object failedValue = freezed,
    Object max = freezed,
  }) {
    return _then(ExceedingLength<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
      max: max == freezed ? _value.max : max as int,
    ));
  }
}

/// @nodoc
class _$ExceedingLength<T> implements ExceedingLength<T> {
  const _$ExceedingLength({@required this.failedValue, @required this.max})
      : assert(failedValue != null),
        assert(max != null);

  @override
  final T failedValue;
  @override
  final int max;

  @override
  String toString() {
    return 'ValueFailure<$T>.exceedingLength(failedValue: $failedValue, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExceedingLength<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failedValue) ^
      const DeepCollectionEquality().hash(max);

  @JsonKey(ignore: true)
  @override
  $ExceedingLengthCopyWith<T, ExceedingLength<T>> get copyWith =>
      _$ExceedingLengthCopyWithImpl<T, ExceedingLength<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult exceedingLength(T failedValue, int max),
    @required TResult empty(T failedValue),
    @required TResult multiline(T failedValue),
    @required TResult invalidUrl(T failedValue),
    @required TResult wrongFileFormat(T failedValue),
    @required TResult wrongImageDimensions(T failedValue),
    @required TResult invalidEmail(T failedValue),
    @required TResult shortPassword(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return exceedingLength(failedValue, max);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult exceedingLength(T failedValue, int max),
    TResult empty(T failedValue),
    TResult multiline(T failedValue),
    TResult invalidUrl(T failedValue),
    TResult wrongFileFormat(T failedValue),
    TResult wrongImageDimensions(T failedValue),
    TResult invalidEmail(T failedValue),
    TResult shortPassword(T failedValue),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (exceedingLength != null) {
      return exceedingLength(failedValue, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult exceedingLength(ExceedingLength<T> value),
    @required TResult empty(Empty<T> value),
    @required TResult multiline(Multiline<T> value),
    @required TResult invalidUrl(InvalidUrl<T> value),
    @required TResult wrongFileFormat(WrongFileFormat<T> value),
    @required TResult wrongImageDimensions(WrongImageDimensions<T> value),
    @required TResult invalidEmail(InvalidEmail<T> value),
    @required TResult shortPassword(ShortPassword<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return exceedingLength(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult exceedingLength(ExceedingLength<T> value),
    TResult empty(Empty<T> value),
    TResult multiline(Multiline<T> value),
    TResult invalidUrl(InvalidUrl<T> value),
    TResult wrongFileFormat(WrongFileFormat<T> value),
    TResult wrongImageDimensions(WrongImageDimensions<T> value),
    TResult invalidEmail(InvalidEmail<T> value),
    TResult shortPassword(ShortPassword<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (exceedingLength != null) {
      return exceedingLength(this);
    }
    return orElse();
  }
}

abstract class ExceedingLength<T> implements ValueFailure<T> {
  const factory ExceedingLength({@required T failedValue, @required int max}) =
      _$ExceedingLength<T>;

  @override
  T get failedValue;
  int get max;
  @override
  @JsonKey(ignore: true)
  $ExceedingLengthCopyWith<T, ExceedingLength<T>> get copyWith;
}

/// @nodoc
abstract class $EmptyCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $EmptyCopyWith(Empty<T> value, $Res Function(Empty<T>) then) =
      _$EmptyCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$EmptyCopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $EmptyCopyWith<T, $Res> {
  _$EmptyCopyWithImpl(Empty<T> _value, $Res Function(Empty<T>) _then)
      : super(_value, (v) => _then(v as Empty<T>));

  @override
  Empty<T> get _value => super._value as Empty<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(Empty<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

/// @nodoc
class _$Empty<T> implements Empty<T> {
  const _$Empty({@required this.failedValue}) : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.empty(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Empty<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $EmptyCopyWith<T, Empty<T>> get copyWith =>
      _$EmptyCopyWithImpl<T, Empty<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult exceedingLength(T failedValue, int max),
    @required TResult empty(T failedValue),
    @required TResult multiline(T failedValue),
    @required TResult invalidUrl(T failedValue),
    @required TResult wrongFileFormat(T failedValue),
    @required TResult wrongImageDimensions(T failedValue),
    @required TResult invalidEmail(T failedValue),
    @required TResult shortPassword(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult exceedingLength(T failedValue, int max),
    TResult empty(T failedValue),
    TResult multiline(T failedValue),
    TResult invalidUrl(T failedValue),
    TResult wrongFileFormat(T failedValue),
    TResult wrongImageDimensions(T failedValue),
    TResult invalidEmail(T failedValue),
    TResult shortPassword(T failedValue),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult exceedingLength(ExceedingLength<T> value),
    @required TResult empty(Empty<T> value),
    @required TResult multiline(Multiline<T> value),
    @required TResult invalidUrl(InvalidUrl<T> value),
    @required TResult wrongFileFormat(WrongFileFormat<T> value),
    @required TResult wrongImageDimensions(WrongImageDimensions<T> value),
    @required TResult invalidEmail(InvalidEmail<T> value),
    @required TResult shortPassword(ShortPassword<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult exceedingLength(ExceedingLength<T> value),
    TResult empty(Empty<T> value),
    TResult multiline(Multiline<T> value),
    TResult invalidUrl(InvalidUrl<T> value),
    TResult wrongFileFormat(WrongFileFormat<T> value),
    TResult wrongImageDimensions(WrongImageDimensions<T> value),
    TResult invalidEmail(InvalidEmail<T> value),
    TResult shortPassword(ShortPassword<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements ValueFailure<T> {
  const factory Empty({@required T failedValue}) = _$Empty<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $EmptyCopyWith<T, Empty<T>> get copyWith;
}

/// @nodoc
abstract class $MultilineCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $MultilineCopyWith(
          Multiline<T> value, $Res Function(Multiline<T>) then) =
      _$MultilineCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$MultilineCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $MultilineCopyWith<T, $Res> {
  _$MultilineCopyWithImpl(
      Multiline<T> _value, $Res Function(Multiline<T>) _then)
      : super(_value, (v) => _then(v as Multiline<T>));

  @override
  Multiline<T> get _value => super._value as Multiline<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(Multiline<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

/// @nodoc
class _$Multiline<T> implements Multiline<T> {
  const _$Multiline({@required this.failedValue}) : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.multiline(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Multiline<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $MultilineCopyWith<T, Multiline<T>> get copyWith =>
      _$MultilineCopyWithImpl<T, Multiline<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult exceedingLength(T failedValue, int max),
    @required TResult empty(T failedValue),
    @required TResult multiline(T failedValue),
    @required TResult invalidUrl(T failedValue),
    @required TResult wrongFileFormat(T failedValue),
    @required TResult wrongImageDimensions(T failedValue),
    @required TResult invalidEmail(T failedValue),
    @required TResult shortPassword(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return multiline(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult exceedingLength(T failedValue, int max),
    TResult empty(T failedValue),
    TResult multiline(T failedValue),
    TResult invalidUrl(T failedValue),
    TResult wrongFileFormat(T failedValue),
    TResult wrongImageDimensions(T failedValue),
    TResult invalidEmail(T failedValue),
    TResult shortPassword(T failedValue),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (multiline != null) {
      return multiline(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult exceedingLength(ExceedingLength<T> value),
    @required TResult empty(Empty<T> value),
    @required TResult multiline(Multiline<T> value),
    @required TResult invalidUrl(InvalidUrl<T> value),
    @required TResult wrongFileFormat(WrongFileFormat<T> value),
    @required TResult wrongImageDimensions(WrongImageDimensions<T> value),
    @required TResult invalidEmail(InvalidEmail<T> value),
    @required TResult shortPassword(ShortPassword<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return multiline(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult exceedingLength(ExceedingLength<T> value),
    TResult empty(Empty<T> value),
    TResult multiline(Multiline<T> value),
    TResult invalidUrl(InvalidUrl<T> value),
    TResult wrongFileFormat(WrongFileFormat<T> value),
    TResult wrongImageDimensions(WrongImageDimensions<T> value),
    TResult invalidEmail(InvalidEmail<T> value),
    TResult shortPassword(ShortPassword<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (multiline != null) {
      return multiline(this);
    }
    return orElse();
  }
}

abstract class Multiline<T> implements ValueFailure<T> {
  const factory Multiline({@required T failedValue}) = _$Multiline<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $MultilineCopyWith<T, Multiline<T>> get copyWith;
}

/// @nodoc
abstract class $InvalidUrlCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidUrlCopyWith(
          InvalidUrl<T> value, $Res Function(InvalidUrl<T>) then) =
      _$InvalidUrlCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$InvalidUrlCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidUrlCopyWith<T, $Res> {
  _$InvalidUrlCopyWithImpl(
      InvalidUrl<T> _value, $Res Function(InvalidUrl<T>) _then)
      : super(_value, (v) => _then(v as InvalidUrl<T>));

  @override
  InvalidUrl<T> get _value => super._value as InvalidUrl<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(InvalidUrl<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

/// @nodoc
class _$InvalidUrl<T> implements InvalidUrl<T> {
  const _$InvalidUrl({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidUrl(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidUrl<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $InvalidUrlCopyWith<T, InvalidUrl<T>> get copyWith =>
      _$InvalidUrlCopyWithImpl<T, InvalidUrl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult exceedingLength(T failedValue, int max),
    @required TResult empty(T failedValue),
    @required TResult multiline(T failedValue),
    @required TResult invalidUrl(T failedValue),
    @required TResult wrongFileFormat(T failedValue),
    @required TResult wrongImageDimensions(T failedValue),
    @required TResult invalidEmail(T failedValue),
    @required TResult shortPassword(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return invalidUrl(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult exceedingLength(T failedValue, int max),
    TResult empty(T failedValue),
    TResult multiline(T failedValue),
    TResult invalidUrl(T failedValue),
    TResult wrongFileFormat(T failedValue),
    TResult wrongImageDimensions(T failedValue),
    TResult invalidEmail(T failedValue),
    TResult shortPassword(T failedValue),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidUrl != null) {
      return invalidUrl(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult exceedingLength(ExceedingLength<T> value),
    @required TResult empty(Empty<T> value),
    @required TResult multiline(Multiline<T> value),
    @required TResult invalidUrl(InvalidUrl<T> value),
    @required TResult wrongFileFormat(WrongFileFormat<T> value),
    @required TResult wrongImageDimensions(WrongImageDimensions<T> value),
    @required TResult invalidEmail(InvalidEmail<T> value),
    @required TResult shortPassword(ShortPassword<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return invalidUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult exceedingLength(ExceedingLength<T> value),
    TResult empty(Empty<T> value),
    TResult multiline(Multiline<T> value),
    TResult invalidUrl(InvalidUrl<T> value),
    TResult wrongFileFormat(WrongFileFormat<T> value),
    TResult wrongImageDimensions(WrongImageDimensions<T> value),
    TResult invalidEmail(InvalidEmail<T> value),
    TResult shortPassword(ShortPassword<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidUrl != null) {
      return invalidUrl(this);
    }
    return orElse();
  }
}

abstract class InvalidUrl<T> implements ValueFailure<T> {
  const factory InvalidUrl({@required T failedValue}) = _$InvalidUrl<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $InvalidUrlCopyWith<T, InvalidUrl<T>> get copyWith;
}

/// @nodoc
abstract class $WrongFileFormatCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $WrongFileFormatCopyWith(
          WrongFileFormat<T> value, $Res Function(WrongFileFormat<T>) then) =
      _$WrongFileFormatCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$WrongFileFormatCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $WrongFileFormatCopyWith<T, $Res> {
  _$WrongFileFormatCopyWithImpl(
      WrongFileFormat<T> _value, $Res Function(WrongFileFormat<T>) _then)
      : super(_value, (v) => _then(v as WrongFileFormat<T>));

  @override
  WrongFileFormat<T> get _value => super._value as WrongFileFormat<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(WrongFileFormat<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

/// @nodoc
class _$WrongFileFormat<T> implements WrongFileFormat<T> {
  const _$WrongFileFormat({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.wrongFileFormat(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WrongFileFormat<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $WrongFileFormatCopyWith<T, WrongFileFormat<T>> get copyWith =>
      _$WrongFileFormatCopyWithImpl<T, WrongFileFormat<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult exceedingLength(T failedValue, int max),
    @required TResult empty(T failedValue),
    @required TResult multiline(T failedValue),
    @required TResult invalidUrl(T failedValue),
    @required TResult wrongFileFormat(T failedValue),
    @required TResult wrongImageDimensions(T failedValue),
    @required TResult invalidEmail(T failedValue),
    @required TResult shortPassword(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return wrongFileFormat(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult exceedingLength(T failedValue, int max),
    TResult empty(T failedValue),
    TResult multiline(T failedValue),
    TResult invalidUrl(T failedValue),
    TResult wrongFileFormat(T failedValue),
    TResult wrongImageDimensions(T failedValue),
    TResult invalidEmail(T failedValue),
    TResult shortPassword(T failedValue),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (wrongFileFormat != null) {
      return wrongFileFormat(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult exceedingLength(ExceedingLength<T> value),
    @required TResult empty(Empty<T> value),
    @required TResult multiline(Multiline<T> value),
    @required TResult invalidUrl(InvalidUrl<T> value),
    @required TResult wrongFileFormat(WrongFileFormat<T> value),
    @required TResult wrongImageDimensions(WrongImageDimensions<T> value),
    @required TResult invalidEmail(InvalidEmail<T> value),
    @required TResult shortPassword(ShortPassword<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return wrongFileFormat(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult exceedingLength(ExceedingLength<T> value),
    TResult empty(Empty<T> value),
    TResult multiline(Multiline<T> value),
    TResult invalidUrl(InvalidUrl<T> value),
    TResult wrongFileFormat(WrongFileFormat<T> value),
    TResult wrongImageDimensions(WrongImageDimensions<T> value),
    TResult invalidEmail(InvalidEmail<T> value),
    TResult shortPassword(ShortPassword<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (wrongFileFormat != null) {
      return wrongFileFormat(this);
    }
    return orElse();
  }
}

abstract class WrongFileFormat<T> implements ValueFailure<T> {
  const factory WrongFileFormat({@required T failedValue}) =
      _$WrongFileFormat<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $WrongFileFormatCopyWith<T, WrongFileFormat<T>> get copyWith;
}

/// @nodoc
abstract class $WrongImageDimensionsCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $WrongImageDimensionsCopyWith(WrongImageDimensions<T> value,
          $Res Function(WrongImageDimensions<T>) then) =
      _$WrongImageDimensionsCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$WrongImageDimensionsCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $WrongImageDimensionsCopyWith<T, $Res> {
  _$WrongImageDimensionsCopyWithImpl(WrongImageDimensions<T> _value,
      $Res Function(WrongImageDimensions<T>) _then)
      : super(_value, (v) => _then(v as WrongImageDimensions<T>));

  @override
  WrongImageDimensions<T> get _value => super._value as WrongImageDimensions<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(WrongImageDimensions<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

/// @nodoc
class _$WrongImageDimensions<T> implements WrongImageDimensions<T> {
  const _$WrongImageDimensions({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.wrongImageDimensions(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WrongImageDimensions<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $WrongImageDimensionsCopyWith<T, WrongImageDimensions<T>> get copyWith =>
      _$WrongImageDimensionsCopyWithImpl<T, WrongImageDimensions<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult exceedingLength(T failedValue, int max),
    @required TResult empty(T failedValue),
    @required TResult multiline(T failedValue),
    @required TResult invalidUrl(T failedValue),
    @required TResult wrongFileFormat(T failedValue),
    @required TResult wrongImageDimensions(T failedValue),
    @required TResult invalidEmail(T failedValue),
    @required TResult shortPassword(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return wrongImageDimensions(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult exceedingLength(T failedValue, int max),
    TResult empty(T failedValue),
    TResult multiline(T failedValue),
    TResult invalidUrl(T failedValue),
    TResult wrongFileFormat(T failedValue),
    TResult wrongImageDimensions(T failedValue),
    TResult invalidEmail(T failedValue),
    TResult shortPassword(T failedValue),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (wrongImageDimensions != null) {
      return wrongImageDimensions(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult exceedingLength(ExceedingLength<T> value),
    @required TResult empty(Empty<T> value),
    @required TResult multiline(Multiline<T> value),
    @required TResult invalidUrl(InvalidUrl<T> value),
    @required TResult wrongFileFormat(WrongFileFormat<T> value),
    @required TResult wrongImageDimensions(WrongImageDimensions<T> value),
    @required TResult invalidEmail(InvalidEmail<T> value),
    @required TResult shortPassword(ShortPassword<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return wrongImageDimensions(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult exceedingLength(ExceedingLength<T> value),
    TResult empty(Empty<T> value),
    TResult multiline(Multiline<T> value),
    TResult invalidUrl(InvalidUrl<T> value),
    TResult wrongFileFormat(WrongFileFormat<T> value),
    TResult wrongImageDimensions(WrongImageDimensions<T> value),
    TResult invalidEmail(InvalidEmail<T> value),
    TResult shortPassword(ShortPassword<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (wrongImageDimensions != null) {
      return wrongImageDimensions(this);
    }
    return orElse();
  }
}

abstract class WrongImageDimensions<T> implements ValueFailure<T> {
  const factory WrongImageDimensions({@required T failedValue}) =
      _$WrongImageDimensions<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $WrongImageDimensionsCopyWith<T, WrongImageDimensions<T>> get copyWith;
}

/// @nodoc
abstract class $InvalidEmailCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail<T> value, $Res Function(InvalidEmail<T>) then) =
      _$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidEmailCopyWith<T, $Res> {
  _$InvalidEmailCopyWithImpl(
      InvalidEmail<T> _value, $Res Function(InvalidEmail<T>) _then)
      : super(_value, (v) => _then(v as InvalidEmail<T>));

  @override
  InvalidEmail<T> get _value => super._value as InvalidEmail<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(InvalidEmail<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

/// @nodoc
class _$InvalidEmail<T> implements InvalidEmail<T> {
  const _$InvalidEmail({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidEmail<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith =>
      _$InvalidEmailCopyWithImpl<T, InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult exceedingLength(T failedValue, int max),
    @required TResult empty(T failedValue),
    @required TResult multiline(T failedValue),
    @required TResult invalidUrl(T failedValue),
    @required TResult wrongFileFormat(T failedValue),
    @required TResult wrongImageDimensions(T failedValue),
    @required TResult invalidEmail(T failedValue),
    @required TResult shortPassword(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult exceedingLength(T failedValue, int max),
    TResult empty(T failedValue),
    TResult multiline(T failedValue),
    TResult invalidUrl(T failedValue),
    TResult wrongFileFormat(T failedValue),
    TResult wrongImageDimensions(T failedValue),
    TResult invalidEmail(T failedValue),
    TResult shortPassword(T failedValue),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult exceedingLength(ExceedingLength<T> value),
    @required TResult empty(Empty<T> value),
    @required TResult multiline(Multiline<T> value),
    @required TResult invalidUrl(InvalidUrl<T> value),
    @required TResult wrongFileFormat(WrongFileFormat<T> value),
    @required TResult wrongImageDimensions(WrongImageDimensions<T> value),
    @required TResult invalidEmail(InvalidEmail<T> value),
    @required TResult shortPassword(ShortPassword<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult exceedingLength(ExceedingLength<T> value),
    TResult empty(Empty<T> value),
    TResult multiline(Multiline<T> value),
    TResult invalidUrl(InvalidUrl<T> value),
    TResult wrongFileFormat(WrongFileFormat<T> value),
    TResult wrongImageDimensions(WrongImageDimensions<T> value),
    TResult invalidEmail(InvalidEmail<T> value),
    TResult shortPassword(ShortPassword<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailure<T> {
  const factory InvalidEmail({@required T failedValue}) = _$InvalidEmail<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith;
}

/// @nodoc
abstract class $ShortPasswordCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory $ShortPasswordCopyWith(
          ShortPassword<T> value, $Res Function(ShortPassword<T>) then) =
      _$ShortPasswordCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$ShortPasswordCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $ShortPasswordCopyWith<T, $Res> {
  _$ShortPasswordCopyWithImpl(
      ShortPassword<T> _value, $Res Function(ShortPassword<T>) _then)
      : super(_value, (v) => _then(v as ShortPassword<T>));

  @override
  ShortPassword<T> get _value => super._value as ShortPassword<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(ShortPassword<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as T,
    ));
  }
}

/// @nodoc
class _$ShortPassword<T> implements ShortPassword<T> {
  const _$ShortPassword({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final T failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.shortPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShortPassword<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $ShortPasswordCopyWith<T, ShortPassword<T>> get copyWith =>
      _$ShortPasswordCopyWithImpl<T, ShortPassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult exceedingLength(T failedValue, int max),
    @required TResult empty(T failedValue),
    @required TResult multiline(T failedValue),
    @required TResult invalidUrl(T failedValue),
    @required TResult wrongFileFormat(T failedValue),
    @required TResult wrongImageDimensions(T failedValue),
    @required TResult invalidEmail(T failedValue),
    @required TResult shortPassword(T failedValue),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult exceedingLength(T failedValue, int max),
    TResult empty(T failedValue),
    TResult multiline(T failedValue),
    TResult invalidUrl(T failedValue),
    TResult wrongFileFormat(T failedValue),
    TResult wrongImageDimensions(T failedValue),
    TResult invalidEmail(T failedValue),
    TResult shortPassword(T failedValue),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult exceedingLength(ExceedingLength<T> value),
    @required TResult empty(Empty<T> value),
    @required TResult multiline(Multiline<T> value),
    @required TResult invalidUrl(InvalidUrl<T> value),
    @required TResult wrongFileFormat(WrongFileFormat<T> value),
    @required TResult wrongImageDimensions(WrongImageDimensions<T> value),
    @required TResult invalidEmail(InvalidEmail<T> value),
    @required TResult shortPassword(ShortPassword<T> value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(invalidUrl != null);
    assert(wrongFileFormat != null);
    assert(wrongImageDimensions != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult exceedingLength(ExceedingLength<T> value),
    TResult empty(Empty<T> value),
    TResult multiline(Multiline<T> value),
    TResult invalidUrl(InvalidUrl<T> value),
    TResult wrongFileFormat(WrongFileFormat<T> value),
    TResult wrongImageDimensions(WrongImageDimensions<T> value),
    TResult invalidEmail(InvalidEmail<T> value),
    TResult shortPassword(ShortPassword<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements ValueFailure<T> {
  const factory ShortPassword({@required T failedValue}) = _$ShortPassword<T>;

  @override
  T get failedValue;
  @override
  @JsonKey(ignore: true)
  $ShortPasswordCopyWith<T, ShortPassword<T>> get copyWith;
}
