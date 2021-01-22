import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/services/regions/region_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IRegionApi)
class RegionApi implements IRegionApi {
  //TODO
  //* exceptions > item not found
  //* selected Region

  @override
  Map<String, Region> countries;
  @override
  Map<String, Region> states;
  @override
  Map<String, Region> regions;
  @override
  Map<String, Region> subregions;

  //!
  @override
  Region selected;

  @override
  Region subregion(String id) => subregions[id];

  RegionApi({
    @required this.countries,
    @required this.states,
    @required this.regions,
    @required this.subregions,
  });

  @factoryMethod
  factory RegionApi.fromJson({List regionsJson}) {
    final countries = <String, Region>{
      'PT': Region(id: 'PT', name: 'Portugal'),
    };
    final states = <String, Region>{};
    final regions = <String, Region>{};
    final subregions = <String, Region>{};

    for (final regionJson in regionsJson) {
      final regionDto = RegionDto.fromJson(regionJson as Map<String, dynamic>);

      switch (regionDto.level) {
        case 1:
          states[regionDto.code] =
              regionDto.toDomain().add(parent: countries.values.last);
          break;
        case 2:
          regions[regionDto.code] =
              regionDto.toDomain().add(parent: states.values.last);
          break;
        case 3:
          subregions[regionDto.code] =
              regionDto.toDomain().add(parent: regions.values.last);
          break;
        default:
      }
    }

    return RegionApi(
      countries: countries,
      states: states,
      regions: regions,
      subregions: subregions,
    );
  }
}
