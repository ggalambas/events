import 'dart:convert';

import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/services/regions/region_dto.dart';
import 'package:events/services/regions/subregion_dto.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/services/core/firebase_helpers.dart';

@LazySingleton(as: IRegionApi)
class FakeRegionApi implements IRegionApi {
  final String regionsPath = 'assets/concelhos-metadata.json';
  final String subregionsPath = 'assets/freguesias-metadata.json';

  //! REFACTORATE EVERYTHING

  @override
  bool isNear(Region region) {
    return region.name.length == 8 &&
        int.parse(region.name[region.name.length - 1]) >= 1 &&
        int.parse(region.name[region.name.length - 1]) < 5;
  }

  Future<String> _loadFromAsset(String path) async =>
      rootBundle.loadString(path);

  Future<dynamic> parseJson(String path) async {
    final String jsonString = await _loadFromAsset(path);
    return jsonDecode(jsonString);
  }

  Future<List<String>> subregions() async {
    final jsonResponse = await parseJson(subregionsPath);
    final List<String> subregions = [];
    jsonResponse['d'].forEach(
      (subregion) => subregions.add(
        subregion['dicofre'].toString(),
      ),
    );
    return subregions;
  }
}
