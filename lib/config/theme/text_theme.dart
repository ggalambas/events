import 'package:flutter/material.dart';

TextTheme textTheme({
  @required Color onSurface,
  @required Color onPrimary,
  @required Color onBackground,
}) {
  // final FontWeight light = FontWeight.w300;
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
      fontSize: 10.0,
      fontWeight: regular,
      letterSpacing: 1.5,
    ),
  );
}
