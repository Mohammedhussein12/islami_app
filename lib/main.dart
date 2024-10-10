import 'package:flutter/material.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islami/tabs/quran/sura_content_screen.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const IslamiApp(),
    ),
  );
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.languageCode),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraDetailsScreen.routeName: (context) => const SuraDetailsScreen(),
        HadethContentScreen.routeName: (context) => const HadethContentScreen(),
        // Add other routes here
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: settingsProvider.themeMode,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
