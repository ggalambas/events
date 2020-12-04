import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IRegionApi)
class FakeRegionApi implements IRegionApi {
  @override
  bool isNear(Region region) {
    return region.name.length == 8 &&
        int.parse(region.name[region.name.length - 1]) >= 1 &&
        int.parse(region.name[region.name.length - 1]) < 5;
  }
}
