import 'package:events/app/core/base_model.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/events/event_failure.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/subregion.dart';
import 'package:injectable/injectable.dart';

export 'package:events/app/core/base_model.dart';

@Injectable()
class EventsModel extends BaseModel {
  final IEventRepository _eventRepository;
  final IRegionApi _regionApi;

  EventsModel(this._eventRepository, this._regionApi) {
    listen();
  }

  List<Subregion> _subregions = [];
  List<Subregion> get subregions => _subregions;

  bool isEmpty() => _subregions.isEmpty;

  EventFailure _failure;
  EventFailure get failure => _failure;

  void _loadSuccess(List<Event> events) {
    events.sort((a, b) => a.subregionId.compareTo(b.subregionId));

    //? refactorization
    _subregions = [];
    Subregion subregion;
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

  void _loadFailure(EventFailure f) {
    _failure = failure;
    loadFailure();
  }

  void listen() {
    loadInProgress();
    _eventRepository.events().listen((failureOrEvents) => failureOrEvents.fold(
          (f) => _loadFailure(f),
          (events) => _loadSuccess(events),
        ));
  }
}
