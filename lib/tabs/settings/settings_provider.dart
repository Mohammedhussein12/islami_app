import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';

  bool get isDark => themeMode == ThemeMode.dark;

  void changeThemeMode(ThemeMode selectedThemeMode) {
    themeMode = selectedThemeMode;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguageCode) {
    if (selectedLanguageCode == languageCode) return;
    languageCode = selectedLanguageCode;
    notifyListeners();
  }
}
