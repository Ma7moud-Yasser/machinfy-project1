import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/features/splash/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,

      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
