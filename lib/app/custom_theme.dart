import 'package:flutter/material.dart';
import 'package:events/app/palette.dart';

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

  ThemeData light = ThemeData.light().copyWith(
    primaryColor: kLightPrimary,
    appBarTheme: AppBarTheme(
      color: kLightSurface,
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: kLightOnSurface,
      ),
    ),
    scaffoldBackgroundColor: kLightBackground,
  );

  ThemeData dark = ThemeData.dark();
}
