import 'package:events/config/theme/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData theme(ColorScheme colorScheme) => ThemeData(
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      accentColor: colorScheme.secondary,
      canvasColor: colorScheme.surface,
      backgroundColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.background,
      cursorColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        color: colorScheme.surface,
        brightness: colorScheme.brightness,
        iconTheme: IconThemeData(
          color: colorScheme.onSurface,
        ),
      ),
      textTheme: textTheme(
        onSurface: colorScheme.onSurface,
        onPrimary: colorScheme.onPrimary,
        onBackground: colorScheme.onBackground,
      ),
      iconTheme: IconThemeData(
        color: colorScheme.onSurface,
      ),
      dividerTheme: DividerThemeData(
        space: 0.0,
        indent: 12.0,
        endIndent: 12.0,
      ),
    );
