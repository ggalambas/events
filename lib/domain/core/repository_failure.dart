import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_failure.freezed.dart';

@freezed
abstract class RepositoryFailure with _$RepositoryFailure {
  const factory RepositoryFailure.unexpected() = _Unexpected;
  const factory RepositoryFailure.insufficientPermission() =
      _InsufficientPermission;
  const factory RepositoryFailure.unableToUpdate() = _UnableToUpdate;
}
