import 'package:events/domain/auth/value_objects.dart';
import 'package:events/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

//TODO: Anonymous User

@freezed
abstract class User with _$User {
  const factory User({
    @required UniqueId id,
    @required String name,
    @required EmailAddress email,
  }) = _User;

  factory User.anonymous({@required UniqueId id}) => User(
        id: id,
        name: 'Anonymous',
        email: EmailAddress('anony@mo.us'),
      );
}
