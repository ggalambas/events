import 'package:events/domain/regions/region.dart';

abstract class IRegionApi {
  bool isNear(Region region);
}
