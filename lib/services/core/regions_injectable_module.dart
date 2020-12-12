import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';

@module
abstract class RegionsInjectableModule {
  static const String _regionsPath = 'assets/concelhos-metadata.json';
  static const String _subregionsPath = 'assets/freguesias-metadata.json';

  @Named('regions')
  @lazySingleton
  @preResolve
  Future<List> get regionsJson async =>
      jsonDecode(await rootBundle.loadString(_regionsPath))['d'] as List;

  @Named('subregions')
  @lazySingleton
  @preResolve
  Future<List> get subregionsJson async =>
      jsonDecode(await rootBundle.loadString(_subregionsPath))['d'] as List;
}
