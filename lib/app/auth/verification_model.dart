import 'package:events/domain/auth/i_auth_facade.dart';
import 'package:events/domain/auth/user.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AuthModel extends ChangeNotifier {
  final IAuthFacade _authFacade;

  AuthModel(this._authFacade) {
    _authCheck();
  }

  User signedInUser;

  bool _isAuthenticated;
  bool get isAuthenticated => _isAuthenticated;
  set isAuthenticated(bool authenticated) {
    _isAuthenticated = authenticated;
    notifyListeners();
  }

  void _authCheck() {
    _authFacade.authStateChanges().listen((userOption) => userOption.fold(
          () => isAuthenticated = false,
          (user) {
            signedInUser = user;
            isAuthenticated = true;
          },
        ));
  }

  Future signedOut() async {
    await _authFacade.signOut();
  }
}
