import 'dart:developer';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/resources/route_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/features/auth_screens/view/auth_screens/presentation/controller/login_cubit/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberAndForgetPassword extends StatefulWidget {
  const RememberAndForgetPassword({super.key, required this.emailController});
  final TextEditingController emailController;
  @override
  State<RememberAndForgetPassword> createState() =>
      _RememberAndForgetPasswordState();
}

class _RememberAndForgetPasswordState extends State<RememberAndForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          final loginCubit = LoginCubit.get(context);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .05,
                    height: MediaQuery.sizeOf(context).height * .009,
                    child: Checkbox(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      value: loginCubit.rememberMe,
                      onChanged: (value) {
                        setState(() {
                          loginCubit.rememberMe = value!;
                        });
                        log('remember Me : ${loginCubit.rememberMe}');
                      },
                    ),
                  ),
                  Text(
                    AppString.rememberMe,
                    style: StyleManager.textStyle14(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.forgetPasswordScreens,
                    arguments: widget.emailController.text,
                  );
                },
                child: Text(
                  AppString.forgetPassword,
                  style: StyleManager.textStyle14(context).copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
