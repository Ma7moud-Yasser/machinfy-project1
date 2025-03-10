import 'dart:developer';
import 'package:ecommerce_app/core/services/dio_helper.dart';
import 'package:ecommerce_app/core/services/end_point.dart';
import 'package:ecommerce_app/features/auth_screens/view/auth_screens/presentation/controller/auth_cubit/login_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenCubit extends Cubit<LoginScreenStates> {
  bool isNotVisible = true;
  bool isSignUp = false;
  bool rememberMe = false;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginScreenCubit() : super(LoginScreenInitState());

  static LoginScreenCubit get(context) => BlocProvider.of(context);

  Future<void> login() async {
    try {
      final response = await DioHelper.postData(
        token:
            'je3f8gwBMYAtu4NCPvybj5hM08u9CERYFVKtSUWn2IG5T1m3siLBKrPnk63VhYzdP7Lqr2',
        url: EndPoint.login,
        data: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );
      emit(
        LoginScreenSuccessState(
          message: response.data["message"],
          status: response.data["status"],
        ),
      );
      log(response.toString());
    } catch (e) {
      emit(LoginScreenErrorState(e.toString()));
      log("Login Error: $e");
    }
  }

  void toggleVisiblePassword() {
    isNotVisible = !isNotVisible;
    emit(ToggleVisiblePasswordState());
  }

  void toggleRememberPassword(bool? value) {
    rememberMe = value ?? false;
    emit(ToggleRememberPasswordState());
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    emailController.dispose();
    return super.close();
  }
}
