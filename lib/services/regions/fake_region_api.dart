import 'dart:convert';

import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';

@LazySingleton(as: IRegionApi)
class FakeRegionApi implements IRegionApi {
  final String regionsPath = 'assets/concelhos-metadata.json';
  final String subregionsPath = 'assets/freguesias-metadata.json';

  //TODO: near regions
  @override
  bool isNear(Region region) {
    return false;
  }

  //TODO: failure
  @override
  Future<Map<String, String>> names(String subregionId) async {
    final subregions = await _getListFromAsset(subregionsPath);
    for (final subregion in subregions) {
      if (subregion['dicofre'] == subregionId) {
        return {
          'regionName': subregion['concelho'].toString(),
          'subregionName': subregion['freguesia'].toString(),
        };
      }
    }
    return {'regionName': 'ERROR', 'subregionName': 'ERROR'};
  }

  Future<dynamic> _getListFromAsset(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    return jsonDecode(jsonString)['d'];
  }

  //! used only to populate
  Future<List<String>> subregionsIds() async {
    final subregions = await _getListFromAsset(subregionsPath);
    final List<String> subregionsIds = [];
    subregions.forEach(
      (subregion) => subregionsIds.add(
        subregion['dicofre'].toString(),
      ),
    );
    return subregionsIds;
  }
}
