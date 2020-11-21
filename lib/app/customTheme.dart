import 'package:flutter/material.dart';
import 'package:events/app/palette.dart';

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
