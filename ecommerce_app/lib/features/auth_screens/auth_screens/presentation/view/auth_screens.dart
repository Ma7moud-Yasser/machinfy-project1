import 'package:ecommerce_app/core/components/custom_elevated_button.dart';
import 'package:ecommerce_app/core/components/custom_text_form.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/core/utils/validation_manager.dart';
import 'package:ecommerce_app/features/auth_screens/auth_screens/presentation/components/remember_forget_password.dart';
import 'package:ecommerce_app/features/auth_screens/auth_screens/presentation/controller/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth_screens/auth_screens/presentation/controller/sin_up_cubit/sign_up_cubit.dart';
import 'package:ecommerce_app/features/auth_screens/auth_screens/presentation/components/auth_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controller/auth_cubit/auth_screens_cubit.dart';
import '../controller/auth_cubit/auth_screens_states.dart';

class AuthScreens extends StatefulWidget {
  const AuthScreens({super.key});

  @override
  State<AuthScreens> createState() => _AuthScreensState();
}

class _AuthScreensState extends State<AuthScreens> {
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthScreensCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
      ],
      child: BlocBuilder<AuthScreensCubit, AuthScreensStates>(
        builder: (context, state) {
          final authScreensCubit = AuthScreensCubit.get(context);
          final loginCubit = LoginCubit.get(context);
          final signUpCubit = SignUpCubit.get(context);

          return Scaffold(
            body: Padding(
              padding: PaddingManager.main(context),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: authScreensCubit.formKey,
                    child: Column(
                      children: [
                        AuthTitleHeader(
                          title:
                              isSignUp
                                  ? AppString.signUpTitle
                                  : AppString.loginTitle,
                        ),
                        // Email Field
                        CustomTextFormField(
                          controller:
                              isSignUp
                                  ? authScreensCubit.emailController
                                  : authScreensCubit.emailController,
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
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        // Password Field
                        CustomTextFormField(
                          controller:
                              isSignUp
                                  ? authScreensCubit.passwordController
                                  : authScreensCubit.passwordController,
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
                          obscureText: authScreensCubit.isNotVisible,
                          keyboardType: TextInputType.visiblePassword,
                          label: AppString.password,
                          hintText: AppString.exPassword,
                          prefixIconPath: IconsAssets.password,
                          suffixIconWidget: IconButton(
                            onPressed: () {
                              authScreensCubit.toggleVisiblePassword();
                            },
                            icon: SvgPicture.asset(
                              !authScreensCubit.isNotVisible
                                  ? IconsAssets.passVisible
                                  : IconsAssets.passInVisible,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        // remember Me Field
                        if (!isSignUp) RememberAndForgetPassword(),
                        // Sign Up UI
                        if (isSignUp)
                          BlocConsumer<SignUpCubit, SignUpState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return Column(
                                spacing:
                                    MediaQuery.of(context).size.height * 0.02,
                                children: [
                                  // Confirm Password Field
                                  CustomTextFormField(
                                    controller:
                                        signUpCubit.confirmPasswordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return AppString.emptyPassword;
                                      } else if (value !=
                                          authScreensCubit
                                              .passwordController
                                              .text) {
                                        return AppString.passwordDoesNotMatch;
                                      }
                                      return null;
                                    },
                                    obscureText: signUpCubit.isNotVisible,
                                    keyboardType: TextInputType.visiblePassword,
                                    label: AppString.confirmPassword,
                                    hintText: AppString.exPassword,
                                    prefixIconPath: IconsAssets.password,
                                    suffixIconWidget: IconButton(
                                      onPressed: () {
                                        signUpCubit
                                            .toggleVisibleConfirmPassword();
                                      },
                                      icon: SvgPicture.asset(
                                        !signUpCubit.isNotVisible
                                            ? IconsAssets.passVisible
                                            : IconsAssets.passInVisible,
                                      ),
                                    ),
                                  ),

                                  /// 📌 **حقل رقم الهاتف**
                                  CustomTextFormField(
                                    controller: signUpCubit.phoneController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return AppString.emptyPhone;
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.phone,
                                    label: AppString.phone,
                                    hintText: AppString.exPhone,
                                    prefixIconPath: IconsAssets.email,
                                    suffixIconWidget: SizedBox(),
                                  ),

                                  /// 📌 **حقل المدينة**
                                  CustomTextFormField(
                                    controller: signUpCubit.cityController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return AppString.emptyCity;
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    label: AppString.city,
                                    hintText: AppString.exCity,
                                    prefixIconPath: IconsAssets.email,
                                    suffixIconWidget: SizedBox(),
                                  ),
                                ],
                              );
                            },
                          ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.032,
                        ),

                        CustomElevatedButton(
                          textButton:
                              isSignUp ? AppString.signUp : AppString.login,
                          onPressed: () {
                            if (authScreensCubit.formKey.currentState!
                                .validate()) {
                              if (isSignUp) {
                                signUpCubit.signUp();
                              } else {
                                loginCubit.login();
                              }
                            }
                          },
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isSignUp
                                  ? AppString.alreadyHaveAcc
                                  : AppString.dontHaveAcc,
                              style: StyleManager.textStyle14(context).copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isSignUp = !isSignUp;
                                });
                              },
                              child: Text(
                                isSignUp ? AppString.login : AppString.signUp,
                                style: StyleManager.textStyle16(
                                  context,
                                ).copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
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
