import 'package:fire_base_project/core/components/custom_text_form.dart';
import 'package:fire_base_project/features/auth/cubit/sign_up/sign_up_cubit.dart';
import 'package:fire_base_project/features/home/home_screen.dart';
import 'package:fire_base_project/features/presentation/sign_in_screen/views/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            Get.to(HomeScreen());
          } else if (state is SignUpErrorState) {
            Get.snackbar(
              'Error',
              state.errorMessage,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        },
        builder: (context, state) {
          var cubit = SignUpCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: Text('Sign UP')),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomTextFormField(
                        hintText: 'Username',
                        controller: cubit.userNameController,
                      ),
                      SizedBox(height: 20.0),
                      CustomTextFormField(
                        hintText: 'email',
                        controller: cubit.emailController,
                      ),
                      SizedBox(height: 20.0),
                      CustomTextFormField(
                        hintText: 'Password',
                        controller: cubit.passwordController,
                      ),
                      SizedBox(height: 20.0),
                      CustomTextFormField(
                        hintText: 'Confirm Password',
                        controller: cubit.confirmPasswordController,
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.signUp();
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('do you have an account?'),
                          TextButton(
                            onPressed: () {
                              Get.to(SignInScreen());
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
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
