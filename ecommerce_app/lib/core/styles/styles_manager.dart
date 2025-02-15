import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/styles/fonts_manager.dart';

abstract class StyleManager {
  // دالة لحساب حجم الخط المتجاوب
  static double responsiveFont(BuildContext context, double fontSize) {
    double scale = scaleFactorCalc(context);
    double scaledFontSize = fontSize * scale;

    // الحد الأقصى 120% والحد الأدنى 80%
    double max = fontSize * 1.2;
    double min = fontSize * 0.8;

    return scaledFontSize.clamp(min, max);
  }

  // دالة لحساب عامل التحجيم بناءً على عرض الشاشة
  static double scaleFactorCalc(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return width / 400;
    } else if (width < 900) {
      return width / 700;
    } else {
      return width / 1000;
    }
  }

  static TextStyle getTextStyle({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    required BuildContext context,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final double adjustedFontSize = responsiveFont(context, fontSize);

    Color color;
    if (fontSize <= 16) {
      color = colorScheme.onBackground;
    } else if (fontSize <= 24) {
      color = colorScheme.primary;
    } else {
      color = colorScheme.secondary;
    }

    return TextStyle(
      fontSize: adjustedFontSize,
      fontFamily: FontFamily.poppins,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle textStyle12(BuildContext context) =>
      getTextStyle(fontSize: 12, context: context);
  static TextStyle textStyle14(BuildContext context) =>
      getTextStyle(fontSize: 14, context: context);
  static TextStyle textStyle16(BuildContext context) =>
      getTextStyle(fontSize: 16, context: context);
  static TextStyle textStyle18(BuildContext context) =>
      getTextStyle(fontSize: 18, context: context);
  static TextStyle textStyle20(BuildContext context) =>
      getTextStyle(fontSize: 20, context: context);
  static TextStyle textStyle22(BuildContext context) =>
      getTextStyle(fontSize: 22, context: context);
  static TextStyle textStyle24(BuildContext context) =>
      getTextStyle(fontSize: 24, context: context);
  static TextStyle textStyle26(BuildContext context) =>
      getTextStyle(fontSize: 26, context: context);
  static TextStyle textStyle28(BuildContext context) =>
      getTextStyle(fontSize: 28, context: context);
  static TextStyle textStyle30(BuildContext context) =>
      getTextStyle(fontSize: 30, context: context);
  static TextStyle textStyle32(BuildContext context) =>
      getTextStyle(fontSize: 32, context: context);
}
