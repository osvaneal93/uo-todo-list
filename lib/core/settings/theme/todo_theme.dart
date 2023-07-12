import 'package:flutter/material.dart';

class TodoTheme {
  final Color colorSeed;
  final bool isDark;

  TodoTheme({required this.colorSeed, required this.isDark});

  ThemeData getThemeData() {
    return ThemeData(
      colorSchemeSeed: colorSeed,
      brightness: isDark ? Brightness.dark : Brightness.light,
      useMaterial3: true,
    );
  }

  TodoTheme copyWith({Color? colorSeed, bool? isDark}) =>
      TodoTheme(colorSeed: colorSeed ?? this.colorSeed, isDark: isDark ?? this.isDark);
}
