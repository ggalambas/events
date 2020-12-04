import 'package:flutter/material.dart';

enum Load { inProgress, success, failure }

extension LoadX on Load {
  Widget map({
    @required Widget inProgress,
    @required Widget success,
    @required Widget failure,
  }) {
    switch (this) {
      case Load.success:
        return success;
        break;
      case Load.failure:
        return failure;
        break;
      case Load.inProgress:
      default:
        return inProgress;
    }
  }
}

class BaseModel extends ChangeNotifier {
  // final AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();

  // User get currentUser => _authenticationService.currentUser;

  Load _load = Load.inProgress;
  Load get load => _load;
  set load(Load load) {
    _load = load;
    notifyListeners();
  }

  void loadInProgress() => load = Load.inProgress;
  void loadFailure() => load = Load.failure;
  void loadSuccess() => load = Load.success;
}
