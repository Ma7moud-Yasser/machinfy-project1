import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_screens_states.dart';

class AuthScreensCubit extends Cubit<AuthScreensStates> {
  bool isNotVisible = true;
  bool isSignUp = false;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthScreensCubit() : super(AuthScreensInitState());

  static AuthScreensCubit get(context) => BlocProvider.of(context);

  void toggleVisiblePassword() {
    isNotVisible = !isNotVisible;
    emit(ToggleVisiblePasswordState());
  }

  void toggleLoginAndSignUp() {
    passwordController.clear();
    isSignUp = !isSignUp;
    emit(ToggleLoginAndSignUpState());
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    emailController.dispose();
    return super.close();
  }
}
