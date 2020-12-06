import 'package:events/app/core/base_model.dart';
import 'package:events/domain/core/event_counter.dart';
import 'package:events/domain/core/value_objects.dart';
import 'package:events/domain/events/event_failure.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:injectable/injectable.dart';

export 'package:events/app/core/base_model.dart';

@Injectable()
class RegionsModel extends BaseModel {
  final IEventRepository _eventRepository;
  final IRegionApi _regionApi;

  RegionsModel(this._eventRepository, this._regionApi);

  Region _all = Region.empty();
  Region get all => _all;

  List<Region> _near = [];
  List<Region> get near => _near;

  List<Region> _others = [];
  List<Region> get others => _others;

  EventFailure _failure;
  EventFailure get failure => _failure;

  bool isEmpty() => _all.eventCounter.total == 0;

  void _loadSuccess(List<Region> regions) {
    //TODO: regions location
    List<Region> near = [];
    List<Region> others = [];
    // List<Region> near = regions;
    // List<Region> others = regions;
    int live = 0;
    int total = 0;

    regions.forEach((region) {
      _regionApi.isNear(region) ? near.add(region) : others.add(region);
      live += region.eventCounter.live;
      total += region.eventCounter.total;
    });

    _all = Region(
      id: UniqueId(), //!
      name: 'Todos os Eventos',
      eventCounter: EventCounter(live: live, total: total),
    );
    _near = near;
    _others = others;
    loadSuccess();
  }

  void _loadFailure(EventFailure f) {
    _failure = failure;
    loadFailure();
  }

  void listen(String categoryName, DateTime day) {
    loadInProgress();
    _eventRepository
        .regionCounters(categoryName, day)
        .listen((failureOrRegions) => failureOrRegions.fold(
              (f) => _loadFailure(f),
              (regions) => _loadSuccess(regions),
            ));
  }
}
