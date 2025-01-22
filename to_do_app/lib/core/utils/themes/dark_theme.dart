import 'package:flutter/material.dart';
import 'package:to_do_app/core/styles/color_manager.dart';
import 'package:to_do_app/core/utils/responsive_font.dart';

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColor.blue,
        secondary: AppColor.black,
        tertiary: AppColor.white,
        onSurface: AppColor.grey,
        error: Colors.red,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: responsiveFont(context, fontSize: 25),
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: AppColor.grey,
          fontSize: responsiveFont(context, fontSize: 20),
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: AppColor.black,
          fontWeight: FontWeight.w900,
          fontSize: responsiveFont(context, fontSize: 30),
        ),
      ));
}
