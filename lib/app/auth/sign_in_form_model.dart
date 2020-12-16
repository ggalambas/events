// import 'package:dartz/dartz.dart';
// import 'package:flutter/foundation.dart';

// class SignInFormModel extends ChangeNotifier {
//   final IAuthFacade _authFacade;

//   SignInFormModel(this._authFacade);

//   EmailAdress _emailAdress = EmailAdress('');
//   EmailAdress get emailAdress => _emailAdress;
//   set emailAdress(String email) {
//     _emailAdress = EmailAdress(email);
//     _authFailureOrSuccessOption = none();
//     notifyListeners();
//   }

//   Password _password = Password('');
//   Password get password => _password;
//   set password(String pass) {
//     _password = Password(pass);
//     _authFailureOrSuccessOption = none();
//     notifyListeners();
//   }

//   bool _showErrorMessages = false;
//   bool get showErrorMessages => _showErrorMessages;

//   bool _isSubmitting = false;
//   bool get isSubmitting => _isSubmitting;

//   Option<Either<AuthFailure, Unit>> _authFailureOrSuccessOption = none();
//   Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption =>
//       _authFailureOrSuccessOption;

//   Future signInWithEmailAndPassword() async {
//     __actionWithEmailAndPassword(_authFacade.signInWithEmailAndPassword);
//   }

//   Future registerWithEmailAndPassword() async {
//     __actionWithEmailAndPassword(_authFacade.registerWithEmailAndPassword);
//   }

//   Future _actionWithEmailAndPassword() async* {
//     if (!_isSubmitting) {
//       Either<AuthFailure, Unit> failureOrSuccess;

//       if (_emailAdress.isValid() && _password.isValid()) {
//         _isSubmitting = true;
//         _authFailureOrSuccessOption = none();
//         notifyListeners();

//         failureOrSuccess = await forwardedCall(
//           emailAdress: _emailAdress,
//           password: _password,
//         );
//       }

//       _isSubmitting = false;
//       _showErrorMessages = true;
//       _authFailureOrSuccessOption = optionOf(failureOrSuccess);
//       notifyListeners();
//     }
//   }

//   Future signInWithGoogle() async* {
//     if (!_isSubmitting) {
//       _isSubmitting = true;
//       _authFailureOrSuccessOption = none();
//       notifyListeners();

//       final failureOrSuccess = await _authFacade.signInWithGoogle();

//       _isSubmitting = false;
//       _authFailureOrSuccessOption = some(failureOrSuccess);
//       notifyListeners();
//     }
//   }
// }
