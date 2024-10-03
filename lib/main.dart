import 'package:flutter/material.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/tabs/quran/sura_content_screen.dart';
import 'package:islami/utils/app_theme.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraContentScreen.routeName: (context) => SuraContentScreen(),
        // Add other routes here
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
