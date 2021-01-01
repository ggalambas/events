import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseInjectableModule {
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();
  //* https://firebase.flutter.dev/docs/auth/social/#google
  @lazySingleton
  FacebookAuth get facebookAuth => FacebookAuth.instance;
  //* https://firebase.flutter.dev/docs/auth/social/#facebook
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  //* https://firebase.flutter.dev/docs/auth/usage
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  //* https://firebase.flutter.dev/docs/firestore/usage
}
