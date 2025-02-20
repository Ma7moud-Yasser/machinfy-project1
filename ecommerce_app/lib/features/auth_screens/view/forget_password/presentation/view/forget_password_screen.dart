import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/features/auth_screens/components/auth_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/forget_password_screen_cubit.dart';
import '../controller/forget_password_screen_states.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordScreenCubit(),
      child:
          BlocConsumer<ForgetPasswordScreenCubit, ForgetPasswordScreenStates>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = ForgetPasswordScreenCubit.get(context);
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      AuthTitleHeader(
                        imagePath: IconsAssets.auth,
                        title: AppString.oops,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
    );
  }
}
