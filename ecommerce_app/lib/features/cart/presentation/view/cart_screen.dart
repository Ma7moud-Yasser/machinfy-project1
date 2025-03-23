import 'package:ecommerce_app/core/styles/assets_manager.dart';
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
            body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    SvgPicture.asset(IconsAssets.emptyCart),
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
