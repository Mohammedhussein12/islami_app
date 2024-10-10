import 'package:flutter/material.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/app_theme.dart';
import 'language.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربيه', code: 'ar'),
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Theme',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Switch(
                  activeTrackColor: AppTheme.gold,
                  value: settingsProvider.themeMode == ThemeMode.dark,
                  onChanged: (isDark) {
                    settingsProvider.changeThemeMode(
                        isDark ? ThemeMode.dark : ThemeMode.light);
                  },
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<Language>(
                    dropdownColor: settingsProvider.isDark
                        ? AppTheme.darkPrimary
                        : AppTheme.white,
                    borderRadius: BorderRadius.circular(20),
                    value: languages.first,
                    items: languages.map((language) {
                      return DropdownMenuItem(
                        value: language,
                        child: Text(language.name,
                            style: TextStyle(
                              color: settingsProvider.isDark
                                  ? AppTheme.gold
                                  : AppTheme.black,
                            )),
                      );
                    }).toList(),
                    onChanged: (selsctedLanguage) {
                      if (selsctedLanguage != null) {
                        print(selsctedLanguage.code);
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
