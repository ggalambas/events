import 'dart:ui';
import 'package:events/config/theme/dark_theme.dart';
import 'package:events/config/theme/light_theme.dart';
import 'package:events/config/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

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

  static void statusBarListener(Window window) {
    _setSystemBarsColors(window.platformBrightness);
    window.onPlatformBrightnessChanged = () {
      _setSystemBarsColors(window.platformBrightness);
    };
  }

  static void _setSystemBarsColors(Brightness brightness) {
    if (brightness == Brightness.light) {
      _setStatusBarColor(Colors.transparent, false);
      _setNavigationBarColor(kLightSurface, false);
    } else if (brightness == Brightness.dark) {
      _setStatusBarColor(Colors.transparent, true);
      _setNavigationBarColor(kDarkSurface, true);
    }
  }

  static void _setStatusBarColor(Color color, bool whiteForeground) {
    FlutterStatusbarcolor.setStatusBarColor(color);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(whiteForeground);
  }

  static void _setNavigationBarColor(Color color, bool whiteForeground) {
    FlutterStatusbarcolor.setNavigationBarColor(color);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(whiteForeground);
  }
}
