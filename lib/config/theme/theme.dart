import 'package:events/config/theme/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData theme(ColorScheme colorScheme) => ThemeData(
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      canvasColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        color: colorScheme.surface,
        brightness: colorScheme.brightness,
        iconTheme: IconThemeData(
          color: colorScheme.onSurface,
        ),
      ),
      scaffoldBackgroundColor: colorScheme.background,
      textTheme: textTheme(
        onSurface: colorScheme.onSurface,
        onPrimary: colorScheme.onPrimary,
        onBackground: colorScheme.onBackground,
      ),
      dividerTheme: DividerThemeData(
        space: 0.0,
        indent: 12.0,
        endIndent: 12.0,
      ),
    );
