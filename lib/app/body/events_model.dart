import 'package:events/app/core/base_model.dart';
import 'package:events/domain/events/event_failure.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:events/domain/regions/subregion.dart';
import 'package:injectable/injectable.dart';

export 'package:events/app/core/base_model.dart';

@Injectable()
class EventsModel extends BaseModel {
  final IEventRepository _eventRepository;

  EventsModel(this._eventRepository) {
    listenToSubregions();
  }

  List<Subregion> _subregions = [];
  List<Subregion> get subregions => _subregions;

  bool isEmpty() => _subregions.isEmpty;

  EventFailure _failure;
  EventFailure get failure => _failure;

  void _loadSuccess(List<Subregion> subregions) {
    _subregions = subregions;
    loadSuccess();
  }

  void _loadFailure(EventFailure f) {
    _failure = failure;
    loadFailure();
  }

  void listenToSubregions() {
    loadInProgress();
    _eventRepository
        .subregions()
        .listen((failureOrEvents) => failureOrEvents.fold(
              (f) => _loadFailure(f),
              (subregions) => _loadSuccess(subregions),
            ));
  }
}
