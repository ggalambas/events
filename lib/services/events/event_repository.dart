import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/categories/i_category_repository.dart';
import 'package:events/domain/core/repository_failure.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/services/core/firebase_helpers.dart';
import 'package:events/services/events/event_counter_dto.dart';
import 'package:events/services/events/event_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IEventRepository)
class EventRepository implements IEventRepository {
  final FirebaseFirestore _firestore;

  EventRepository(this._firestore);
  //TODO
  //* 1. Exceptions
  //* 2. order events and regions
  //* 3. transactions
  //*    https://firebase.flutter.dev/docs/firestore/usage#transactionshttps://firebase.flutter.dev/docs/firestore/usage#transactions
  //* 4. do wee need List getters for categories and regions or can it be removed?

  @override
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  //! SWAP WITH COMMENTED FUNCTION WHEN COUNTERS GOT READY
  @override
  Stream<Either<RepositoryFailure, List<Category>>> categoryCounters() async* {
    yield* getIt<ICategoryRepository>().getAll().asStream();
  }

  // @override
  // Stream<Either<RepositoryFailure, List<Category>>> categoryCounters() async* {
  //   Map<String, Category> categories;
  //   final categoriesOrFailure = await getIt<ICategoryRepository>().getAll();
  //   categoriesOrFailure.fold(
  //     (f) => left(f),
  //     (c) => categories =
  //         Map.fromEntries(c.map((category) => MapEntry(category.id, category))),
  //   );

  //   final counters = _firestore.categoryCounters;
  //   yield* counters
  //       .snapshots()
  //       .map((snapshot) => right<RepositoryFailure, List<Category>>(
  //             snapshot.docs
  //                 .map((doc) => categories[doc.id].add(
  //                     eventCounter:
  //                         EventCounterDto.fromFirestore(doc).toDomain()))
  //                 .toList(),
  //           ))
  //       .handleError((e) {
  //     if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
  //       return left(const RepositoryFailure.insufficientPermission());
  //     } else {
  //       return left(const RepositoryFailure.unexpected());
  //     }
  //   });
  // }

  @override
  Stream<Either<RepositoryFailure, List<Region>>> dayCounters() async* {}

  @override
  Stream<Either<RepositoryFailure, List<Region>>> regionCounters() async* {
    final Map<String, Region> regions = getIt<IRegionApi>().regions;

    final counters = _firestore.regionCounters;
    yield* counters
        .snapshots()
        .map((snapshot) => right<RepositoryFailure, List<Region>>(
              snapshot.docs
                  .map((doc) => regions[doc.id].add(
                      eventCounter:
                          EventCounterDto.fromFirestore(doc).toDomain()))
                  .toList(),
            ))
        .handleError((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(const RepositoryFailure.insufficientPermission());
      } else {
        return left(const RepositoryFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<RepositoryFailure, List<Event>>> watchSelected() =>
      _watch(_firestore.selectedEvents());

  @override
  Stream<Either<RepositoryFailure, List<Event>>> watchAll() =>
      _watch(_firestore.eventsCollection);

  Stream<Either<RepositoryFailure, List<Event>>> _watch(Query events) async* {
    yield* events
        .snapshots()
        .map((snapshot) => right<RepositoryFailure, List<Event>>(
              snapshot.docs
                  .map((doc) => EventDto.fromFirestore(doc).toDomain())
                  .toList(),
            ))
        .handleError((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(const RepositoryFailure.insufficientPermission());
      } else {
        return left(const RepositoryFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<RepositoryFailure, Unit>> create(Event event) async {
    try {
      final eventDto = EventDto.fromDomain(event);

      final events = _firestore.eventsCollection;
      await events.doc(eventDto.id).set(eventDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const RepositoryFailure.insufficientPermission());
      } else {
        return left(const RepositoryFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<RepositoryFailure, Unit>> update(Event event) async {
    try {
      final eventDto = EventDto.fromDomain(event);

      final events = _firestore.eventsCollection;
      await events.doc(eventDto.id).update(eventDto.toJson());

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
  Future<Either<RepositoryFailure, Unit>> delete(Event event) async {
    try {
      final eventId = event.id.getOrCrash();

      final events = _firestore.eventsCollection;
      await events.doc(eventId).delete();

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
