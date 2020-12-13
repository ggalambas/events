// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../app/appbar/calendar_model.dart';
import '../app/drawer/category_model.dart';
import '../services/events/event_repository.dart';
import '../app/body/events_model.dart';
import '../services/core/firebase_injectable_module.dart';
import '../domain/events/i_event_repository.dart';
import '../domain/regions/i_region_api.dart';
import '../services/regions/region_api.dart';
import '../services/core/regions_injectable_module.dart';
import '../app/body/regions_model.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final regionsInjectableModule = _$RegionsInjectableModule();
  gh.lazySingleton<FirebaseFirestore>(() => firebaseInjectableModule.firestore);
  gh.lazySingleton<IEventRepository>(
      () => EventRepository(get<FirebaseFirestore>()));
  final list = await regionsInjectableModule.regionsJson;
  gh.lazySingleton<List<dynamic>>(() => list, instanceName: 'regions');
  final list1 = await regionsInjectableModule.subregionsJson;
  gh.lazySingleton<List<dynamic>>(() => list1, instanceName: 'subregions');
  gh.factory<RegionsModel>(() => RegionsModel(get<IEventRepository>()));
  gh.factory<CalendarModel>(() => CalendarModel(get<IEventRepository>()));
  gh.factory<CategoryModel>(() => CategoryModel(get<IEventRepository>()));
  gh.lazySingleton<IRegionApi>(() => RegionApi.fromJson(
      get<List<dynamic>>(instanceName: 'regions'),
      get<List<dynamic>>(instanceName: 'subregions')));
  gh.factory<EventsModel>(
      () => EventsModel(get<IEventRepository>(), get<IRegionApi>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}

class _$RegionsInjectableModule extends RegionsInjectableModule {}
