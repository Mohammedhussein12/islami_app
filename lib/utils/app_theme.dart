import 'dart:ui';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xffB7935F);
  static const Color darkPrimary = Color(0xff141A2E);
  static const Color white = Color(0xffF8F8F8);
  static const Color black = Color(0xff242424);
  static const Color gold = Color(0xffFACC1D);
  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: lightPrimary,
      unselectedItemColor: white,
      selectedItemColor: black,
      type: BottomNavigationBarType.fixed,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      titleTextStyle:
          TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 30),
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: black, fontSize: 20),
      headlineSmall:
          TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: black),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkPrimary,
      unselectedItemColor: white,
      selectedItemColor: gold,
      type: BottomNavigationBarType.fixed,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      titleTextStyle:
          TextStyle(color: white, fontWeight: FontWeight.w600, fontSize: 25),
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: gold, fontSize: 20),
      headlineSmall:
          TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: white),
    ),
  );
}