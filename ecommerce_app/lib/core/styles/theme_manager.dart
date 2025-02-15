import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/utils/cache_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  // Notifier to switch between themes
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(
    ThemeMode.system,
  );

  // Initialize theme based on saved preference
  static Future<void> initTheme() async {
    String? savedTheme = CacheManager.loadThemeMode();
    themeNotifier.value = _getThemeModeFromString(savedTheme);
  }

  // Convert string to ThemeMode
  static ThemeMode _getThemeModeFromString(String? theme) {
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  // Save and set theme mode
  static Future<void> setThemeMode(ThemeMode mode) async {
    themeNotifier.value = mode;
    await CacheManager.saveThemeMode(mode.toString().split('.').last);
  }

  // Light Theme
  static ThemeData get lightMode => ThemeData(
    colorScheme: const ColorScheme.light(
      background: SecondaryColor.secondary200,
      primary: NeutralColor.neutral200,
      secondary: Colors.white54,
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: SecondaryColor.secondary200,
    cardColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black54),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      centerTitle: true,
      elevation: 0,
    ),
    useMaterial3: true,
  );

  // Dark Theme
  static ThemeData get darkMode => ThemeData(
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade600,
      surface: Colors.black,
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
    useMaterial3: true,
  );
}
