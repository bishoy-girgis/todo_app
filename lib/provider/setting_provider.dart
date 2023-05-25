import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLocal = "en";
  bool isDone = true;

  void changeTheme(ThemeMode newMode) {
    if (newMode == currentTheme) return;

    currentTheme = newMode;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  String getThemeName() {
    return currentTheme == ThemeMode.dark ? "Dark" : "Light";
  }

  void changeLocal(String newLocal) {
    if (newLocal == currentLocal) return;
    currentLocal = newLocal;
    notifyListeners();
  }
}
