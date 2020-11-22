import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:events/app/palette.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

enum Mode {
  system,
  light,
  dark,
}

class CustomTheme with ChangeNotifier {
  final Map<Mode, ThemeMode> _theme = {
    Mode.system: ThemeMode.system,
    Mode.light: ThemeMode.light,
    Mode.dark: ThemeMode.dark,
  };

  Mode _mode = Mode.system;

  get mode => _theme[_mode];
  set mode(Mode mode) {
    _mode = mode;
    notifyListeners();
  }

  /* to change this in the settings use
   * Provider.of<CustomTheme>(context, listen: false).useDarkMode()
   * listen: false -> because when the theme changes the widget tree already
   * updates because the material widget is already listenning to those changes
   * so here we only need the instance to call the functions
   */

  void useSystemMode() => mode = Mode.system;
  void useLightMode() => mode = Mode.light;
  void useDarkMode() => mode = Mode.dark;

  static void statusBarListener(Window window) {
    _setStatusBarColor(window.platformBrightness);
    window.onPlatformBrightnessChanged = () {
      _setStatusBarColor(window.platformBrightness);
    };
  }

  static void _setStatusBarColor(Brightness brightness) {
    if (brightness == Brightness.light) {
      FlutterStatusbarcolor.setStatusBarColor(kLightSurface);
      // FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    } else if (brightness == Brightness.dark) {
      FlutterStatusbarcolor.setStatusBarColor(kDarkSurface);
      // FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    }
  }

  //! Coment with use cases when used
  TextTheme _textTheme({@required Color onSurface}) {
    FontWeight light = FontWeight.w300;
    FontWeight regular = FontWeight.w400;
    FontWeight medium = FontWeight.w500;

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
      // bodyText1: TextStyle(
      //   // color: onSurface,
      //   fontSize: 16.0,
      //   fontWeight: regular,
      //   letterSpacing: 0.5,
      // ),
      bodyText2: TextStyle(
        //* AppBar Subtitle
        color: onSurface,
        fontSize: 14.0,
        fontWeight: regular,
        letterSpacing: 0.25,
      ),
      // button: TextStyle(
      //   // color: onSurface,
      //   fontSize: 14.0,
      //   fontWeight: medium,
      //   letterSpacing: 1.25,
      // ),
      // caption: TextStyle(
      //   // color: onSurface,
      //   fontSize: 12.0,
      //   fontWeight: regular,
      //   letterSpacing: 0.4,
      // ),
      // overline: TextStyle(
      //   // color: onSurface,
      //   fontSize: 10.0,
      //   fontWeight: regular,
      //   letterSpacing: 1.5,
      // ),
    );
  }

  ThemeData get light => ThemeData.light().copyWith(
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
        ),
      );

  ThemeData get dark => ThemeData.dark().copyWith(
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
        ),
      );
}
