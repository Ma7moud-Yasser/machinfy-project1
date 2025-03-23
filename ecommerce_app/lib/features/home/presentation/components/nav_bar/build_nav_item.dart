import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentBottomNavBarItem buildNavItem(String iconPath, String title) {
  return PersistentBottomNavBarItem(
    icon: SvgPicture.asset(
      iconPath,
      fit: BoxFit.contain,

      colorFilter: const ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
    ),
    inactiveIcon: SvgPicture.asset(
      iconPath,

      colorFilter: ColorFilter.mode(AppColor.gray, BlendMode.srcIn),
    ),
    title: title,
    activeColorPrimary: AppColor.primary,
    inactiveColorPrimary: AppColor.gray,
  );
}
