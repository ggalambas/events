import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:events/app/auth/sign_in_form_model.dart';
import 'package:events/config/constants.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:events/domain/auth/auth_failure.dart';
import 'package:events/ui/auth/components/alt_sign_in_button.dart';
import 'package:events/ui/auth/components/input_field.dart';
import 'package:events/ui/auth/components/sign_in_error.dart';
import 'package:events/ui/auth/components/submit_button.dart';
import 'package:events/ui/widgets/swipe_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:events/config/routes/router.gr.dart';

//TODO
//* 1. Auth
//* 2. Forgot password
//* 3. unfocus textfield when clicking outside
//* 4. input validation style
//* 5. failure messages
//* 6. flushbar style
//* 7. loading
//* 8. enter button

class LoginScreen extends StatelessWidget {
  void _showError(
    BuildContext context,
    Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  ) =>
      showError(
        context,
        authFailureOrSuccessOption,
        () => ExtendedNavigator.root.replace(Routes.regionsScreen),
      );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SignInFormModel signInForm = Provider.of<SignInFormModel>(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: kFormHorizPadding),
          child: SafeArea(
            child: Form(
              autovalidateMode: signInForm.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Column(
                children: [
                  Expanded(
                    flex: 20,
                    child: Center(
                      child: Container(
                        height: 72,
                        width: 72,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  InputField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: signInForm.emailChanged,
                    validator: (_) => signInForm.emailValidated(
                      invalidEmail: 'Invalid Email',
                    ),
                  ),
                  InputField(
                    hintText: 'Palavra passe',
                    obscureText: true,
                    onChanged: signInForm.passwordChanged,
                    validator: (_) => signInForm.passwordValidated(
                      shortPassword: 'Short Password',
                    ),
                  ),
                  SubmitButton(
                    text: 'Entrar',
                    onPressed: () async {
                      await signInForm.signInWithEmailAndPassword();
                      _showError(
                          context, signInForm.authFailureOrSuccessOption);
                    },
                  ),
                  Text(
                    'Esqueceu-se da palava passe?', //! 2
                    style: theme.textTheme.caption,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(flex: 2),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kFormCaptionPadding),
                    child: Text(
                      'ou conecta-te com',
                      style: theme.textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AltSignInButton.google(
                        onPressed: () async {
                          await signInForm.signInWithGoogle();
                          _showError(
                              context, signInForm.authFailureOrSuccessOption);
                        },
                      ),
                      AltSignInButton.facebook(
                        onPressed: () async {
                          await signInForm.signInWithFacebook();
                          _showError(
                              context, signInForm.authFailureOrSuccessOption);
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  SwipeUp(
                    'Ainda não criaste a tua conta? Regista-te',
                    onSwipe: () =>
                        ExtendedNavigator.root.push(Routes.registerScreen),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
