import 'package:ecommerce_app/core/components/custom_elevated_button.dart';
import 'package:ecommerce_app/core/components/custom_text_form.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/resources/route_manager.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/core/utils/validation_manager.dart';
import 'package:ecommerce_app/features/auth_screens/view/auth_screens/presentation/components/remember_forget_password.dart';
import 'package:ecommerce_app/features/auth_screens/components/auth_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controller/login_cubit/login_cubit.dart';
import '../controller/login_cubit/login_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenCubit(),
      child: BlocConsumer<LoginScreenCubit, LoginScreenStates>(
        listener: (context, state) {
          if (state is LoginScreenSuccessState) {
            if (state.status) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.homeScreen,
                (route) => false,
              );
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          }
        },
        builder: (context, state) {
          final loginCubit = LoginScreenCubit.get(context);

          return Scaffold(
            body: Padding(
              padding: PaddingManager.main(context),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: loginCubit.formKey,
                    child: Column(
                      children: [
                        AuthTitleHeader(
                          imagePath: IconsAssets.auth,
                          title: AppString.loginTitle,
                        ),

                        SizedBox(
                          height: SizeManager.getSize(context).height * 0.02,
                        ),
                        CustomTextFormField(
                          controller: loginCubit.emailController,
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
                          height: SizeManager.getSize(context).height * 0.02,
                        ),
                        // Password Field
                        CustomTextFormField(
                          controller: loginCubit.passwordController,
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
                          obscureText: loginCubit.isNotVisible,
                          keyboardType: TextInputType.visiblePassword,
                          label: AppString.password,
                          hintText: AppString.exPassword,
                          prefixIconPath: IconsAssets.password,
                          suffixIconWidget: IconButton(
                            onPressed: () {
                              loginCubit.toggleVisiblePassword();
                            },
                            icon: SvgPicture.asset(
                              !loginCubit.isNotVisible
                                  ? IconsAssets.passVisible
                                  : IconsAssets.passInVisible,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),

                        // remember Me Field
                        RememberAndForgetPassword(
                          onChanged: (value) {
                            loginCubit.toggleRememberPassword(value);
                          },
                          emailController: loginCubit.emailController,
                          rememberMe: loginCubit.rememberMe,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomElevatedButton(
                          isLoading: state is LoginScreenLoadingState,
                          textButton: AppString.login,
                          onPressed: () {
                            if (loginCubit.formKey.currentState!.validate()) {
                              loginCubit.login();
                            }
                          },
                        ),
                        SizedBox(
                          height: SizeManager.getSize(context).height * 0.01,
                        ),
                        Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppString.dontHaveAcc,
                              style: StyleManager.textStyle14(
                                context,
                                FontWeight.w600,
                              ).copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.signUpScreen,
                                  arguments: {
                                    loginCubit.emailController,
                                    loginCubit.passwordController,
                                  },
                                );
                              },
                              child: Text(
                                AppString.signUp,
                                style: StyleManager.textStyle16(
                                  context,
                                  FontWeight.w700,
                                ).copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeManager.getSize(context).height * 0.01,
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
