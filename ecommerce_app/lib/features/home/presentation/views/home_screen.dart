import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/features/home/presentation/views/home_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<Widget> _screens() {
    return [
      HomeLayout(),
      const Center(child: Text("Cart")),
      const Center(child: Text("Categories")),
      const Center(child: Text("Notifications")),
      const Center(child: Text("Settings")),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      _buildNavItem(IconsAssets.home, "Home"),
      _buildNavItem(IconsAssets.cart, "Cart"),
      _buildNavItem(IconsAssets.categories, "Categories"),
      _buildNavItem(IconsAssets.categories, "Notifications"),
      _buildNavItem(IconsAssets.setting, "Settings"),
    ];
  }

  PersistentBottomNavBarItem _buildNavItem(String iconPath, String title) {
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

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      // padding: EdgeInsets.only(bottom: 5),
      resizeToAvoidBottomInset: true,

      context,
      controller: _controller,
      screens: _screens(),
      items: _navBarsItems(),
      backgroundColor: AppColor.white,
      handleAndroidBackButtonPress: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadiusManager.custom(
          context: context,
          topRight: 20,
          topLeft: 20,
        ),
        colorBehindNavBar: AppColor.white,

        boxShadow: [
          BoxShadow(
            color: AppColor.background.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      navBarStyle: NavBarStyle.style3,
      navBarHeight: SizeManager.getSize(context).height * 0.068,
    );
  }
}
