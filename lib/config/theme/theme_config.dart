import 'dart:ui';
import 'package:events/config/theme/dark_theme.dart';
import 'package:events/config/theme/light_theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class ThemeConfig with ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;
  set mode(ThemeMode newMode) {
    _mode = newMode;
    notifyListeners();
  }

  ThemeData get light => lightTheme;
  ThemeData get dark => darkTheme;

  /* to change this in the settings use
   * Provider.of<ThemeConfig>(context, listen: false).useDarkMode()
   * listen: false -> because when the theme changes the widget tree already
   * updates because the material widget is already listenning to those changes
   * so here we only need the instance to call the functions
   */

  void useSystemMode() => mode = ThemeMode.system;
  void useLightMode() => mode = ThemeMode.light;
  void useDarkMode() => mode = ThemeMode.dark;

  // TODO: [Bug] status bar desappears when unlocking the screen
  static void statusBarListener(Window window) {
    _setStatusBarColor(window.platformBrightness);
    // window.onPlatformBrightnessChanged = () {
    //   _setStatusBarColor(window.platformBrightness);
    // };
  }

  static void _setStatusBarColor(Brightness brightness) {
    // if (brightness == Brightness.light) {
    //   FlutterStatusbarcolor.setStatusBarColor(kLightSurface);
    //   FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    // } else if (brightness == Brightness.dark) {
    //   FlutterStatusbarcolor.setStatusBarColor(kDarkSurface);
    //   FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    // }
  }
}
