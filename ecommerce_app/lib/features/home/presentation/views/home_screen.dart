import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/presentation/controllers/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return PersistentTabView(
            // padding: EdgeInsets.only(bottom: 5),
            resizeToAvoidBottomInset: true,

            context,
            controller: _controller,
            screens: cubit.screens(),
            items: cubit.navBarsItems(),
            // backgroundColor: AppColor.white,
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
                  color: AppColor.gray.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            navBarStyle: NavBarStyle.style3,
            navBarHeight: SizeManager.getSize(context).height * 0.068,
          );
        },
      ),
    );
  }
}
