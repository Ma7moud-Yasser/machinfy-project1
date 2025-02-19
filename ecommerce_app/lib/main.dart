import 'package:ecommerce_app/core/resources/route_manager.dart';
import 'package:ecommerce_app/core/styles/theme_manager.dart';
import 'package:ecommerce_app/core/utils/bloc_observer.dart';
import 'package:ecommerce_app/core/utils/cache_manager.dart';
import 'package:ecommerce_app/features/splash/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheManager.init();

  // Load saved theme mode from cache
  final savedTheme = CacheManager.getValueFromCache(CacheKeys.themeMode);
  if (savedTheme != '_') {
    ThemeManager.setThemeMode(
      ThemeMode.values.firstWhere(
        (mode) => mode.toString() == savedTheme,
        orElse: () => ThemeMode.system,
      ),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeManager.themeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          theme: ThemeManager.lightMode,
          darkTheme: ThemeManager.darkMode,
          themeMode: mode,
          initialRoute: Routes.splashScreen,
          onGenerateRoute: RouteGenerator.getRoute,
        );
      },
    );
  }
}
