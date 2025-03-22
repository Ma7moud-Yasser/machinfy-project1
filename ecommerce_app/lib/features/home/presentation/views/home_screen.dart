import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/features/home/presentation/views/home_layout.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = const [
    HomeLayout(),
    Text("cart"),
    Text("search"),
    Text("profile"),

    // SearchScreen(),
    // CartScreen(),
    // ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: _children[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: AppColor.primary,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconsAssets.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconsAssets.cart),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconsAssets.cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconsAssets.userName),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
