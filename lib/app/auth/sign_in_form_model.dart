import 'package:dartz/dartz.dart';
import 'package:events/domain/auth/auth_failure.dart';
import 'package:events/domain/auth/i_auth_facade.dart';
import 'package:events/domain/auth/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SignInFormModel extends ChangeNotifier {
  final IAuthFacade _authFacade;

  SignInFormModel(this._authFacade);

  String _name = '';
  EmailAddress _emailAddress = EmailAddress('');
  Password _password = Password('');

  void nameChanged(String name) {
    _name = name;
    _authFailureOrSuccessOption = none();
    notifyListeners();
  }

  void emailChanged(String email) {
    _emailAddress = EmailAddress(email);
    _authFailureOrSuccessOption = none();
    notifyListeners();
  }

  void passwordChanged(String pass) {
    _password = Password(pass);
    _authFailureOrSuccessOption = none();
    notifyListeners();
  }

  String emailValidated({String invalidEmail}) => _emailAddress.value.fold(
        (f) => f.maybeMap(
          invalidEmail: (_) => invalidEmail,
          orElse: () => null,
        ),
        (_) => null,
      );

  String passwordValidated({String shortPassword}) => _password.value.fold(
        (f) => f.maybeMap(
          shortPassword: (_) => shortPassword,
          orElse: () => null,
        ),
        (_) => null,
      );

  bool _showErrorMessages = false;
  bool get showErrorMessages => _showErrorMessages;

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  Option<Either<AuthFailure, Unit>> _authFailureOrSuccessOption = none();
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
      _authFailureOrSuccessOption;

  Future registerWithEmailAndPassword() async =>
      _actionWithEmailAndPassword(register: true);

  Future signInWithEmailAndPassword() async => _actionWithEmailAndPassword();

  Future signInWithGoogle() async =>
      _actionWithAltSignIn(_authFacade.signInWithGoogle);

  Future signInWithFacebook() async =>
      _actionWithAltSignIn(_authFacade.signInWithFacebook);

  Future _actionWithEmailAndPassword({bool register = false}) async {
    if (!_isSubmitting) {
      Either<AuthFailure, Unit> failureOrSuccess;

      if (_emailAddress.isValid() && _password.isValid()) {
        _isSubmitting = true;
        _authFailureOrSuccessOption = none();
        notifyListeners();

        failureOrSuccess = register
            ? await _authFacade.registerWithEmailAndPassword(
                emailAddress: _emailAddress,
                password: _password,
                name: _name,
              )
            : await _authFacade.signInWithEmailAndPassword(
                emailAddress: _emailAddress,
                password: _password,
              );
      }

      _isSubmitting = false;
      _showErrorMessages = true;
      _authFailureOrSuccessOption = optionOf(failureOrSuccess);
      notifyListeners();
    }
  }

  Future _actionWithAltSignIn(
    Future<Option<Either<AuthFailure, Unit>>> Function() forwardedCall,
  ) async {
    if (!_isSubmitting) {
      _isSubmitting = true;
      _authFailureOrSuccessOption = none();
      notifyListeners();

      final failureOrSuccessOption = await forwardedCall();

      _isSubmitting = false;
      _authFailureOrSuccessOption = failureOrSuccessOption;
      notifyListeners();
    }
  }
}
