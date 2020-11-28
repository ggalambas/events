import 'package:events/config/theme/divider_theme.dart';
import 'package:events/config/theme/palette.dart';
import 'package:events/config/theme/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
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
  canvasColor: kLightSurface,
  appBarTheme: AppBarTheme(
    color: kLightSurface,
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: kLightOnSurface,
    ),
  ),
  scaffoldBackgroundColor: kLightBackground,
  textTheme: textTheme(
    onSurface: kLightOnSurface,
    onPrimary: kLightOnPrimary,
    onBackground: kLightOnBackground,
  ),
  dividerTheme: dividerTheme,
);
