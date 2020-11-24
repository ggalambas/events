import 'package:events/domain/region.dart';
import 'package:flutter/material.dart';

class RegionsModel extends ChangeNotifier {
  // TODO get location

  //!
  int get liveEvents => 17;
  int get totalEvents => 58;
  List<Region> get near => [
        Region(
          name: 'Mafra',
          liveEvents: 17,
          totalEvents: 58,
        ),
        Region(
          name: 'Ericeira',
          liveEvents: 17,
          totalEvents: 58,
        ),
        Region(
          name: 'Malveira',
          liveEvents: 17,
          totalEvents: 58,
        ),
      ];
  List<Region> get notNear => [
        Region(
          name: 'Mafra',
          liveEvents: 17,
          totalEvents: 58,
        ),
        Region(
          name: 'Ericeira',
          liveEvents: 17,
          totalEvents: 58,
        ),
        Region(
          name: 'Malveira',
          liveEvents: 17,
          totalEvents: 58,
        ),
      ];
}
