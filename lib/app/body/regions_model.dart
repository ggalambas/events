import 'package:events/app/core/base_model.dart';
import 'package:events/domain/core/repository_failure.dart';
import 'package:events/domain/events/i_event_repository.dart';
import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:injectable/injectable.dart';
export 'package:events/app/core/base_model.dart';

@Injectable()
class RegionsModel extends BaseModel {
  final IEventRepository _eventRepository;
  final IRegionApi _regionApi;

  RegionsModel(this._eventRepository, this._regionApi) {
    listen();
  }

  List<Region> _near = [];
  List<Region> get near => _near;

  List<Region> _others = [];
  List<Region> get others => _others;

  RepositoryFailure _failure;
  RepositoryFailure get failure => _failure;

  bool isEmpty() => _near.isEmpty && _others.isEmpty;

  void _loadSuccess(List<Region> regions) {
    _others = regions;
    _near = [];
    loadSuccess();
  }

  void _loadFailure(RepositoryFailure f) {
    _failure = failure;
    loadFailure();
  }

  void listen() {
    loadInProgress();
    _eventRepository
        .regionCounters()
        .listen((failureOrRegions) => failureOrRegions.fold(
              (f) => _loadFailure(f),
              (regions) => _loadSuccess(regions),
            ));
  }

  Region get selected => _regionApi.selected;
  set selected(Region region) {
    _regionApi.selected = region;
    notifyListeners();
  }
}
