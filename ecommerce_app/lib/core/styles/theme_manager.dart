import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/fonts_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static bool isLightMode = true;

  static ThemeData getTheme() {
    return isLightMode ? lightMode : darkMode;
  }

  static ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade600,
      surface: Colors.black,
      onPrimary: Colors.white,
      onBackground: Colors.white70,
      onSurface: Colors.white60,
      onSecondary: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.grey.shade900,
    cardColor: Colors.grey.shade800,
    iconTheme: const IconThemeData(color: Colors.white70),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade700,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    useMaterial3: true,
  );

  static ThemeData lightMode = ThemeData(
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      background: SecondaryColor.secondary200,
      primary: NeutralColor.neutral200,
      secondary: Colors.white54,
      surface: Colors.white,
      onPrimary: Colors.black,
      onBackground: Colors.black87,
      onSurface: Colors.black54,
      onSecondary: Colors.black,
    ),
    scaffoldBackgroundColor: SecondaryColor.secondary200,
    cardColor: Colors.white,
    fontFamily: FontFamily.poppins,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
      displayMedium: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
      headlineLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: PrimaryColor.primary500,
      linearMinHeight: 3,
    ),
    iconTheme: const IconThemeData(color: Colors.black54),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      centerTitle: true,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: NeutralColor.neutral200,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    useMaterial3: true,
  );
}
