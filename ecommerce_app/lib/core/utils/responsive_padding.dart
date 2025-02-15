import 'package:flutter/material.dart';

abstract class PaddingCalculator {
  static const double small = 16.0;
  static const double medium = 20.0;
  static const double large = 24.0;
  static const double extraLarge = 32.0;

  static double getPadding(double value) {
    if (value < 600) {
      return small;
    } else if (value < 800) {
      return medium;
    } else if (value < 1000) {
      return large;
    } else {
      return extraLarge;
    }
  }
}

abstract class PaddingBase {
  EdgeInsets getPadding(BuildContext context);
}

class MainPadding implements PaddingBase {
  @override
  EdgeInsets getPadding(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final horizontal = PaddingCalculator.getPadding(size.width);
    final vertical = PaddingCalculator.getPadding(size.height);

    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }
}

class CustomPadding implements PaddingBase {
  final double left;
  final double top;
  final double right;
  final double bottom;

  CustomPadding({this.left = 0, this.top = 0, this.right = 0, this.bottom = 0});

  @override
  EdgeInsets getPadding(BuildContext context) {
    return EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);
  }
}
