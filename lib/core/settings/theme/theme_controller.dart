import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_note_app/core/settings/preferences/preferences.dart';
import 'package:todo_note_app/core/settings/theme/todo_theme.dart';

class ThemeController extends StateNotifier<TodoTheme> {
  ThemeController(super.state);

  Future<void> toggleDarkMode() async {
    Preferences.saveThemeBrightness(!state.isDark);
    state = state.copyWith(isDark: Preferences.getThemeBrightness);
  }
}

final themeProvider = StateNotifierProvider<ThemeController, TodoTheme>(
    (ref) => ThemeController(TodoTheme(colorSeed: Colors.indigo, isDark: Preferences.getThemeBrightness)));
