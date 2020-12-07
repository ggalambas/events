import 'package:events/app/core/base_model.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/events/event_failure.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:injectable/injectable.dart';

export 'package:events/app/core/base_model.dart';

@Injectable()
class EventsModel extends BaseModel {
  final IEventRepository _eventRepository;

  EventsModel(this._eventRepository);

  Map<String, List<Event>> _subregions = {};
  Map<String, List<Event>> get subregions => _subregions;

  bool isEmpty() => _subregions.isEmpty;

  EventFailure _failure;
  EventFailure get failure => _failure;

  void _loadSuccess(Map<String, List<Event>> subregions) {
    _subregions = subregions;
    loadSuccess();
  }

  void _loadFailure(EventFailure f) {
    _failure = failure;
    loadFailure();
  }

  void listen(String regionId) {
    loadInProgress();
    _eventRepository
        .regionEvents(regionId)
        .listen((failureOrEvents) => failureOrEvents.fold(
              (f) => _loadFailure(f),
              (subregions) => _loadSuccess(subregions),
            ));
  }
}
