import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/core/value_objects.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:events/domain/events/value_objects.dart';
import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/services/categories/category_dto.dart';
import 'package:events/services/events/event_repository.dart';
import 'package:faker/faker.dart';
import 'package:events/services/core/firebase_helpers.dart';
import 'package:events/app/helpers/string_x.dart';
import 'package:events/app/helpers/date_time_x.dart';

Future populate() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Faker faker = Faker();

  final QuerySnapshot categoriesSnapshot =
      await firestore.categoriesCollection().get();
  final List<String> categories = [];
  for (final QueryDocumentSnapshot doc in categoriesSnapshot.docs) {
    categories.add(doc.id);
  }

  final IRegionApi regionApi = getIt<IRegionApi>();
  final List<String> subregions =
      regionApi.subregionsList().map((subregion) => subregion.id).toList();

  final IEventRepository eventRepository = EventRepository(firestore);

  Event event;
  String subregionId;
  for (int i = 0; i < 1; i++) {
    subregionId = subregions[faker.randomGenerator.integer(subregions.length)];
    event = Event(
      id: UniqueId(),
      name: EventName(faker.lorem.words(3).join(' ').capitalize()),
      date: DateTime(
        2020,
        12,
        faker.randomGenerator
            .integer(DateTime.now().after(14).day, min: DateTime.now().day),
        faker.randomGenerator.integer(24),
        faker.randomGenerator.integer(12) * 5,
      ),
      link: EventLink(faker.internet.httpUrl()),
      regionId: subregionId.substring(0, 4),
      subregionId: subregionId,
      categoryId: categories[faker.randomGenerator.integer(categories.length)],
      poster: Poster(File(faker.image.image(width: 360, height: 720))),
    );
    eventRepository.create(event);
    print('event $i created');
  }
}

void createCategories() {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  for (int i = 1; i <= 15; i++) {
    firestore.categoriesCollection().add(CategoryDto(
          name: 'Categoria ${i.toString().padLeft(2, '0')}',
          icon: 0xe643,
          liveEvents: 0,
          totalEvents: 0,
        ).toJson());
  }
}

void changeEventsDate() {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final events = firestore.eventsCollection();
  events.snapshots().map(
        (snapshot) => snapshot.docs.map(
          (doc) => events.doc(doc.id).update(
            {'date': FieldValue.increment(Duration(days: 5).inMicroseconds)},
          ),
        ),
      );
}
