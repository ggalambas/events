// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../app/drawer/category_model.dart';
import '../app/body/events_model.dart';
import '../services/events/fake_event_repository.dart';
import '../services/regions/fake_region_api.dart';
import '../services/core/firebase_injectable_module.dart';
import '../domain/events/i_event_repository.dart';
import '../domain/regions/i_region_api.dart';
import '../app/body/regions_model.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<FirebaseFirestore>(() => firebaseInjectableModule.firestore);
  gh.lazySingleton<IEventRepository>(() => FakeEventRepository());
  gh.lazySingleton<IRegionApi>(() => FakeRegionApi());
  gh.factory<RegionsModel>(
      () => RegionsModel(get<IEventRepository>(), get<IRegionApi>()));
  gh.factory<CategoryModel>(() => CategoryModel(get<IEventRepository>()));
  gh.factory<EventsModel>(() => EventsModel(get<IEventRepository>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
