import 'package:events/domain/regions/region.dart';

abstract class IRegionApi {
  Future<Map<String, String>> names(String subregionId);
  bool isNear(Region region);
}
