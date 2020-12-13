import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/domain/regions/subregion.dart';
import 'package:events/services/regions/region_dto.dart';
import 'package:events/services/regions/subregion_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IRegionApi)
class RegionApi implements IRegionApi {
  Map<String, Region> regions;
  Map<String, Subregion> subregions;

  //TODO
  //* exceptions > item not found

  RegionApi({@required this.regions, @required this.subregions});

  @factoryMethod
  factory RegionApi.fromJson(
    @Named('regions') List regionsJson,
    @Named('subregions') List subregionsJson,
  ) {
    return RegionApi(
      regions: {
        for (var region in regionsJson.map(
            (x) => RegionDto.fromJson(x as Map<String, dynamic>).toDomain()))
          region.id: region
      },
      subregions: {
        for (var subregion in subregionsJson.map(
            (x) => SubregionDto.fromJson(x as Map<String, dynamic>).toDomain()))
          subregion.id: subregion
      },
    );
  }

  @override
  Region region(String id) => regions[id];

  @override
  Subregion subregion(String id) => subregions[id];

  @override
  List<Region> regionsList() => regions.values.toList();

  @override
  List<Subregion> subregionsList() => subregions.values.toList();
}
