import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/features/home/presentation/controllers/banner_cubit/banner_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/presentation/controllers/home_cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: buildBottomNavBar(context, cubit),
          );
        },
      ),
    );
  }

  Widget buildBottomNavBar(BuildContext context, HomeCubit cubit) {
    return Container(
      height: SizeManager.getSize(context).height * 0.08,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadiusManager.custom(
          context: context,
          topLeft: 20,
          topRight: 20,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeManager.getSize(context).width * 0.05,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavBarItem(0, cubit),
            buildNavBarItem(1, cubit),
            buildNavBarItem(2, cubit),
            buildNavBarItem(3, cubit),
            buildNavBarItem(4, cubit),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(int index, HomeCubit cubit) {
    final context = this.context;
    return Expanded(
      flex: index == 3 ? 2 : 1,
      child: GestureDetector(
        onTap: () => cubit.changeBottomNavIndex(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            cubit.currentIndex == index
                ? lineOnItemSelect(context)
                : SizedBox(height: SizeManager.getSize(context).height * 0.006),
            SizedBox(height: SizeManager.getSize(context).height * 0.009),
            SvgPicture.asset(
              cubit.navBarItems[index]["icon"]!,
              width: SizeManager.getSize(context).width * 0.07,
              color:
                  cubit.currentIndex == index
                      ? AppColor.primary
                      : AppColor.gray,
            ),
            SizedBox(height: SizeManager.getSize(context).height * 0.008),
            Text(
              cubit.navBarItems[index]["title"]!,
              style: StyleManager.textStyle12(
                context,
                FontWeight.bold,
              ).copyWith(
                color:
                    cubit.currentIndex == index
                        ? AppColor.primary
                        : AppColor.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lineOnItemSelect(BuildContext context) => Container(
    height: SizeManager.getSize(context).height * 0.006,
    width: SizeManager.getSize(context).width * 0.15,
    decoration: BoxDecoration(
      color: AppColor.primary,
      borderRadius: BorderRadiusManager.custom(
        context: context,
        bottomLeft: 40,
        bottomRight: 40,
      ),
    ),
  );
}
