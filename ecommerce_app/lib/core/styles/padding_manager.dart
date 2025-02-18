import 'package:flutter/material.dart';

abstract class PaddingBase {
  static EdgeInsets getPadding(BuildContext context) => EdgeInsets.zero;
}

class MainPadding extends PaddingBase {
  static EdgeInsets getPadding(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final horizontal = size.width * 0.05;
    final vertical = size.height * 0.03;

    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }
}

class IconTextFormPadding extends PaddingBase {
  static EdgeInsets getPadding(BuildContext context) {
    final size = MediaQuery.of(context).size.width * .03;
    return EdgeInsets.all(size);
  }
}

class RememberAndForgetPasswordPadding extends PaddingBase {
  static EdgeInsets getPadding(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final vertical = size.height * 0.009;
    return EdgeInsets.symmetric(vertical: vertical);
  }
}

class CustomPadding extends PaddingBase {
  final double left;
  final double top;
  final double right;
  final double bottom;

  CustomPadding({this.left = 0, this.top = 0, this.right = 0, this.bottom = 0});

  EdgeInsets getPadding(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return EdgeInsets.only(
      left: left == 0 ? size.width * 0.04 : left,
      top: top == 0 ? size.height * 0.02 : top,
      right: right == 0 ? size.width * 0.04 : right,
      bottom: bottom == 0 ? size.height * 0.02 : bottom,
    );
  }
}
