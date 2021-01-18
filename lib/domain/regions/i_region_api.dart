import 'package:events/domain/regions/region.dart';
import 'package:events/domain/regions/subregion.dart';

abstract class IRegionApi {
  Map<String, Region> regions;
  Map<String, Subregion> subregions;

  Region selected;

  Region region(String id);
  Subregion subregion(String id);
  List<Region> regionsList();
  List<Subregion> subregionsList();
}
