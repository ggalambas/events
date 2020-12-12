import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/core/event_counter.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/events/event_failure.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  //TODO: EventRepository
  //* 1. Exceptions
  //* 4. subregionEvents
  //* 5. initial category
  //* 6. save not just day but year and month

  //!
  @override
  Category selectedCategory = Category(
    id: 'MqwY5zioIvOI7p6CCPT4',
    name: 'Categoria 01',
    icon: IconData(58947),
    eventCounter: EventCounter(live: 0, total: 0),
  );

  //!
  @override
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  //!
  @override
  Region selectedRegion = Region(id: '0101', name: 'Águeda');

  @override
  Stream<Either<EventFailure, List<Category>>> categories() async* {
    final categories = _firestore.categoriesCollection();
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
  Stream<Either<EventFailure, List<Region>>> regions() async* {
    final regions = _firestore.regionsCollection();
    yield* regions
        .snapshots()
        .map((snapshot) => right<EventFailure, List<Region>>(
              snapshot.docs
                  .map((doc) => RegionDto.fromFirestoreToDomain(doc))
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
  Stream<Either<EventFailure, List<Event>>> events() async* {
    //! this cant be called if selectedRegion == null
    //? change this to have an argument or throw exception
    final events = _firestore.selectedEventsQuery();
    // final events = _firestore.eventsCollection();
    yield* events
        .snapshots()
        .map((snapshot) => right<EventFailure, List<Event>>(
              snapshot.docs
                  .map((doc) => EventDto.fromFirestore(doc).toDomain())
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
  Future<Either<EventFailure, Unit>> create(Event event) async {
    try {
      //! take intou account that if one throws an exception,
      //! the other had already changed the database

      //! transactions
      // https://firebase.flutter.dev/docs/firestore/usage#transactionshttps://firebase.flutter.dev/docs/firestore/usage#transactions

      final eventDto = EventDto.fromDomain(event);

      //* add Event to events Collection
      final events = _firestore.eventsCollection();
      await events.doc(eventDto.id).set(eventDto.toJson());

      //* update Category counter
      final categories = _firestore.categoriesCollection();
      await categories.doc(eventDto.categoryId).incrementTotalEvents();

      //* update Regions counter
      final regions = _firestore.regionsCollection(
          eventDto.categoryId, event.date.day.toString());
      await regions.doc(eventDto.regionId).setOrIncrementTotalEvents();

      //* update subregions list
      final subregions = _firestore.subregionsCollection(
          eventDto.categoryId, event.date.day.toString(), eventDto.regionId);
      await subregions.doc(eventDto.subregionId).addToEventsList(eventDto.id);

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
  Future<Either<EventFailure, Unit>> update(Event event) async {
    try {
      final eventDto = EventDto.fromDomain(event);

      final events = _firestore.eventsCollection();
      await events.doc(eventDto.id).update(eventDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const EventFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const EventFailure.unableToUpdate());
      } else {
        return left(const EventFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<EventFailure, Unit>> delete(Event event) async {
    try {
      final eventId = event.id.getOrCrash();

      final events = _firestore.eventsCollection();
      await events.doc(eventId).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const EventFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const EventFailure.unableToUpdate());
      } else {
        return left(const EventFailure.unexpected());
      }
    }
  }
}
