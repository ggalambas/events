import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/auth/i_auth_facade.dart';
import 'package:events/domain/categories/i_category_repository.dart';
import 'package:events/domain/core/errors.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:events/domain/regions/i_region_api.dart';

extension FirestoreX on FirebaseFirestore {
  DocumentReference userDoc() {
    final userOption = getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.id.getOrCrash());
  }

  CollectionReference get categoriesCollection => collection('categories');
  CollectionReference get countersCollection => collection('counters');
  CollectionReference get eventsCollection => collection('events');

  //* counters / {categoryId} / total
  //*                           live
  //*                           days / {day} / total
  //*                                          live
  //*                                          regions / {regionId} / total
  //*                                                                 live

  CollectionReference get categoryCounters {
    return countersCollection;
  }

  CollectionReference get dayCounters {
    final selectedCategory = getIt<ICategoryRepository>().selected;
    return categoryCounters.doc(selectedCategory.id).collection('days');
  }

  CollectionReference get regionCounters {
    final selectedDay = getIt<IEventRepository>().selectedDay;
    return dayCounters
        .doc(selectedDay.microsecondsSinceEpoch.toString())
        .collection('regions');
  }

  Query selectedEvents() {
    final selectedCategory = getIt<ICategoryRepository>().selected;
    final selectedDay = getIt<IEventRepository>().selectedDay;
    final selectedRegion = getIt<IRegionApi>().selected;
    return eventsCollection
        .where(
          'categoryId',
          isEqualTo: selectedCategory.id,
        )
        .where(
          'day',
          isEqualTo: selectedDay.microsecondsSinceEpoch,
        )
        .where(
          'regionId',
          isEqualTo: selectedRegion.id,
        );
  }
}
