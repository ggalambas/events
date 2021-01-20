import 'package:events/domain/auth/i_auth_facade.dart';
import 'package:events/domain/auth/user.dart';
import 'package:events/domain/core/errors.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AuthModel extends ChangeNotifier {
  final IAuthFacade _authFacade;

  //TODO
  //* notify listeners when is not authenticated and navigate to login screen
  //* on login screen dont navigate to regions screen
  //* listen to changes on here to do that navigation

  AuthModel(this._authFacade) {
    _authCheckRequested();
  }

  User _user;
  String get name => _user.name;
  String get email => _user.email.getOrCrash();

  void setUser() {
    _user = _authFacade
        .getSignedInUser()
        .getOrElse(() => throw NotAuthenticatedError());
  }

  bool _isAuthenticated;
  bool get isAuthenticated => _isAuthenticated;
  set isAuthenticated(bool authenticated) {
    _isAuthenticated = authenticated;
    notifyListeners(); //!
  }

  void _authCheckRequested() {
    final userOption = _authFacade.getSignedInUser();
    userOption.fold(
      () => isAuthenticated = false,
      (user) {
        _user = user;
        isAuthenticated = true;
      },
    );
  }

  Future signedOut() async {
    await _authFacade.signOut();
    isAuthenticated = false;
  }
}
