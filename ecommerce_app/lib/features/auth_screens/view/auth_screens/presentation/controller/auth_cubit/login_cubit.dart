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

  void login() {
    try {} catch (e) {
      print(e);
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
