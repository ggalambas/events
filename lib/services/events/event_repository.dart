import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/core/event_counter.dart';
import 'package:events/domain/core/value_objects.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/events/event_failure.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/domain/events/value_objects.dart';
import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/services/categories/category_dto.dart';
import 'package:events/services/events/event_dto.dart';
import 'package:events/services/regions/region_dto.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:events/services/core/firebase_helpers.dart';

@LazySingleton(as: IEventRepository)
class EventRepository implements IEventRepository {
  final FirebaseFirestore _firestore;

  EventRepository(this._firestore);
  //TODO Repository Exceptions
  //TODO create more/better helpers

  @override
  Category selectedCategory = Category(
      id: UniqueId.fromUniqueString('MqwY5zioIvOI7p6CCPT4'),
      name: 'Categoria 01',
      icon: IconData(58947),
      eventCounter: EventCounter(live: 0, total: 0));

  @override
  DateTime selectedDate = DateTime.now();

  @override
  Region selectedRegion;

  @override
  Future<Either<EventFailure, Unit>> createEvent(Event event) async {
    try {
      final eventDto = EventDto.fromDomain(event);

      //* add Event to events Collection
      await _firestore.eventsCollection.doc(eventDto.id).set(eventDto.toJson());

      //* update Category counter
      //! the totalEvents may end up wrong when creating 2 or more events at the same time
      await _firestore.categoriesCollection
          .doc(eventDto.categoryId)
          .update({'totalEvents': FieldValue.increment(1)});

      //!
      String regionId = eventDto.subregionId.substring(0, 4);
      final Map<String, String> names =
          await getIt<IRegionApi>().names(eventDto.subregionId);

      //* update Regions counter
      //! change day to yearmonthday
      await _firestore.categoryRegionsCollection
          .doc(eventDto.categoryId)
          .collection('days')
          .doc('${event.date.day}')
          .collection('regions')
          .doc(regionId)
          .set({
        'totalEvents': FieldValue.increment(1),
        'name': names['regionName']
      }, SetOptions(merge: true));

      //* update subregions list
      await _firestore.categoryRegionEventsCollection
          .doc(eventDto.categoryId)
          .collection('days')
          .doc('${event.date.day}')
          .collection('regions')
          .doc(regionId)
          .collection('subregions')
          .doc(eventDto.subregionId)
          .set({
        'events': FieldValue.arrayUnion([eventDto.id]),
        'name': names['subregionName']
      }, SetOptions(merge: true));

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const EventFailure.insufficientPermission());
      } else {
        return left(const EventFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<EventFailure, List<Category>>> categoryCounters() async* {
    final categories = _firestore.categoriesCollection;
    yield* categories
        .orderBy('name')
        .snapshots()
        .map((snapshot) => right<EventFailure, List<Category>>(
              snapshot.docs
                  .map((doc) => CategoryDto.fromFirestore(doc).toDomain())
                  .toList(),
            ))
        .handleError((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(const EventFailure.insufficientPermission());
      } else {
        return left(const EventFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<EventFailure, List<Region>>> regionCounters() async* {
    final regions = _firestore.categoryRegionsCollection;
    yield* regions
        .doc(selectedCategory.id.getOrCrash())
        .collection('days')
        .doc(selectedDate.day.toString()) //! change day to datetime/timestamp
        .collection('regions')
        .snapshots()
        .map((snapshot) => right<EventFailure, List<Region>>(
              snapshot.docs
                  .map((doc) => RegionDto.fromFirestore(doc).toDomain())
                  .toList(),
            ))
        .handleError((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(const EventFailure.insufficientPermission());
      } else {
        return left(const EventFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<EventFailure, Map<String, List<Event>>>> regionEvents(
      String regionName) async* {
    final Map<String, List<Event>> subregions = {};
    List<Event> events;
    String subregion;
    for (int j = 0; j < 10; j++) {
      events = [];
      for (int i = 0; i < 5; i++) {
        events.add(
          Event(
            id: UniqueId.fromUniqueString(i.toString()),
            name: EventName('Event $i'),
            date: selectedDate,
            link: EventLink('http://facebook.com'),
            categoryId: null,
            poster: null,
            subregionId: null,
          ),
        );
      }
      subregion = 'Freguesia ${j.toString()}';
      subregions[subregion] = events;
    }
    yield right(subregions);
  }
}

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
