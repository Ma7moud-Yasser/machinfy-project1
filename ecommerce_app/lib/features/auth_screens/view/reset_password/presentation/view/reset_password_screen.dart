import 'package:ecommerce_app/core/components/custom_elevated_button.dart';
import 'package:ecommerce_app/core/components/custom_text_form.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/resources/route_manager.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/features/auth_screens/components/auth_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controller/reset_password_screen_cubit.dart';
import '../controller/reset_password_screen_states.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordScreenCubit(),
      child: BlocConsumer<ResetPasswordScreenCubit, ResetPasswordScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ResetPasswordScreenCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: PaddingManager.main(context),
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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

                        ValueListenableBuilder<bool>(
                          valueListenable: cubit.isVisiblePassword,
                          builder: (context, isVisible, child) {
                            return CustomTextFormField(
                              hintText: AppString.exPassword,
                              obscureText: isVisible,
                              controller: cubit.passwordController,
                              suffixIconWidget: IconButton(
                                onPressed: cubit.toggleVisiblePassword,
                                icon: SvgPicture.asset(
                                  !isVisible
                                      ? IconsAssets.passVisible
                                      : IconsAssets.passInVisible,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: SizeManager.getSize(context).height * 0.02,
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: cubit.isVisibleConfirmPassword,
                          builder: (context, isVisible, child) {
                            return CustomTextFormField(
                              hintText: AppString.exPassword,
                              obscureText: isVisible,
                              controller: cubit.confirmPasswordController,
                              suffixIconWidget: IconButton(
                                onPressed: cubit.toggleVisibleConfirmPassword,
                                icon: SvgPicture.asset(
                                  !isVisible
                                      ? IconsAssets.passVisible
                                      : IconsAssets.passInVisible,
                                ),
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: ValueListenableBuilder<String?>(
                              valueListenable: cubit.passwordMatchStatus,
                              builder: (context, status, child) {
                                return status != null
                                    ? Padding(
                                      padding:
                                          PaddingManager.rememberForgetPassword(
                                            context,
                                          ),
                                      child: Text(
                                        status,
                                        style: StyleManager.textStyle12(
                                          context,
                                        ).copyWith(
                                          color:
                                              status ==
                                                      AppString.passwordMatching
                                                  ? Theme.of(
                                                    context,
                                                  ).colorScheme.secondary
                                                  : Theme.of(
                                                    context,
                                                  ).colorScheme.error,
                                        ),
                                      ),
                                    )
                                    : const SizedBox();
                              },
                            ),
                          ),
                        ),

                        CustomElevatedButton(
                          onPressed: () {
                            if (cubit.formKey.currentState!.validate()) {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                Routes.loginScreen,
                                (route) => false,
                              );
                            }
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
