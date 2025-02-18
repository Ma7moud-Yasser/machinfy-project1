import 'dart:developer';

import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/features/login/presentation/controller/login_screen_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberAndForgetPassword extends StatefulWidget {
  const RememberAndForgetPassword({super.key});

  @override
  State<RememberAndForgetPassword> createState() =>
      _RememberAndForgetPasswordState();
}

class _RememberAndForgetPasswordState extends State<RememberAndForgetPassword> {
  @override
  Widget build(BuildContext context) {
    bool rememberMe = BlocProvider.of<LoginScreenCubit>(context).rememberMe;
    return Padding(
      padding: PaddingManager.rememberForgetPassword(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .05,
                child: Checkbox(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      BlocProvider.of<LoginScreenCubit>(context).rememberMe =
                          value!;
                    });
                    log(
                      '${BlocProvider.of<LoginScreenCubit>(context).rememberMe}',
                    );
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
          Text(
            AppString.forgetPassword,
            style: StyleManager.textStyle14(context).copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
