import 'package:ecommerce_app/core/components/custom_app_bar.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controller/cart_screen_cubit.dart';
import '../controller/cart_screen_states.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartScreenCubit()..getCart(),
      child: BlocConsumer<CartScreenCubit, CartScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // final cubit = CartScreenCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: PaddingManager.main(context),
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        CustomAppBar(),
                        SvgPicture.asset(IconsAssets.emptyCart),
                        SizedBox(
                          height: SizeManager.getSize(context).height * 0.05,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Your cart is empty',
                          style: StyleManager.textStyle22(
                            context,
                            FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: SizeManager.getSize(context).height * 0.01,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Add something to make it happy',
                          style: StyleManager.textStyle16(
                            context,
                            FontWeight.w400,
                          ).copyWith(color: AppColor.tertiary),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
