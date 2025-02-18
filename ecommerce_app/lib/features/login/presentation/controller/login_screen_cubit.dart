import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_screen_states.dart';

class LoginScreenCubit extends Cubit<LoginScreenStates> {
  bool isActive = true;
  bool rememberMe = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginScreenCubit() : super(LoginScreenInitState());

  static LoginScreenCubit get(context) => BlocProvider.of(context);

  void login() {}

  @override
  Future<void> close() {
    isActive = false;
    return super.close();
  }
}
