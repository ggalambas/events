// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/events/event.dart';
import '../../ui/screens/events_view.dart';
import '../../ui/screens/login_screen.dart';
import '../../ui/screens/poster_view.dart';
import '../../ui/screens/regions_view.dart';
import '../../ui/screens/register_screen.dart';
import '../../ui/screens/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String registerScreen = '/register-screen';
  static const String regionsView = '/regions-view';
  static const String eventsView = '/events-view';
  static const String posterView = '/poster-view';
  static const all = <String>{
    splashScreen,
    loginScreen,
    registerScreen,
    regionsView,
    eventsView,
    posterView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.registerScreen, page: RegisterScreen),
    RouteDef(Routes.regionsView, page: RegionsView),
    RouteDef(Routes.eventsView, page: EventsView),
    RouteDef(Routes.posterView, page: PosterView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
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
    RegionsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegionsView(),
        settings: data,
      );
    },
    EventsView: (data) {
      final args = data.getArgs<EventsViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EventsView(
          categoryName: args.categoryName,
          regionName: args.regionName,
        ),
        settings: data,
      );
    },
    PosterView: (data) {
      final args = data.getArgs<PosterViewArguments>(
        orElse: () => PosterViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => PosterView(event: args.event),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashScreen() => push<dynamic>(Routes.splashScreen);

  Future<dynamic> pushLoginScreen() => push<dynamic>(Routes.loginScreen);

  Future<dynamic> pushRegisterScreen() => push<dynamic>(Routes.registerScreen);

  Future<dynamic> pushRegionsView() => push<dynamic>(Routes.regionsView);

  Future<dynamic> pushEventsView({
    @required String categoryName,
    @required String regionName,
  }) =>
      push<dynamic>(
        Routes.eventsView,
        arguments: EventsViewArguments(
            categoryName: categoryName, regionName: regionName),
      );

  Future<dynamic> pushPosterView({
    Event event,
  }) =>
      push<dynamic>(
        Routes.posterView,
        arguments: PosterViewArguments(event: event),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// EventsView arguments holder class
class EventsViewArguments {
  final String categoryName;
  final String regionName;
  EventsViewArguments({@required this.categoryName, @required this.regionName});
}

/// PosterView arguments holder class
class PosterViewArguments {
  final Event event;
  PosterViewArguments({this.event});
}
