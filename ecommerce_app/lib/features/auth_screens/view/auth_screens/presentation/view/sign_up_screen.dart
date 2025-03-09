import 'package:ecommerce_app/core/components/custom_elevated_button.dart';
import 'package:ecommerce_app/core/components/custom_text_form.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/core/utils/validation_manager.dart';
import 'package:ecommerce_app/features/auth_screens/view/auth_screens/presentation/components/terms_check_box.dart';
import 'package:ecommerce_app/features/auth_screens/view/auth_screens/presentation/controller/sign_up_cubit/sign_up_cubit.dart';
import 'package:ecommerce_app/features/auth_screens/components/auth_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpFailureState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          final signUpCubit = SignUpCubit.get(context);

          return Scaffold(
            body: Padding(
              padding: PaddingManager.main(context),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: signUpCubit.formKey,
                    child: Column(
                      children: [
                        AuthTitleHeader(
                          imagePath: IconsAssets.auth,
                          title: AppString.signUpTitle,
                        ),
                        // Email Field
                        CustomTextFormField(
                          controller: signUpCubit.userNameController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().isEmpty) {
                              return AppString.userNameEmpty;
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.name,
                          label: AppString.userName,
                          hintText: AppString.exUserName,
                          prefixIconPath: IconsAssets.userName,
                          suffixIconWidget: SizedBox(),
                        ),
                        SizedBox(
                          height: SizeManager.getSize(context).height * 0.02,
                        ),
                        CustomTextFormField(
                          controller: signUpCubit.emailController,
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
                          controller: signUpCubit.passwordController,
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
                          obscureText: signUpCubit.isNotVisible,
                          keyboardType: TextInputType.visiblePassword,
                          label: AppString.password,
                          hintText: AppString.exPassword,
                          prefixIconPath: IconsAssets.password,
                          suffixIconWidget: IconButton(
                            onPressed: () {
                              signUpCubit.toggleVisiblePassword();
                            },
                            icon: SvgPicture.asset(
                              !signUpCubit.isNotVisible
                                  ? IconsAssets.passVisible
                                  : IconsAssets.passInVisible,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomTextFormField(
                          controller: signUpCubit.phoneController,

                          obscureText: signUpCubit.isNotVisible,
                          keyboardType: TextInputType.visiblePassword,
                          label: AppString.phone,
                          hintText: AppString.exPhone,

                          // prefixIconPath: IconsAssets.password,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        // Confirm Password Field و Country Fields
                        // CustomTextFormField(
                        //   controller: signUpCubit.confirmPasswordController,
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return AppString.emptyPassword;
                        //     } else if (value !=
                        //         signUpCubit.passwordController.text) {
                        //       return AppString.passwordDoesNotMatch;
                        //     }
                        //     return null;
                        //   },
                        //   obscureText: signUpCubit.isNotVisible,
                        //   keyboardType: TextInputType.visiblePassword,
                        //   label: AppString.confirmPassword,
                        //   hintText: AppString.exPassword,
                        //   prefixIconPath: IconsAssets.password,
                        //   suffixIconWidget: IconButton(
                        //     onPressed: () {
                        //       signUpCubit.toggleVisibleConfirmPassword();
                        //     },
                        //     icon: SvgPicture.asset(
                        //       !signUpCubit.isNotVisibleConfirm
                        //           ? IconsAssets.passVisible
                        //           : IconsAssets.passInVisible,
                        //     ),
                        //   ),
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     countriesAlertDialog(context);
                        //   },
                        //   child: CustomTextFormField(
                        //     controller: signUpCubit.countryController,
                        //     validator: (value) {
                        //       if (value == null || value.isEmpty) {
                        //         return AppString.emptyCity;
                        //       }
                        //       return null;
                        //     },
                        //     keyboardType: TextInputType.text,
                        //     isEditing: false,
                        //     label: AppString.country,
                        //     hintText: AppString.exCity,
                        //     prefixIconPath: IconsAssets.egyptFlag,
                        //     suffixIconWidget: IconButton(
                        //       onPressed: () {},
                        //       icon: Icon(Icons.arrow_drop_down),
                        //     ),
                        //   ),
                        // ),
                        // Row(
                        //   spacing: 15,
                        //   children: [
                        //     Expanded(
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           countriesAlertDialog(context);
                        //         },
                        //         child: CustomTextFormField(
                        //           controller:
                        //               signUpCubit.cityController,
                        //           validator: (value) {
                        //             if (value == null ||
                        //                 value.isEmpty) {
                        //               return AppString.emptyCity;
                        //             }
                        //             return null;
                        //           },
                        //           keyboardType: TextInputType.text,
                        //           isEditing: false,
                        //           label: AppString.city,
                        //           hintText: AppString.exCity,
                        //           suffixIconWidget: Icon(
                        //             Icons.arrow_drop_down,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     Expanded(
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           countriesAlertDialog(context);
                        //         },
                        //         child: CustomTextFormField(
                        //           controller:
                        //               signUpCubit.regionController,
                        //           validator: (value) {
                        //             if (value == null ||
                        //                 value.isEmpty) {
                        //               return AppString.emptyCity;
                        //             }
                        //             return null;
                        //           },
                        //           keyboardType: TextInputType.text,
                        //           isEditing: false,
                        //           label: AppString.region,
                        //           hintText: AppString.exCity,
                        //           suffixIconWidget: Icon(
                        //             Icons.arrow_drop_down,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        TermsCheckbox(
                          isChecked: signUpCubit.isChecked,
                          onTap: signUpCubit.toggleCheckBox,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomElevatedButton(
                          isLoading: state is SignUpLoadingState,
                          textButton: AppString.signUp,
                          onPressed: () {
                            if (signUpCubit.formKey.currentState!.validate()) {
                              signUpCubit.signUp(context);
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
                              AppString.alreadyHaveAcc,
                              style: StyleManager.textStyle14(
                                context,
                                FontWeight.w600,
                              ).copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                AppString.login,
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
