import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/core/event_counter.dart';
import 'package:events/domain/core/value_objects.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/events/event_failure.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:events/domain/events/value_objects.dart';
import 'package:events/domain/regions/region.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IEventRepository)
class FakeEventRepository implements IEventRepository {
  @override
  Stream<Either<EventFailure, List<Category>>> categoryCounters() async* {
    final List<Category> categories = [];
    for (int i = 0; i < 10; i++) {
      categories.add(
        Category(
          id: UniqueId(),
          name: 'Categoria $i',
          icon: Icons.sports,
          eventCounter: EventCounter(live: i, total: i + 10),
        ),
      );
    }
    yield right(categories);
  }

  @override
  Stream<Either<EventFailure, List<Region>>> regionCounters(
      String categoryName, DateTime day) async* {
    final List<Region> regions = [];
    for (int i = 0; i < 30; i++) {
      regions.add(
        Region(
          id: UniqueId.fromUniqueString('$i'),
          name: 'Region $i',
          eventCounter: EventCounter(live: i, total: i + 7),
        ),
      );
    }
    yield right(regions);
  }

  @override
  Stream<Either<EventFailure, Map<String, List<Event>>>> regionEvents(
      String categoryName, DateTime day, String regionName) async* {
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
            time: day,
            link: EventLink('http://facebook.com'),
          ),
        );
      }
      subregion = 'Freguesia ${j.toString()}';
      subregions[subregion] = events;
    }
    yield right(subregions);
  }
}
