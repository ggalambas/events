// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../ui/regions_view.dart';

class Routes {
  static const String regionsView = '/';
  static const all = <String>{
    regionsView,
  };
}

class ARouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.regionsView, page: RegionsView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    RegionsView: (data) {
      final args = data.getArgs<RegionsViewArguments>(
        orElse: () => RegionsViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegionsView(category: args.category),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension ARouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushRegionsView({
    String category,
  }) =>
      push<dynamic>(
        Routes.regionsView,
        arguments: RegionsViewArguments(category: category),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// RegionsView arguments holder class
class RegionsViewArguments {
  final String category;
  RegionsViewArguments({this.category});
}
