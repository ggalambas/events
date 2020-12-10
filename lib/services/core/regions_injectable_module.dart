import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';

@module
abstract class RegionsInjectableModule {
  static const String _regionsPath = 'assets/concelhos-metadata.json';
  static const String _subregionsPath = 'assets/freguesias-metadata.json';

  @Named('regions')
  @lazySingleton
  Future<List<Map<String, dynamic>>> get regionsJson async =>
      jsonDecode(await rootBundle.loadString(_regionsPath))['d']
          as List<Map<String, dynamic>>;

  @Named('subregions')
  @lazySingleton
  Future<List<Map<String, dynamic>>> get subregionsJson async =>
      jsonDecode(await rootBundle.loadString(_subregionsPath))['d']
          as List<Map<String, dynamic>>;
}
