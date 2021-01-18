import 'package:events/domain/auth/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:events/domain/auth/user.dart';
import 'package:events/domain/core/value_objects.dart';

extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return isAnonymous
        ? User.anonymous(
            id: UniqueId.fromUniqueString(uid),
          )
        : User(
            id: UniqueId.fromUniqueString(uid),
            name: displayName,
            email: EmailAddress(email),
          );
  }
}
