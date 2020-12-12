import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_failure.freezed.dart';

@freezed
abstract class EventFailure with _$EventFailure {
  const factory EventFailure.unexpected() = _Unexpected;
  const factory EventFailure.insufficientPermission() = _InsufficientPermission;
  const factory EventFailure.unableToUpdate() = _UnableToUpdate;
}
