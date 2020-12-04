// import 'dart:async';

// import 'package:dartz/dartz.dart';
// import 'package:events/domain/categories/category.dart';
// import 'package:events/domain/events/event.dart';
// import 'package:events/domain/events/event_failure.dart';
// import 'package:events/domain/events/i_event_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:events/domain/regions/region.dart';
// import 'package:events/services/categories/category_dto.dart';
// import 'package:events/services/events/event_dto.dart';
// import 'package:injectable/injectable.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:events/services/core/firebase_helpers.dart';

// // @LazySingleton(as: IEventRepository)
// class EventRepository implements IEventRepository {
//   final FirebaseFirestore _firestore;

//   EventRepository(this._firestore);
//   //TODO exceptions

//   @override
//   Stream<Either<EventFailure, List<Category>>> categoryCounters() async* {
//     final categories = _firestore.categoriesCollection;
//     yield* categories
//         .orderBy('name')
//         .snapshots()
//         .map((snapshot) => right<EventFailure, List<Category>>(
//               snapshot.docs
//                   .map((doc) => CategoryDto.fromFirestore(doc).toDomain())
//                   .toList(),
//             ))
//         .handleError((e) {
//       if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
//         return left(const EventFailure.insufficientPermission());
//       } else {
//         return left(const EventFailure.unexpected());
//       }
//     });
//   }

// @override
// Stream<Either<EventFailure, List<Event>>> watchAll(
//     String category, DateTime day) async* {
//   final categoryDoc = _firestore.categoryDoc(category);
//   yield* categoryDoc.eventCollection
//       .onDay(day)
//       .orderBy('time')
//       .snapshots()
//       .map((snapshot) => right<EventFailure, List<Event>>(
//             snapshot.docs
//                 .map((doc) => EventDto.fromFirestore(doc).toDomain())
//                 .toList(),
//           ))
//       .handleError((e) {
//     if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
//       return left(const EventFailure.insufficientPermission());
//     } else {
//       return left(const EventFailure.unexpected());
//     }
//   });
// }

// @override
// Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted() async* {
//   final userDoc = await _firestore.userDocument();
//   yield* userDoc.noteCollection
//       .orderBy('serverTimeStamp', descending: true)
//       .snapshots()
//       .map(
//         (snapshot) =>
//             snapshot.docs.map((doc) => NoteDto.fromFirestore(doc).toDomain()),
//       )
//       .map(
//         (notes) => right<NoteFailure, KtList<Note>>(
//           notes
//               .where((note) =>
//                   note.todos.getOrCrash().any((todoItem) => !todoItem.done))
//               .toImmutableList(),
//         ),
//       )
//       .onErrorReturnWith((e) {
//     if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
//       return left(const NoteFailure.insufficientPermission());
//     } else {
//       // log.error(e.toString());
//       return left(const NoteFailure.unexpected());
//     }
//   });
// }

// @override
// Future<Either<NoteFailure, Unit>> create(Note note) async {
//   try {
//     final userDoc = await _firestore.userDocument();
//     final noteDto = NoteDto.fromDomain(note);

//     await userDoc.noteCollection.doc(noteDto.id).set(noteDto.toJson());

//     return right(unit);
//   } on FirebaseException catch (e) {
//     if (e.message.contains('PERMISSION_DENIED')) {
//       return left(const NoteFailure.insufficientPermission());
//     } else {
//       return left(const NoteFailure.unexpected());
//     }
//   }
// }

// @override
// Future<Either<NoteFailure, Unit>> update(Note note) async {
//   try {
//     final userDoc = await _firestore.userDocument();
//     final noteDto = NoteDto.fromDomain(note);

//     await userDoc.noteCollection.doc(noteDto.id).update(noteDto.toJson());

//     return right(unit);
//   } on FirebaseException catch (e) {
//     if (e.message.contains('PERMISSION_DENIED')) {
//       return left(const NoteFailure.insufficientPermission());
//     } else if (e.message.contains('NOT_FOUND')) {
//       return left(const NoteFailure.unableToUpdate());
//     } else {
//       return left(const NoteFailure.unexpected());
//     }
//   }
// }

// @override
// Future<Either<NoteFailure, Unit>> delete(Note note) async {
//   try {
//     final userDoc = await _firestore.userDocument();
//     final noteId = note.id.getOrCrash();

//     await userDoc.noteCollection.doc(noteId).delete();

//     return right(unit);
//   } on FirebaseException catch (e) {
//     if (e.message.contains('PERMISSION_DENIED')) {
//       return left(const NoteFailure.insufficientPermission());
//     } else if (e.message.contains('NOT_FOUND')) {
//       return left(const NoteFailure.unableToUpdate());
//     } else {
//       return left(const NoteFailure.unexpected());
//     }
//   }
// }
// }
