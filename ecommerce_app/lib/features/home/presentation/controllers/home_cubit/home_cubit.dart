import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/features/cart/presentation/view/cart_screen.dart';
import 'package:ecommerce_app/features/categories/presentation/view/categories_screen.dart';
import 'package:ecommerce_app/features/home/presentation/components/nav_bar/build_nav_item.dart';
import 'package:ecommerce_app/features/home/presentation/views/home_layout.dart';
import 'package:ecommerce_app/features/notification/presentation/view/notification_screen.dart';
import 'package:ecommerce_app/features/setting/presentation/view/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens() {
    return [
      HomeLayout(),
      CartScreen(),
      CategoriesScreen(),
      NotificationScreen(),
      SettingScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      buildNavItem(IconsAssets.home, AppString.home),
      buildNavItem(IconsAssets.cart, AppString.cart),
      buildNavItem(IconsAssets.categories, AppString.categories),
      buildNavItem(IconsAssets.categories, AppString.notification),
      buildNavItem(IconsAssets.setting, AppString.settings),
    ];
  }

  changeBottomNavIndex(int index) {
    emit(HomeBottomNavIndexState(index));
  }
}
