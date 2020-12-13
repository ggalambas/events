import 'package:events/app/core/base_model.dart';
import 'package:events/domain/events/event_failure.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:events/domain/regions/region.dart';
import 'package:injectable/injectable.dart';
export 'package:events/app/core/base_model.dart';

//TODO
//* Regions Location

@Injectable()
class RegionsModel extends BaseModel {
  final IEventRepository _eventRepository;

  RegionsModel(this._eventRepository) {
    listen();
  }

  List<Region> _near = [];
  List<Region> get near => _near;

  List<Region> _others = [];
  List<Region> get others => _others;

  EventFailure _failure;
  EventFailure get failure => _failure;

  bool isEmpty() => _near.isEmpty && _others.isEmpty;

  void _loadSuccess(List<Region> regions) {
    _others = regions;
    _near = [];
    loadSuccess();
  }

  void _loadFailure(EventFailure f) {
    _failure = failure;
    loadFailure();
  }

  void listen() {
    loadInProgress();
    _eventRepository
        .regions()
        .listen((failureOrRegions) => failureOrRegions.fold(
              (f) => _loadFailure(f),
              (regions) => _loadSuccess(regions),
            ));
  }

  Region get selected => _eventRepository.selectedRegion;
  set selected(Region region) {
    _eventRepository.selectedRegion = region;
    notifyListeners(); //?
  }
}
