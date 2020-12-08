// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/events/event.dart';
import '../../ui/screens/events_screen.dart';
import '../../ui/screens/login_screen.dart';
import '../../ui/screens/poster_screen.dart';
import '../../ui/screens/regions_screen.dart';
import '../../ui/screens/register_screen.dart';

class Routes {
  static const String loginScreen = '/login-screen';
  static const String registerScreen = '/register-screen';
  static const String regionsScreen = '/';
  static const String eventsScreen = '/events-screen';
  static const String posterScreen = '/poster-screen';
  static const all = <String>{
    loginScreen,
    registerScreen,
    regionsScreen,
    eventsScreen,
    posterScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.registerScreen, page: RegisterScreen),
    RouteDef(Routes.regionsScreen, page: RegionsScreen),
    RouteDef(Routes.eventsScreen, page: EventsScreen),
    RouteDef(Routes.posterScreen, page: PosterScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
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
    RegionsScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegionsScreen(),
        settings: data,
      );
    },
    EventsScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EventsScreen(),
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
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushLoginScreen() => push<dynamic>(Routes.loginScreen);

  Future<dynamic> pushRegisterScreen() => push<dynamic>(Routes.registerScreen);

  Future<dynamic> pushRegionsScreen() => push<dynamic>(Routes.regionsScreen);

  Future<dynamic> pushEventsScreen() => push<dynamic>(Routes.eventsScreen);

  Future<dynamic> pushPosterScreen({
    Event event,
  }) =>
      push<dynamic>(
        Routes.posterScreen,
        arguments: PosterScreenArguments(event: event),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// PosterScreen arguments holder class
class PosterScreenArguments {
  final Event event;
  PosterScreenArguments({this.event});
}
