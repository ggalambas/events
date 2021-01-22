import 'package:events/domain/regions/region.dart';

abstract class IRegionApi {
  Map<String, Region> countries;
  Map<String, Region> states;
  Map<String, Region> regions;
  Map<String, Region> subregions;

  Region selected;

  Region subregion(String id);
}
