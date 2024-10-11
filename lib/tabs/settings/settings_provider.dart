import 'package:flutter/material.dart';
import 'package:islami/cache/cache_helper.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';

  bool get isDark => themeMode == ThemeMode.dark;

  SettingsProvider() {
    loadSettings();
  }

  void loadSettings() {
    String? savedLanguage = CacheData.getData(key: 'LanguageCode');
    if (savedLanguage != null) {
      languageCode = savedLanguage;
    }
    String? savedTheme = CacheData.getData(key: 'ThemeMode');
    if (savedTheme != null) {
      if (savedTheme == 'dark') {
        themeMode = ThemeMode.dark;
      } else if (savedTheme == 'light') {
        themeMode = ThemeMode.light;
      }
    }
    notifyListeners();
  }

  void changeThemeMode(ThemeMode selectedThemeMode) async {
    themeMode = selectedThemeMode;
    CacheData.setData(
        key: 'ThemeMode',
        value:  selectedThemeMode == ThemeMode.dark ? 'dark' : 'light');
    notifyListeners();
  }

  void changeLanguage(String selectedLanguageCode) async {
    if (selectedLanguageCode == languageCode) return;
    languageCode = selectedLanguageCode;
    CacheData.setData(key: 'LanguageCode', value: languageCode);
    notifyListeners();
  }
}
