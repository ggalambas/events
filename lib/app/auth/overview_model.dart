import 'package:dartz/dartz.dart';
import 'package:events/domain/auth/i_auth_facade.dart';
import 'package:events/domain/auth/user_prefs.dart';
import 'package:events/domain/core/repository_failure.dart';
import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class OverviewModel extends ChangeNotifier {
  final IAuthFacade _authFacade;
  final IRegionApi _regionApi;

  OverviewModel(this._authFacade, this._regionApi) {
    _checkPrefs();
  }

  bool _arePrefsSet;
  bool get arePrefsSet => _arePrefsSet;
  set arePrefsSet(bool prefsSet) {
    _arePrefsSet = prefsSet;
    notifyListeners();
  }

  void _checkPrefs() {
    _authFacade.watchPrefsExistance().listen((prefsOrFailure) {
      prefsOrFailure.fold(
        (_) => arePrefsSet = null,
        (prefs) => arePrefsSet = prefs,
      );
    });
  }

  //* Page Controller

  final PageController controller = PageController();

  //* Region Selector

  final List<String> _categories = [];

  void toggleCategory(String categoryId) {
    hasCategory(categoryId)
        ? _categories.remove(categoryId)
        : _categories.add(categoryId);
    notifyListeners();
  }

  bool hasCategory(String categoryId) => _categories.contains(categoryId);

  //* Category Selector

  List<Region> get countries => _regionApi.countries.values.toList();
  List<Region> get states => _regionApi.states.values.toList();
  List<Region> get regions => _regionApi.regions.values.toList();

  Region _country;
  Region get country => countries.first;
  set country(Region newCountry) {
    if (country != newCountry) {
      _country = newCountry;
      state = null;
      notifyListeners();
    }
  }

  Region _state;
  Region get state => _state;
  set state(Region newState) {
    if (state != newState) {
      _state = newState;
      region = null;
      notifyListeners();
    }
  }

  Region _region;
  Region get region => _region;
  set region(Region newRegion) {
    if (region != newRegion) {
      _region = newRegion;
      notifyListeners();
    }
  }

  //* Submit Preferences

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  Option<Either<RepositoryFailure, Unit>> _prefsFailureOrSuccessOption = none();
  Option<Either<RepositoryFailure, Unit>> get prefsFailureOrSuccessOption =>
      _prefsFailureOrSuccessOption;

  Future setPrefs() async {
    if (!_isSubmitting) {
      _isSubmitting = true;
      _prefsFailureOrSuccessOption = none();
      notifyListeners();

      final userPrefs = UserPrefs(
        categories: _categories,
        region: region.id,
        events: [],
      );
      final failureOrSuccessOption = await _authFacade.createPrefs(userPrefs);

      _isSubmitting = false;
      _prefsFailureOrSuccessOption = some(failureOrSuccessOption);
      notifyListeners();
    }
  }
}

extension ListX on List<Region> {
  List<Region> filteredBy(Region parent) =>
      where((region) => region.parent.id == parent?.id).toList();
}
