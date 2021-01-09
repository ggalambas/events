import 'package:events/domain/auth/i_auth_facade.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AuthModel extends ChangeNotifier {
  final IAuthFacade _authFacade;

  AuthModel(this._authFacade) {
    authCheckRequested();
  }

  bool _isAuthenticated;
  bool get isAuthenticated => _isAuthenticated;
  set isAuthenticated(bool authenticated) {
    _isAuthenticated = authenticated;
    notifyListeners();
  }

  void authCheckRequested() {
    final userOption = _authFacade.getSignedInUser();
    userOption.fold(
      () => isAuthenticated = false,
      (_) => isAuthenticated = true,
    );
  }

  // Future signedOut() async {
  //   await _authFacade.signOut();
  //   _unauthenticated();
  // }
}
