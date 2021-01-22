import 'package:dartz/dartz.dart';
import 'package:events/domain/auth/auth_failure.dart';
import 'package:events/domain/auth/i_auth_facade.dart';
import 'package:events/domain/regions/i_region_api.dart';
import 'package:events/domain/regions/region.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

extension ListX on List<Region> {
  List<Region> filteredBy(Region parent) =>
      where((region) => region.parent.id == parent?.id).toList();
}

@Injectable()
class OverviewModel extends ChangeNotifier {
  final IAuthFacade _authFacade;
  final IRegionApi _regionApi;

  OverviewModel(this._authFacade, this._regionApi);

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
    if (_country != newCountry) {
      _country = newCountry;
      _state = null;
      notifyListeners();
    }
  }

  Region _state;
  Region get state => _state;
  set state(Region newState) {
    if (_state != newState) {
      _state = newState;
      _region = null;
      notifyListeners();
    }
  }

  Region _region;
  Region get region => _region;
  set region(Region newRegion) {
    if (_region != newRegion) {
      _region = newRegion;
      notifyListeners();
    }
  }

  //* SUBMMIT

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  // Option<Either<AuthFailure, Unit>> _authFailureOrSuccessOption = none();
  // Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
  //     _authFailureOrSuccessOption;

  // Future registerWithEmailAndPassword() async =>
  //     _actionWithEmailAndPassword(register: true);

  // Future signInWithEmailAndPassword() async => _actionWithEmailAndPassword();

  // Future _actionWithEmailAndPassword({bool register = false}) async {
  //   if (!_isSubmitting) {
  //     Either<AuthFailure, Unit> failureOrSuccess;

  //     if (_emailAddress.isValid() && _password.isValid()) {
  //       _isSubmitting = true;
  //       _authFailureOrSuccessOption = none();
  //       notifyListeners();

  //       failureOrSuccess = register
  //           ? await _authFacade.registerWithEmailAndPassword(
  //               emailAddress: _emailAddress,
  //               password: _password,
  //               name: _name,
  //             )
  //           : await _authFacade.signInWithEmailAndPassword(
  //               emailAddress: _emailAddress,
  //               password: _password,
  //             );
  //     }

  //     _isSubmitting = false;
  //     _showErrorMessages = true;
  //     _authFailureOrSuccessOption = optionOf(failureOrSuccess);
  //     notifyListeners();
  //   }
  // }
}
