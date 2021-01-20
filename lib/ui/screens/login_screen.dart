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
import 'package:events/ui/auth/sign_in_scaffold.dart';
import 'package:events/ui/widgets/swipe_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO
//* 1. Terms and Conditions
//* 2. Forgot password
//* 3. skip sign in if already logged in
//* 4. input validation style

//* NEXT email verification screen
//* https://firebase.flutter.dev/docs/auth/usage/#verifying-a-users-email

class LoginScreen extends StatelessWidget {
  void _showError(
    BuildContext context,
    Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  ) =>
      showError(
        context,
        authFailureOrSuccessOption,
        () => ExtendedNavigator.root.replace(Routes.overviewScreen), //!
      );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SignInFormModel signInForm = Provider.of<SignInFormModel>(context);
    return SignInScaffold(
      onSkip: () async {
        await signInForm.signInAnonymously();
        _showError(context, signInForm.authFailureOrSuccessOption);
      },
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
            textInputAction: TextInputAction.next,
          ),
          InputField(
            hintText: 'Palavra passe',
            obscureText: true,
            onChanged: signInForm.passwordChanged,
            validator: (_) => signInForm.passwordValidated(
              shortPassword: 'Short Password',
            ),
            textInputAction: TextInputAction.done,
          ),
          SubmitButton(
            text: 'Entrar',
            onPressed: () async {
              await signInForm.signInWithEmailAndPassword();
              _showError(context, signInForm.authFailureOrSuccessOption);
            },
          ),
          Text(
            'Esqueceu-se da palava passe?', //! 2
            style: theme.textTheme.caption,
            textAlign: TextAlign.center,
          ),
          Spacer(flex: 2),
          Text(
            'ou conecta-te com',
            style: theme.textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kAltVertMargin,
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: kAltSpacing,
              runSpacing: kAltRunSpacing,
              children: [
                AltSignInButton.google(
                  onPressed: () async {
                    await signInForm.signInWithGoogle();
                    _showError(context, signInForm.authFailureOrSuccessOption);
                  },
                ),
                AltSignInButton.facebook(
                  onPressed: () async {
                    await signInForm.signInWithFacebook();
                    _showError(context, signInForm.authFailureOrSuccessOption);
                  },
                ),
              ],
            ),
          ),
          Spacer(),
          SwipeUp(
            onSwipe: () => ExtendedNavigator.root.push(Routes.registerScreen),
            child: Text(
              'Ainda não criaste a tua conta? Regista-te',
              style: theme.textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
