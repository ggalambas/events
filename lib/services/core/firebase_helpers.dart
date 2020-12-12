import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/events/i_event_repository.dart';

extension FirestoreX on FirebaseFirestore {
  // Future<DocumentReference> userDocument() async {
  //   final userOption = await getIt<IAuthFacade>().getSignedInUser();
  //   final user = userOption.getOrElse(() => throw NotAuthenticatedError());
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user.id.getOrCrash());
  // }

  CollectionReference eventsCollection() {
    return collection('events');
  }

  Query selectedEventsQuery() {
    final repo = getIt<IEventRepository>();
    return collection('events')
        .where('categoryId', isEqualTo: repo.selectedCategory.id)
        .where('regionId', isEqualTo: repo.selectedRegion.id)
        .where('date',
            isGreaterThanOrEqualTo: repo.selectedDate.microsecondsSinceEpoch,
            isLessThan: repo.selectedDate
                .add(Duration(days: 1))
                .microsecondsSinceEpoch);
  }

  CollectionReference categoriesCollection() {
    return collection('categories');
  }

  CollectionReference regionsCollection([
    String categoryId,
    String day,
  ]) {
    final repo = getIt<IEventRepository>();
    return collection('categoryRegions')
        .doc(categoryId ?? repo.selectedCategory.id)
        .collection('days')
        .doc(day ?? repo.selectedDate.day.toString())
        .collection('regions');
  }

  CollectionReference subregionsCollection([
    String categoryId,
    String day,
    String regionId,
  ]) {
    final repo = getIt<IEventRepository>();
    return collection('categoryRegionEvents')
        .doc(categoryId ?? repo.selectedCategory.id)
        .collection('days')
        .doc(day ?? repo.selectedDate.day.toString())
        .collection('regions')
        .doc(regionId ?? repo.selectedRegion.id)
        .collection('subregions');
  }
}

extension DocumentReferenceX on DocumentReference {
  Future<void> incrementTotalEvents() =>
      update({'totalEvents': FieldValue.increment(1)});

  Future<void> setOrIncrementTotalEvents() =>
      set({'totalEvents': FieldValue.increment(1)}, SetOptions(merge: true));

  Future<void> addToEventsList(String eventId) => set({
        'events': FieldValue.arrayUnion([eventId])
      }, SetOptions(merge: true));
}

/*
 ! DATABASE STRUCTURE 
 * events/{eventId}/[name, date, link, posterUrl, categoryId, subregionId, ownerId]
 * 
 * categories/{categoryId}/[name,
 *                          icon,
 *                          liveEvents,
 *                          totalEvents]
 * 
 * categoryRegions/{categoryId}/days/{day}/regions/{regionId}/[name,
 *                                                            liveEvents,
 *                                                            totalEvents]
 * 
 categoryRegionEvents/{categoryId}/days/{day}/regions/{regionId}/subregions/{subregionId}/[List<EventId>]
 * 
 * userEvents/{userId}/[List<EventId>]
 * user{userId}/[..userInfo]
 */
