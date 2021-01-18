import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_failure.freezed.dart';

@freezed
abstract class RepositoryFailure with _$RepositoryFailure {
  const factory RepositoryFailure.unexpected() = _Unexpected;
  const factory RepositoryFailure.insufficientPermission() =
      _InsufficientPermission;
  const factory RepositoryFailure.unableToUpdate() = _UnableToUpdate;
}
