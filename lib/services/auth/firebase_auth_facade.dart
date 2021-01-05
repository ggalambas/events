import 'package:dartz/dartz.dart';
import 'package:events/domain/auth/auth_failure.dart';
import 'package:events/domain/auth/i_auth_facade.dart';
import 'package:events/domain/auth/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_auth/firebase_auth.dart' as firebase show User;
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/services.dart';
// import 'package:events/services/auth/firebase_user_mapper.dart';

// TODO
//* 1. anonymous sign in
//* 2. user email verification
//*    https://firebase.flutter.dev/docs/auth/usage/#verifying-a-users-email
//* 3. link user accounts
//*    https://firebase.flutter.dev/docs/auth/usage/#linking-user-accounts
//* 3. account providers error
//*    https://firebase.flutter.dev/docs/auth/error-handling/

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
    this._facebookAuth,
  );

  // @override
  // Future<Option<User>> getSignedInUser() async =>
  //     optionOf(_firebaseAuth.currentUser?.toDomain());

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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
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
        return some(left(const AuthFailure.serverError())); //!
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

  // @override
  // Future signOut() => Future.wait([
  //       _googleSignIn.signOut(),
  //       _facebookAuth.logOut(),
  //       _firebaseAuth.signOut(),
  //     ]);
}

// //!
//         // The account already exists with a different credential
//         final String email = e.email;
//         final AuthCredential pendingCredential = e.credential;

//         // Fetch a list of what sign-in methods exist for the conflicting user
//         final List<String> userSignInMethods =
//             await _firebaseAuth.fetchSignInMethodsForEmail(email);

//         // If the user has several sign-in methods,
//         // the first method in the list will be the "recommended" method to use.
//         if (userSignInMethods.first == 'password') {
//           //! Prompt the user to enter their password
//           String password = '...';

//           // Sign the user in to their account with the password
//           final UserCredential userCredential =
//               await _firebaseAuth.signInWithEmailAndPassword(
//             email: email,
//             password: password,
//           );

//           // Link the pending credential with the existing account
//           await userCredential.user.linkWithCredential(pendingCredential);

//           //! Success! Go back to your application flow
//           return goToApplication();
//         }

//         // Since other providers are now external, you must now sign the user in with another
//         // auth provider, such as Facebook.
//         if (userSignInMethods.first == 'facebook.com') {
//           //! Create a new Facebook credential
//           String accessToken = await triggerFacebookAuthentication();
//           FacebookAuthCredential facebookAuthCredential =
//               FacebookAuthProvider.credential(accessToken);

//           // Sign the user in with the credential
//           UserCredential userCredential =
//               await _firebaseAuth.signInWithCredential(facebookAuthCredential);

//           // Link the pending credential with the existing account
//           await userCredential.user.linkWithCredential(pendingCredential);

//           //! Success! Go back to your application flow
//           return goToApplication();
//         }
//         //!
