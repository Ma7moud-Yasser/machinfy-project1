import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/features/cart/presentation/view/cart_screen.dart';
import 'package:ecommerce_app/features/categories/presentation/view/categories_screen.dart';
import 'package:ecommerce_app/features/home/presentation/views/home_layout.dart';
import 'package:ecommerce_app/features/notification/presentation/view/notification_screen.dart';
import 'package:ecommerce_app/features/setting/presentation/view/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> item = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'الرئيسية',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: 'الرئيسية'),
    BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'الرئيسية'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'الرئيسية'),
  ];

  int currentIndex = 0;

  List<Widget> screens = [
    HomeLayout(),
    CartScreen(),
    CategoriesScreen(),
    NotificationScreen(),
    SettingScreen(),
  ];
  final List<Map<String, String>> navBarItems = [
    {"icon": IconsAssets.home, "title": "Home"},
    {"icon": IconsAssets.cart, "title": "Cart"},
    {"icon": IconsAssets.categories, "title": "Category"},
    {"icon": IconsAssets.notification, "title": "Notifications"},
    {"icon": IconsAssets.setting, "title": "Settings"},
  ];

  changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(HomeBottomNavIndexState(index));
  }
}
