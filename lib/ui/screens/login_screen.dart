import 'package:auto_route/auto_route.dart';
import 'package:events/config/constants.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:events/ui/auth/components/alt_sign_in_button.dart';
import 'package:events/ui/auth/components/input_field.dart';
import 'package:events/ui/auth/components/submit_button.dart';
import 'package:events/ui/widgets/swipe_up.dart';
import 'package:flutter/material.dart';

//TODO
//* 1. Auth
//* 2. Forgot password

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: kFormHorizPadding),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 10,
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
                ),
                InputField(
                  hintText: 'Palavra passe',
                  obscureText: true,
                ),
                SubmitButton(
                  text: 'Entrar',
                  onPressed: () => ExtendedNavigator.root
                      .replace(Routes.regionsScreen), //! 1
                ),
                Text(
                  'Esqueceu-se da palava passe?',
                  style: theme.textTheme.caption,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
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
                      onPressed: null, //! 1
                    ),
                    AltSignInButton.facebook(
                      onPressed: null, //! 1
                    ),
                  ],
                ),
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
    );
  }
}
