import 'package:auto_route/auto_route.dart';
import 'package:events/config/constants.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class LoginScreen extends StatelessWidget {
  // TODO: Change notification bar text color
  //? to match the onPrimary color in this page

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primaryVariant,
          ],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false, //!
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            // TODO: Swap with logo or app name
            Container(
              height: 200,
              color: theme.colorScheme.primary,
              child: Center(
                  child: Text('Eventos', style: theme.textTheme.headline3)),
            ),
            Spacer(flex: 3),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(kBorderRadiusBig),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    style: TextStyle(color: theme.colorScheme.onSurface),
                    cursorColor: theme.colorScheme.primary,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'email',
                      hintStyle: TextStyle(
                        color: theme.colorScheme.onBackground,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(kBorderRadiusBig),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    obscureText: true, //!
                    style: TextStyle(color: theme.colorScheme.onSurface),
                    cursorColor: theme.colorScheme.primary,
                    keyboardType: TextInputType.text, //!
                    decoration: InputDecoration(
                      hintText: 'password', //!
                      hintStyle: TextStyle(
                        color: theme.colorScheme.onBackground,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                FlatButton(
                  height: 40,
                  minWidth: 300,
                  onPressed: () {},
                  color: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadiusBig),
                  ),
                  child: Text('Entrar', style: theme.textTheme.button),
                ),
              ],
            ),
            Spacer(flex: 3),
            Column(
              children: [
                Text(
                  'ou conecta-te com',
                  style: theme.textTheme.bodyText1.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Google',
                      style: theme.textTheme.bodyText2.copyWith(
                        color: Colors.redAccent,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Facebook',
                      style: theme.textTheme.bodyText2.copyWith(
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(flex: 6),
            GestureDetector(
              onTap: () => ExtendedNavigator.root.push(Routes.registerScreen),
              child: Column(
                children: [
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: theme.colorScheme.onPrimary,
                  ),
                  Text(
                    "Ainda não criaste a tua conta? Regista-te.",
                    style: theme.textTheme.bodyText1.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
