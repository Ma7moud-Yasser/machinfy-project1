import 'package:ecommerce_app/core/components/custom_elevated_button.dart';
import 'package:ecommerce_app/core/components/custom_text_form.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/core/utils/validation_manager.dart';
import 'package:ecommerce_app/features/auth_screens/components/auth_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  child: Padding(
                    padding: PaddingManager.main(context),
                    child: SingleChildScrollView(
                      child: Form(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: SizeManager.getSize(context).height * 0.02,
                          children: [
                            Stack(
                              children: [
                                AuthTitleHeader(
                                  imagePath: IconsAssets.oops,
                                  title: AppString.oops,
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: SvgPicture.asset(IconsAssets.arrowBack),
                                ),
                              ],
                            ),
                            Text(
                              textAlign: TextAlign.justify,
                              AppString.forgetPasswordTitle,
                              style: StyleManager.textStyle16(context),
                            ),
                            CustomTextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppString.emptyEmail;
                                } else if (!ValidationManager.isValidEmail(
                                  value,
                                )) {
                                  return AppString.correctEmail;
                                }
                                return null;
                              },
                              controller: cubit.emailController,
                              hintText: AppString.email,
                              label: AppString.email,
                              prefixIconPath: IconsAssets.email,
                              suffixIconWidget: SizedBox(),
                            ),
                            CustomElevatedButton(
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {}
                              },
                              textButton: AppString.submit,
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
