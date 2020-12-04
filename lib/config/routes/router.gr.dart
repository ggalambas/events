// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../ui/events_view.dart';
import '../../ui/regions_view.dart';
import '../../ui/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String regionsView = '/regions-view';
  static const String eventsView = '/events-view';
  static const all = <String>{
    splashScreen,
    regionsView,
    eventsView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.regionsView, page: RegionsView),
    RouteDef(Routes.eventsView, page: EventsView),
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
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashScreen() => push<dynamic>(Routes.splashScreen);

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
