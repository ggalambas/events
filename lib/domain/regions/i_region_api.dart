import 'package:events/domain/regions/region.dart';
import 'package:events/domain/regions/subregion.dart';

abstract class IRegionApi {
  Region region(String id);
  Subregion subregion(String id);
  List<Region> regionsList();
  List<Subregion> subregionsList();
}
