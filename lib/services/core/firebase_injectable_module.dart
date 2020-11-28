import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseInjectableModule {
  // @lazySingleton
  // GoogleSignIn get googleSignIn => GoogleSignIn();
  // @lazySingleton
  // FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  //* https://firebase.flutter.dev/docs/firestore/usage
}
