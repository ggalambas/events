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
import 'package:shared_preferences/shared_preferences.dart';

import '../app/auth/auth_model.dart';
import '../app/auth/verification_model.dart' as events;
import '../app/appbar/calendar_model.dart';
import '../app/drawer/category_model.dart';
import '../services/categories/category_repository.dart';
import '../services/events/event_repository.dart';
import '../app/body/events_model.dart';
import '../services/auth/firebase_auth_facade.dart';
import '../services/core/firebase_injectable_module.dart';
import '../domain/auth/i_auth_facade.dart';
import '../domain/categories/i_category_repository.dart';
import '../domain/events/i_event_repository.dart';
import '../domain/regions/i_region_api.dart';
import '../app/auth/overview_model.dart';
import '../services/regions/region_api.dart';
import '../app/body/region_counters_model.dart';
import '../services/regions/regions_injectable_module.dart';
import '../app/core/settings_model.dart';
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
  final settingsInjectableModule = _$SettingsInjectableModule();
  gh.lazySingleton<FacebookAuth>(() => firebaseInjectableModule.facebookAuth);
  gh.lazySingleton<FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<FirebaseFirestore>(() => firebaseInjectableModule.firestore);
  gh.lazySingleton<GoogleSignIn>(() => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
        get<FirebaseAuth>(),
        get<GoogleSignIn>(),
        get<FacebookAuth>(),
        get<FirebaseFirestore>(),
      ));
  gh.lazySingleton<ICategoryRepository>(
      () => CategoryRepository(get<FirebaseFirestore>()));
  gh.lazySingleton<IEventRepository>(
      () => EventRepository(get<FirebaseFirestore>()));
  final resolvedList = await regionsInjectableModule.regionsJson;
  gh.lazySingleton<List<dynamic>>(() => resolvedList);
  final resolvedSharedPreferences =
      await settingsInjectableModule.sharedPreferences;
  gh.lazySingleton<SharedPreferences>(() => resolvedSharedPreferences);
  gh.factory<SignInFormModel>(() => SignInFormModel(get<IAuthFacade>()));
  gh.factory<AuthModel>(() => AuthModel(get<IAuthFacade>()));
  gh.factory<events.AuthModel>(() => events.AuthModel(get<IAuthFacade>()));
  gh.factory<CalendarModel>(() => CalendarModel(get<IEventRepository>()));
  gh.factory<CategoryModel>(
      () => CategoryModel(get<ICategoryRepository>(), get<IEventRepository>()));
  gh.lazySingleton<IRegionApi>(
      () => RegionApi.fromJson(regionsJson: get<List<dynamic>>()));
  gh.factory<OverviewModel>(
      () => OverviewModel(get<IAuthFacade>(), get<IRegionApi>()));
  gh.factory<RegionCountersModel>(
      () => RegionCountersModel(get<IEventRepository>(), get<IRegionApi>()));
  gh.factory<SettingsModel>(() => SettingsModel(get<SharedPreferences>()));
  gh.factory<EventsModel>(
      () => EventsModel(get<IEventRepository>(), get<IRegionApi>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}

class _$RegionsInjectableModule extends RegionsInjectableModule {}

class _$SettingsInjectableModule extends SettingsInjectableModule {}
