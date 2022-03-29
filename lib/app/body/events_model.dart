import 'package:events/app/core/base_model.dart';
import 'package:events/domain/core/repository_failure.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:injectable/injectable.dart';

export 'package:events/app/core/base_model.dart';

@Injectable()
class EventsModel extends BaseModel {
  final IEventRepository _eventRepository;
  final IRegionApi _regionApi;

  EventsModel(this._eventRepository, this._regionApi) {
    listen();
  }

  List<Region> _subregions = [];
  List<Region> get subregions => _subregions;

  bool isEmpty() => _subregions.isEmpty;

  RepositoryFailure _failure;
  RepositoryFailure get failure => _failure;

  void _loadSuccess(List<Event> events) {
    events.sort((a, b) => a.subregionId.compareTo(b.subregionId));

    //? refactorization
    _subregions = [];
    Region subregion;
    String id;

    for (final event in events) {
      if (id == null || id != event.subregionId) {
        id = event.subregionId;
        subregion = _regionApi.subregion(id);
        _subregions.add(subregion);
        subregion.events = [];
      }
      subregion.events.add(event);
    }

    loadSuccess();
  }

  void _loadFailure(RepositoryFailure f) {
    _failure = failure;
    loadFailure();
  }

  void listen() {
    loadInProgress();
    _eventRepository
        .watchSelected()
        .listen((failureOrEvents) => failureOrEvents.fold(
              (f) => _loadFailure(f),
              (events) => _loadSuccess(events),
            ));
  }
}
