import 'package:flutter/material.dart';
import 'package:to_do_app/core/styles/color_manager.dart';
import 'package:to_do_app/core/utils/responsive_font.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColor.blue,
        secondary: AppColor.white,
        error: Colors.red,
        onSurface: AppColor.grey,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: AppColor.white,
          fontSize: responsiveFont(context, fontSize: 25),
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: AppColor.grey,
          fontSize: responsiveFont(context, fontSize: 20),
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: responsiveFont(context, fontSize: 30),
        ),
      ));
}
