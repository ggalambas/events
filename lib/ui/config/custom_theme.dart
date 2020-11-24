import 'dart:ui';

import 'package:events/ui/config/palette.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class CustomTheme with ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;
  set mode(ThemeMode newMode) {
    _mode = newMode;
    notifyListeners();
  }

  /* to change this in the settings use
   * Provider.of<CustomTheme>(context, listen: false).useDarkMode()
   * listen: false -> because when the theme changes the widget tree already
   * updates because the material widget is already listenning to those changes
   * so here we only need the instance to call the functions
   */

  void useSystemMode() => mode = ThemeMode.system;
  void useLightMode() => mode = ThemeMode.light;
  void useDarkMode() => mode = ThemeMode.dark;

  static void statusBarListener(Window window) {
    _setStatusBarColor(window.platformBrightness);
    window.onPlatformBrightnessChanged = () {
      _setStatusBarColor(window.platformBrightness);
    };
  }

  // TODO: [Bug] status bar desappears when unlocking screen
  static void _setStatusBarColor(Brightness brightness) {
    // if (brightness == Brightness.light) {
    //   FlutterStatusbarcolor.setStatusBarColor(kLightSurface);
    //   FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    // } else if (brightness == Brightness.dark) {
    //   FlutterStatusbarcolor.setStatusBarColor(kDarkSurface);
    //   FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    // }
  }

  ThemeData get light => ThemeData.light().copyWith(
        colorScheme: ColorScheme(
          primary: kLightPrimary,
          primaryVariant: kLightPrimaryVariant,
          secondary: kLightSecondary,
          secondaryVariant: kLightSecondaryVariant,
          surface: kLightSurface,
          background: kLightBackground,
          error: kLightError,
          onPrimary: kLightOnPrimary,
          onSecondary: kLightOnSecondary,
          onSurface: kLightOnSurface,
          onBackground: kLightOnBackground,
          onError: kLightOnError,
          brightness: Brightness.light,
        ),
        primaryColor: kLightPrimary,
        appBarTheme: AppBarTheme(
          color: kLightSurface,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: kLightOnSurface,
          ),
        ),
        scaffoldBackgroundColor: kLightBackground,
        textTheme: _textTheme(
          onSurface: kLightOnSurface,
          onPrimary: kLightOnPrimary,
          onBackground: kLightOnBackground,
        ),
      );

  ThemeData get dark => ThemeData.dark().copyWith(
        colorScheme: ColorScheme(
          primary: kDarkPrimary,
          primaryVariant: kDarkPrimaryVariant,
          secondary: kDarkSecondary,
          secondaryVariant: kDarkSecondary,
          surface: kDarkSurface,
          background: kDarkBackground,
          error: kDarkError,
          onPrimary: kDarkOnPrimary,
          onSecondary: kDarkOnSecondary,
          onSurface: kDarkOnSurface,
          onBackground: kDarkOnBackground,
          onError: kDarkOnError,
          brightness: Brightness.dark,
        ),
        primaryColor: kDarkPrimary,
        appBarTheme: AppBarTheme(
          color: kDarkSurface,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(
            color: kDarkOnSurface,
          ),
        ),
        scaffoldBackgroundColor: kDarkBackground,
        textTheme: _textTheme(
          onSurface: kDarkOnSurface,
          onPrimary: kDarkOnPrimary,
          onBackground: kDarkOnBackground,
        ),
      );

//! Coment with use cases when used
  TextTheme _textTheme({
    @required Color onSurface,
    @required Color onPrimary,
    @required Color onBackground,
  }) {
    final FontWeight light = FontWeight.w300;
    final FontWeight regular = FontWeight.w400;
    final FontWeight medium = FontWeight.w500;

    return TextTheme(
      // headline1: TextStyle(
      //   // color: onSurface,
      //   fontSize: 96.0,
      //   fontWeight: light,
      //   letterSpacing: -1.5,
      // ),
      // headline2: TextStyle(
      //   // color: onSurface,
      //   fontSize: 60.0,
      //   fontWeight: light,
      //   letterSpacing: -0.5,
      // ),
      // headline3: TextStyle(
      //   // color: onSurface,
      //   fontSize: 48.0,
      //   fontWeight: regular,
      //   letterSpacing: 0.0,
      // ),
      // headline4: TextStyle(
      //   // color: onSurface,
      //   fontSize: 34.0,
      //   fontWeight: regular,
      //   letterSpacing: 0.25,
      // ),
      // headline5: TextStyle(
      //   // color: onSurface,
      //   fontSize: 24.0,
      //   fontWeight: regular,
      //   letterSpacing: 0.0,
      // ),
      headline6: TextStyle(
        //* AppBar Title
        color: onSurface,
        fontSize: 20.0,
        fontWeight: medium,
        letterSpacing: 0.15,
      ),
      // subtitle1: TextStyle(
      //   // color: onSurface,
      //   fontSize: 16.0,
      //   fontWeight: regular,
      //   letterSpacing: 0.15,
      // ),
      // subtitle2: TextStyle(
      //   // color: onSurface,
      //   fontSize: 14.0,
      //   fontWeight: medium,
      //   letterSpacing: 0.1,
      // ),
      bodyText1: TextStyle(
        //* List Items
        color: onSurface,
        fontSize: 14.0, //default: 16
        fontWeight: regular,
        letterSpacing: 0.5,
      ),
      bodyText2: TextStyle(
        //* Event Counter
        color: onSurface,
        fontSize: 14.0,
        fontWeight: medium, //default: regular
        letterSpacing: 0.25,
      ),
      button: TextStyle(
        //* Calendar Buttons
        color: onPrimary,
        fontSize: 14.0,
        fontWeight: medium,
        letterSpacing: 0.25, //default: 1.25
      ),
      caption: TextStyle(
        //* AppBar Subtitle
        color: onSurface,
        fontSize: 12.0,
        fontWeight: regular,
        letterSpacing: 0.4,
      ),
      overline: TextStyle(
        //* Week days
        //* Month
        color: onBackground,
        fontSize: 12.0, //default: 10.0
        fontWeight: regular,
        letterSpacing: 1.5,
      ),
    );
  }
}
