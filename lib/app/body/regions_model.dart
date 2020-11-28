import 'dart:math';

import 'package:events/domain/events/i_event_repository.dart';
import 'package:events/domain/regions/region.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegionsModel extends ChangeNotifier {
  final IEventRepository _eventRepository;

  RegionsModel(this._eventRepository);

  // TODO get location

  //!
  int get liveEvents => 17;
  int get totalEvents => 85;
  List<Region> get near => [
        Region(
          name: 'Arruda dos Vinhos',
          liveEvents: Random().nextInt(5),
          totalEvents: Random().nextInt(20) + 5,
        ),
      ];
  List<Region> get notNear => [
        Region(
          name: 'Alenquer',
          liveEvents: Random().nextInt(5),
          totalEvents: Random().nextInt(20) + 5,
        ),
      ];
}
