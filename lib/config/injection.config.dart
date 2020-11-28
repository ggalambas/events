// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../services/events/event_repository.dart';
import '../services/core/firebase_injectable_module.dart';
import '../domain/events/i_event_repository.dart';
import '../domain/regions/i_region_api.dart';
import '../services/regions/region_api.dart';
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
  gh.lazySingleton<IEventRepository>(
      () => EventRepository(get<FirebaseFirestore>()));
  gh.lazySingleton<IRegionApi>(() => RegionApi());
  gh.factory<RegionsModel>(() => RegionsModel(get<IEventRepository>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
