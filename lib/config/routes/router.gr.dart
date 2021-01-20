// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/events/event.dart';
import '../../ui/screens/auth_screen.dart';
import '../../ui/screens/events_screen.dart';
import '../../ui/screens/login_screen.dart';
import '../../ui/screens/overview_screen.dart';
import '../../ui/screens/poster_screen.dart';
import '../../ui/screens/regions_screen.dart';
import '../../ui/screens/register_screen.dart';
import '../../ui/screens/settings_screen.dart';

class Routes {
  static const String authScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String registerScreen = '/register-screen';
  static const String overviewScreen = '/overview-screen';
  static const String regionsScreen = '/regions-screen';
  static const String eventsScreen = '/events-screen';
  static const String posterScreen = '/poster-screen';
  static const String settingsScreen = '/settings-screen';
  static const all = <String>{
    authScreen,
    loginScreen,
    registerScreen,
    overviewScreen,
    regionsScreen,
    eventsScreen,
    posterScreen,
    settingsScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.authScreen, page: AuthScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.registerScreen, page: RegisterScreen),
    RouteDef(Routes.overviewScreen, page: OverviewScreen),
    RouteDef(Routes.regionsScreen, page: RegionsScreen),
    RouteDef(Routes.eventsScreen, page: EventsScreen),
    RouteDef(Routes.posterScreen, page: PosterScreen),
    RouteDef(Routes.settingsScreen, page: SettingsScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AuthScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AuthScreen(),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    RegisterScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterScreen(),
        settings: data,
      );
    },
    OverviewScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OverviewScreen(),
        settings: data,
      );
    },
    RegionsScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegionsScreen(),
        settings: data,
      );
    },
    EventsScreen: (data) {
      final args = data.getArgs<EventsScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EventsScreen(args.regionName),
        settings: data,
      );
    },
    PosterScreen: (data) {
      final args = data.getArgs<PosterScreenArguments>(
        orElse: () => PosterScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => PosterScreen(event: args.event),
        settings: data,
      );
    },
    SettingsScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingsScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushAuthScreen() => push<dynamic>(Routes.authScreen);

  Future<dynamic> pushLoginScreen() => push<dynamic>(Routes.loginScreen);

  Future<dynamic> pushRegisterScreen() => push<dynamic>(Routes.registerScreen);

  Future<dynamic> pushOverviewScreen() => push<dynamic>(Routes.overviewScreen);

  Future<dynamic> pushRegionsScreen() => push<dynamic>(Routes.regionsScreen);

  Future<dynamic> pushEventsScreen({
    @required String regionName,
  }) =>
      push<dynamic>(
        Routes.eventsScreen,
        arguments: EventsScreenArguments(regionName: regionName),
      );

  Future<dynamic> pushPosterScreen({
    Event event,
  }) =>
      push<dynamic>(
        Routes.posterScreen,
        arguments: PosterScreenArguments(event: event),
      );

  Future<dynamic> pushSettingsScreen() => push<dynamic>(Routes.settingsScreen);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// EventsScreen arguments holder class
class EventsScreenArguments {
  final String regionName;
  EventsScreenArguments({@required this.regionName});
}

/// PosterScreen arguments holder class
class PosterScreenArguments {
  final Event event;
  PosterScreenArguments({this.event});
}
