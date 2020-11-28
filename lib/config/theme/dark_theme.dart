import 'package:events/config/theme/divider_theme.dart';
import 'package:events/config/theme/palette.dart';
import 'package:events/config/theme/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme(
    primary: kDarkPrimary,
    primaryVariant: kDarkPrimaryVariant,
    secondary: kDarkSecondary,
    secondaryVariant: kDarktSecondaryVariant,
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
  canvasColor: kDarkSurface,
  appBarTheme: AppBarTheme(
    color: kDarkSurface,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(
      color: kDarkOnSurface,
    ),
  ),
  scaffoldBackgroundColor: kDarkBackground,
  textTheme: textTheme(
    onSurface: kDarkOnSurface,
    onPrimary: kDarkOnPrimary,
    onBackground: kDarkOnBackground,
  ),
  dividerTheme: dividerTheme,
);
