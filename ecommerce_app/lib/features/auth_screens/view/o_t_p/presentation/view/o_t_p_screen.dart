import 'dart:developer';

import 'package:ecommerce_app/core/components/custom_elevated_button.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/resources/route_manager.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/features/auth_screens/components/auth_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controller/o_t_p_screen_cubit.dart';
import '../controller/o_t_p_screen_states.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OTPScreenCubit(),
      child: BlocConsumer<OTPScreenCubit, OTPScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = OTPScreenCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: PaddingManager.main(context),
                child: SingleChildScrollView(
                  child: Form(
                    // key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: SizeManager.getSize(context).height * 0.02,
                      children: [
                        Stack(
                          children: [
                            AuthTitleHeader(
                              imagePath: IconsAssets.forgetPassword,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: SizeManager.getSize(context).height * 0.02,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: SvgPicture.asset(IconsAssets.arrowBack),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          AppString.verificationCodeTitle,
                          style: StyleManager.textStyle16(context),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          AppString.enterVerificationCode,
                          style: StyleManager.textStyle22(
                            context,
                            FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: List.generate(
                            4,
                            (index) => SizedBox(
                              width: SizeManager.getSize(context).width * 0.12,
                              height:
                                  SizeManager.getSize(context).height * 0.06,
                              child: TextFormField(
                                controller: cubit.otpController[index],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: StyleManager.textStyle16(
                                  context,
                                  FontWeight.bold,
                                ).copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    if (index < 3) {
                                      FocusScope.of(context).nextFocus();
                                    } else {
                                      FocusScope.of(context).unfocus();
                                    }
                                  } else if (index > 0) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).colorScheme.background,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadiusManager.small(
                                      context,
                                    ),
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.background,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadiusManager.small(
                                      context,
                                    ),
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          AppString.dontReceiveCode,
                          style: StyleManager.textStyle12(context),
                        ),
                        GestureDetector(
                          onTap: () => cubit.resendCode(),
                          child: Text(
                            AppString.resendCode,
                            style: StyleManager.textStyle14(context).copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                        CustomElevatedButton(
                          isLoading: true,
                          onPressed: () {
                            if (cubit.otpController.length < 4 ||
                                cubit.otpController.any(
                                  (element) => element.text.isEmpty,
                                )) {
                              log('Please enter the correct code');
                            } else {
                              Navigator.pushNamed(
                                context,
                                Routes.resetPasswordScreen,
                              );
                            }
                            // if (cubit.formKey.currentState!.validate()) {
                            //   Navigator.pushNamed(context, Routes.otpScreen);
                            // }
                          },
                          textButton: AppString.confirm,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
