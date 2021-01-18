import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

//TODO
//* 1. Auth value failure

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength({
    @required T failedValue,
    @required int max,
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({
    @required T failedValue,
  }) = Empty<T>;
  const factory ValueFailure.multiline({
    @required T failedValue,
  }) = Multiline<T>;
  const factory ValueFailure.invalidUrl({
    @required T failedValue,
  }) = InvalidUrl<T>;
  const factory ValueFailure.wrongFileFormat({
    @required T failedValue,
  }) = WrongFileFormat<T>;
  const factory ValueFailure.wrongImageDimensions({
    @required T failedValue,
  }) = WrongImageDimensions<T>;
  const factory ValueFailure.invalidEmail({
    @required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required T failedValue,
  }) = ShortPassword<T>;
}
