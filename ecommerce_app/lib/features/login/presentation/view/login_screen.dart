import 'package:ecommerce_app/core/components/custom_elevated_button.dart';
import 'package:ecommerce_app/core/components/custom_text_form.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/core/utils/validation_manager.dart';
import 'package:ecommerce_app/features/login/presentation/component/remember_forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../controller/login_screen_cubit.dart';
import '../controller/login_screen_states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenCubit(),
      child: BlocConsumer<LoginScreenCubit, LoginScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = LoginScreenCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: PaddingManager.main(context),
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      SvgPicture.asset(IconsAssets.auth),

                      Text(
                        AppString.loginTitle,
                        style: StyleManager.textStyle22(
                          context,
                        ).copyWith(fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      CustomTextFormField(
                        controller: cubit.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppString.emptyEmail;
                          } else if (!ValidationManager.isValidEmail(value)) {
                            return AppString.correctEmail;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        label: AppString.email,
                        hintText: AppString.exEmail,
                        prefixIconPath: IconsAssets.email,
                        suffixIconWidget: SizedBox(),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      CustomTextFormField(
                        controller: cubit.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppString.emptyPassword;
                          } else if (!ValidationManager.isValidPassword(
                            value,
                          )) {
                            return AppString.correctPassword;
                          }
                          return null;
                        },
                        label: AppString.password,
                        hintText: AppString.exPassword,
                        obscureText: cubit.isVisible,
                        keyboardType: TextInputType.visiblePassword,
                        prefixIconPath: IconsAssets.password,
                        suffixIconWidget: IconButton(
                          onPressed: () {
                            cubit.toggleVisiblePassword();
                          },
                          icon: SvgPicture.asset(
                            !cubit.isVisible
                                ? IconsAssets.passVisible
                                : IconsAssets.passInVisible,
                          ),
                        ),
                      ),
                      RememberAndForgetPassword(),
                      CustomElevatedButton(
                        textButton: AppString.login,
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.login();
                          }
                        },
                      ),
                      Padding(
                        padding: PaddingManager.dontHaveAnAccount(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Text(
                              AppString.dontHaveAcc,
                              style: StyleManager.textStyle14(context).copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Text(
                              AppString.signUp,
                              style: StyleManager.textStyle16(context).copyWith(
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
