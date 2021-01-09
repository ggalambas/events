// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../app/auth/auth_model.dart';
import '../app/appbar/calendar_model.dart';
import '../app/drawer/category_model.dart';
import '../services/events/event_repository.dart';
import '../app/body/events_model.dart';
import '../services/auth/firebase_auth_facade.dart';
import '../services/core/firebase_injectable_module.dart';
import '../domain/auth/i_auth_facade.dart';
import '../domain/events/i_event_repository.dart';
import '../domain/regions/i_region_api.dart';
import '../services/regions/region_api.dart';
import '../services/core/regions_injectable_module.dart';
import '../app/body/regions_model.dart';
import '../app/auth/sign_in_form_model.dart';

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
  gh.lazySingleton<FacebookAuth>(() => firebaseInjectableModule.facebookAuth);
  gh.lazySingleton<FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<FirebaseFirestore>(() => firebaseInjectableModule.firestore);
  gh.lazySingleton<GoogleSignIn>(() => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
        get<FirebaseAuth>(),
        get<GoogleSignIn>(),
        get<FacebookAuth>(),
      ));
  gh.lazySingleton<IEventRepository>(
      () => EventRepository(get<FirebaseFirestore>()));
  final resolvedList = await regionsInjectableModule.regionsJson;
  gh.lazySingleton<List<dynamic>>(() => resolvedList, instanceName: 'regions');
  final resolvedList1 = await regionsInjectableModule.subregionsJson;
  gh.lazySingleton<List<dynamic>>(() => resolvedList1,
      instanceName: 'subregions');
  gh.factory<RegionsModel>(() => RegionsModel(get<IEventRepository>()));
  gh.factory<SignInFormModel>(() => SignInFormModel(get<IAuthFacade>()));
  gh.factory<AuthModel>(() => AuthModel(get<IAuthFacade>()));
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
