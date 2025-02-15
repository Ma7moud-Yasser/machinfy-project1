import 'package:flutter/material.dart';

class ResponsivePadding {
  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) {
      return 8.0;
    } else if (width < 600) {
      return 16.0;
    } else if (width < 900) {
      return 24.0;
    } else {
      return 32.0;
    }
  }

  static double verticalPadding(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    if (height < 600) {
      return 8.0;
    } else if (height < 800) {
      return 16.0;
    } else if (height < 1000) {
      return 24.0;
    } else {
      return 32.0;
    }
  }

  static EdgeInsets all(BuildContext context) {
    final value = horizontalPadding(context);
    return EdgeInsets.all(value);
  }

  static EdgeInsets symmetric(
    BuildContext context, {
    bool horizontal = true,
    bool vertical = true,
  }) {
    final horizontalValue = horizontal ? horizontalPadding(context) : 0.0;
    final verticalValue = vertical ? verticalPadding(context) : 0.0;
    return EdgeInsets.symmetric(
      horizontal: horizontalValue,
      vertical: verticalValue,
    );
  }

  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);
  }
}
