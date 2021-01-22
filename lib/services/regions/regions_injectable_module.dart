import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';

@module
abstract class RegionsInjectableModule {
  static const String _regionsPath = 'assets/portugal-regions.json';

  @lazySingleton
  @preResolve
  Future<List> get regionsJson async =>
      jsonDecode(await rootBundle.loadString(_regionsPath)) as List;
}
