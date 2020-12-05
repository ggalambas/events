import 'package:flutter/material.dart';

// Light Mode

ColorScheme lightPallete = ColorScheme(
  primary: Colors.deepPurpleAccent,
  primaryVariant: Color(0xFF6200EA), // deepPurpleAccent[700]
  secondary: Color(0xFF00E5FF),
  secondaryVariant: Color(0xFF00B8D4),
  surface: Colors.white,
  background: Color(0xFFE8EAED),
  error: Color(0xFFFF1744),
  onPrimary: Colors.white,
  onSecondary: Colors.black,
  onSurface: Color(0xFF202124),
  onBackground: Color(0xFF5F6368),
  onError: Colors.white,
  brightness: Brightness.light,
);

// Dark Mode

ColorScheme darkPallete = ColorScheme(
  primary: Color(0xFF7C4DFF), // deepPurpleAccent[200]
  primaryVariant: Color(0xFF6200EA), // deepPurpleAccent[700]
  secondary: Color(0xFF18FFFF),
  secondaryVariant: Color(0xFF18FFFF), // same as secondary
  surface: Color(0xFF202124),
  background: Color(0xFF303134),
  error: Color(0xFFFF5252),
  onPrimary: Colors.black,
  onSecondary: Colors.black,
  onSurface: Color(0xFFE8EAED),
  onBackground: Color(0xFF9AA0A6),
  onError: Colors.black,
  brightness: Brightness.dark,
);
