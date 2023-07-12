import 'package:hive_flutter/adapters.dart';

class Preferences {
  static final _preferencesBox = Hive.box('p');
  static void saveThemeBrightness(bool isDark) {
    _preferencesBox.put('isDark', isDark);
  }

  static bool get getThemeBrightness {
    Hive.openBox('p');
    return _preferencesBox.get("isDark") ?? true;
  }
}
