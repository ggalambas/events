import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  // Future<DocumentReference> userDocument() async {
  //   final userOption = await getIt<IAuthFacade>().getSignedInUser();
  //   final user = userOption.getOrElse(() => throw NotAuthenticatedError());
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user.id.getOrCrash());
  // }

  CollectionReference get eventsCollection => collection('events');
}

/*
 ! DATABASE STRUCTURE 
 * categories/{categoryId}/[name,
 *                          icon,
 *                          liveEvents,
 *                          totalEvents]
 * 
 * categoryRegions/{categoryId}/days/{day}/regions/{regionId}/[name,
 *                                                            liveEvents,
 *                                                            totalEvents]
 * 
 * categoryRegionEvents/{categoryId}/days/{day}/regions/{regionId}/subregions/{subregionId}/[List<EventId>]
 * 
 * events/{eventId}/[name, time, link, posterUrl, ?categoryId, ?regionId, ?subregionId, ?ownerId]
 * 
 * userEvents/{userId}/[List<EventId>]
 * user{userId}/[..userInfo]
 */
