import 'package:flutter/material.dart';

TextTheme textTheme({
  @required Color onSurface,
  @required Color onPrimary,
  @required Color onBackground,
}) {
  final FontWeight light = FontWeight.w300;
  final FontWeight regular = FontWeight.w400;
  final FontWeight medium = FontWeight.w500;

  return TextTheme(
    headline1: TextStyle(
      //* SplashScreen > app name
      color: onBackground,
      fontSize: 14.0, // 96.0
      fontWeight: light, // light
      letterSpacing: 1.5, // -1.5
    ),
    // headline2: TextStyle(
    //   color: onSurface,
    //   fontSize: 60.0,
    //   fontWeight: light,
    //   letterSpacing: -0.5,
    // ),
    headline3: TextStyle(
      //* RegisterScreen > title
      color: onSurface,
      fontSize: 48.0,
      fontWeight: regular,
      letterSpacing: 0.0,
    ),
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
      fontSize: 20.0, // 20.0
      fontWeight: medium, // medium
      letterSpacing: 0.15, // 0.15
    ),
    subtitle1: TextStyle(
      //* AppBar subtitle
      color: onSurface,
      fontSize: 12.0, // 16.0
      fontWeight: regular, // regular
      letterSpacing: 0.15, // 0.15
    ),
    subtitle2: TextStyle(
      //* List Subtitles
      color: onBackground,
      fontSize: 10.0, // 14.0
      fontWeight: regular, // medium
      letterSpacing: 1.5, // 0.1
    ),
    bodyText1: TextStyle(
      //* List Item > title
      color: onSurface,
      fontSize: 14.0, // 16
      fontWeight: regular, // regular
      letterSpacing: 0.5, // 0.5
    ),
    bodyText2: TextStyle(
      //* Event Counter
      //* List Item > leading
      color: onSurface,
      fontSize: 14.0, // 14.0
      fontWeight: medium, // regular
      letterSpacing: 0.25, // 0.25
    ),
    button: TextStyle(
      //* Calendar Buttons
      color: onPrimary,
      fontSize: 14.0, // 14.0
      fontWeight: medium, // medium
      letterSpacing: 0.25, // 1.25
    ),
    caption: TextStyle(
      //* Login/Register text after button
      color: onBackground,
      fontSize: 12.0, // 12.0
      fontWeight: regular, // regular
      letterSpacing: 0.4, // 0.4
    ),
    overline: TextStyle(
      //* AppBar > week days, month(size: 12)
      color: onBackground,
      fontSize: 10.0, // 10.0
      fontWeight: regular, // regular
      letterSpacing: 1.5, // 1.5
    ),
  );
}
