import 'package:events/domain/i_region_api.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IRegionApi)
class GovRegionApi implements IRegionApi {}
