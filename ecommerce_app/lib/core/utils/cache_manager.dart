import 'package:hive_flutter/hive_flutter.dart';

class CacheManager {
  static late Box cacheBox;
  static late Box settingsBox;

  /// Initialize the cache by opening the Hive boxes.
  static Future<void> init() async {
    await Hive.initFlutter();
    cacheBox = await Hive.openBox('app');
    settingsBox = await Hive.openBox('settings');
  }

  /// Add a key-value pair to the settings cache.
  static Future<void> addToSettingsCache(String key, dynamic value) async {
    await settingsBox.put(key, value);
  }

  /// Get the value associated with a key from the settings cache.
  static dynamic getFromSettingsCache(String key) {
    return settingsBox.get(key);
  }

  /// Add a key-value pair to the app cache.
  static Future<void> addToCache(String key, dynamic value) async {
    await cacheBox.put(key, value);
  }

  /// Get a value from the app cache.
  static dynamic getValueFromCache(String key) {
    return cacheBox.get(key);
  }

  /// Remove a key from the app cache.
  static Future<void> removeFromCache(String key) async {
    await cacheBox.delete(key);
  }

  /// Stream value changes from the cache.
  static Stream<dynamic> getValueStream(String key) {
    return cacheBox.watch(key: key).map((event) => event.value);
  }

  /// ThemeMode helpers
  static const String themeModeKey = 'themeMode';

  static Future<void> saveThemeMode(String mode) async {
    await addToSettingsCache(themeModeKey, mode);
  }

  static String? loadThemeMode() {
    return getFromSettingsCache(themeModeKey);
  }
}

class CacheKeys {
  static const String isOnBoardingViewSeen = "isOnBoardingViewSeen";
  static const String userModel = "userModel";
  static const String themeMode = "themeMode";
}
