import 'package:dartz/dartz.dart';
import 'package:events/domain/auth/auth_failure.dart';
import 'package:events/domain/auth/user.dart';
import 'package:events/domain/auth/user_prefs.dart';
import 'package:events/domain/auth/value_objects.dart';
import 'package:events/domain/core/repository_failure.dart';
import 'package:flutter/foundation.dart';

abstract class IAuthFacade {
  Option<User> getSignedInUser();
  Stream<Option<User>> authStateChanges();
  Future<Either<AuthFailure, Unit>> signInAnonymously();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
    @required String name,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Option<Either<AuthFailure, Unit>>> signInWithGoogle();
  Future<Option<Either<AuthFailure, Unit>>> signInWithFacebook();
  Future signOut();

  Stream<Either<RepositoryFailure, UserPrefs>> watchPreferences();
  Future<Either<RepositoryFailure, Unit>> updatePreferences(
      UserPrefs userPrefs);
  Future<Either<RepositoryFailure, Unit>> deletePreferences();
}
