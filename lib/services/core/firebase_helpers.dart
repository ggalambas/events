import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  // Future<DocumentReference> userDocument() async {
  //   final userOption = await getIt<IAuthFacade>().getSignedInUser();
  //   final user = userOption.getOrElse(() => throw NotAuthenticatedError());
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user.id.getOrCrash());
  // }
  CollectionReference get categoriesCollection => collection('categories');
  DocumentReference categoryDoc(String category) =>
      collection('categories').doc(category);
}

extension DocumentReferenceX on DocumentReference {
  // CollectionReference get regionCollection => collection('regionEvents');
  // CollectionReference get subregionCollection => collection('subregionEvents');
  CollectionReference get eventCollection => collection('events');
}

extension CollectionReferenceX on CollectionReference {
  // CollectionReference get regionCollection => collection('regionEvents');
  // CollectionReference get subregionCollection => collection('subregionEvents');
  // Query onDay(DateTime day) {
  //   final DateTime nextDay = day.add(Duration(days: 1));
  //   return where(
  //     'time',
  //     isGreaterThanOrEqualTo: Timestamp.fromDate(day),
  //     isLessThan: Timestamp.fromDate(nextDay),
  //   );
  // }
}
