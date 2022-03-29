import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:events/domain/auth/auth_failure.dart';
import 'package:events/domain/auth/i_auth_facade.dart';
import 'package:events/domain/auth/user.dart';
import 'package:events/domain/auth/user_prefs.dart';
import 'package:events/domain/auth/value_objects.dart';
import 'package:events/domain/core/repository_failure.dart';
import 'package:events/services/auth/firebase_user_mapper.dart';
import 'package:events/services/auth/user_prefs_dto.dart';
import 'package:events/services/core/firebase_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
// import 'package:firebase_auth/firebase_auth.dart' as firebase show User;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

//TODO
//* 1. link user accounts
//*    https://firebase.flutter.dev/docs/auth/usage/#linking-user-accounts
//*    https://firebase.flutter.dev/docs/auth/error-handling/
//* 2. delete user account and data if logout
//?    what if the user just deletes the app

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  final FirebaseFirestore _firestore;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
    this._facebookAuth,
    this._firestore,
  );

  @override
  Option<User> getSignedInUser() =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Stream<Option<User>> authStateChanges() => _firebaseAuth
      .authStateChanges()
      .map((user) => optionOf(user?.toDomain()));

  @override
  Future<Either<AuthFailure, Unit>> signInAnonymously() async {
    try {
      await _firebaseAuth.signInAnonymously();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password' || e.code == 'user-not-found') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
    @required String name,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      final authCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );

      await authCredential.user.updateProfile(displayName: name);

      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password' || e.code == 'user-not-found') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Option<Either<AuthFailure, Unit>>> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final googleUser = await _googleSignIn.signIn();

      //?
      if (googleUser == null) {
        return none();
      }

      // Obtain the auth details from the request
      final googleAuth = await googleUser.authentication;

      // Create a new credential
      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await _firebaseAuth.signInWithCredential(authCredential);

      return some(right(unit));
    } on FirebaseAuthException catch (_) {
      return some(left(const AuthFailure.serverError()));
    } on PlatformException catch (e) {
      if (e.code == 'sign_in_canceled') {
        return none();
      } else {
        return some(left(const AuthFailure.serverError()));
      }
    }
  }

  @override
  Future<Option<Either<AuthFailure, Unit>>> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final facebookAuth = await _facebookAuth.login();

      // final facebookUser = await _facebookAuth.getUserData();

      // Create a credential from the access token
      final authCredential =
          FacebookAuthProvider.credential(facebookAuth.token);

      await _firebaseAuth.signInWithCredential(authCredential);

      return some(right(unit));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        return some(left(const AuthFailure.emailAlreadyInUse()));
      } else {
        return some(left(const AuthFailure.serverError()));
      }
    } on FacebookAuthException catch (e) {
      switch (e.errorCode) {
        case FacebookAuthErrorCode.CANCELLED:
          print('login cancelled');
          return none();
        case FacebookAuthErrorCode.FAILED:
          print('login failed');
          return some(left(const AuthFailure.serverError()));
        case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
          print('You have a previous login operation in progress');
          return some(left(const AuthFailure.serverError()));
        default:
          return some(left(const AuthFailure.serverError()));
      }
    }
  }

  @override
  Future signOut() => Future.wait([
        // _googleSignIn.signOut(),
        // _facebookAuth.logOut(),
        _firebaseAuth.signOut(),
      ]);

  @override
  Stream<Either<RepositoryFailure, bool>> watchPrefsExistance() {
    final userDoc = _firestore.userDoc();

    return userDoc
        .snapshots()
        .map((doc) => right<RepositoryFailure, bool>(doc.exists))
        .handleError((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(const RepositoryFailure.insufficientPermission());
      } else {
        return left(const RepositoryFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<RepositoryFailure, UserPrefs>> watchPrefs() {
    final userDoc = _firestore.userDoc();

    return userDoc
        .snapshots()
        .map((doc) => right<RepositoryFailure, UserPrefs>(
            UserPrefsDto.fromFirestore(doc).toDomain()))
        .handleError((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(const RepositoryFailure.insufficientPermission());
      } else {
        return left(const RepositoryFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<RepositoryFailure, Unit>> createPrefs(
      UserPrefs userPrefs) async {
    try {
      final userDoc = _firestore.userDoc();
      final userPrefsDto = UserPrefsDto.fromDomain(userPrefs);

      await userDoc.set(userPrefsDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const RepositoryFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const RepositoryFailure.unableToUpdate());
      } else {
        return left(const RepositoryFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<RepositoryFailure, Unit>> updatePrefs(
      UserPrefs userPrefs) async {
    try {
      final userDoc = _firestore.userDoc();
      final userPrefsDto = UserPrefsDto.fromDomain(userPrefs);

      await userDoc.update(userPrefsDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const RepositoryFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const RepositoryFailure.unableToUpdate());
      } else {
        return left(const RepositoryFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<RepositoryFailure, Unit>> deletePrefs() async {
    try {
      final userDoc = _firestore.userDoc();

      await userDoc.delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const RepositoryFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const RepositoryFailure.unableToUpdate());
      } else {
        return left(const RepositoryFailure.unexpected());
      }
    }
  }
}
