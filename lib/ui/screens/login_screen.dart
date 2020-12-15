import 'package:auto_route/auto_route.dart';
import 'package:events/config/constants.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:events/ui/auth/components/alt_sign_in_button.dart';
import 'package:events/ui/widgets/swipe_up.dart';
import 'package:flutter/material.dart';

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
                ),
                InputField(
                  hintText: 'Password',
                  obscureText: true,
                ),
                SubmitButton(
                  text: 'Entrar',
                  onPressed: () =>
                      ExtendedNavigator.root.replace(Routes.regionsScreen), //!
                ),
                Spacer(),
                Text(
                  'ou conecta-te com',
                  style: theme.textTheme.bodyText1.copyWith(
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AltSignInButton.google(
                      onPressed: null, //!
                    ),
                    AltSignInButton.facebook(
                      onPressed: null, //!
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

class SubmitButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const SubmitButton({this.text = '', @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kSubmitVertMargin),
      child: FlatButton(
        height: kFormItemHeight,
        minWidth: double.infinity,
        color: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusBig),
        ),
        onPressed: onPressed,
        child: Text(text, style: theme.textTheme.button),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;

  const InputField({
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      height: kFormItemHeight,
      margin: EdgeInsets.symmetric(vertical: kInputVertMargin),
      padding: EdgeInsets.symmetric(horizontal: kInputHorizPadding),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.onBackground, width: 0),
        borderRadius: BorderRadius.circular(kBorderRadiusBig),
      ),
      child: TextField(
        obscureText: obscureText,
        style: theme.textTheme.bodyText1,
        cursorColor: theme.colorScheme.primary,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.bodyText1,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
