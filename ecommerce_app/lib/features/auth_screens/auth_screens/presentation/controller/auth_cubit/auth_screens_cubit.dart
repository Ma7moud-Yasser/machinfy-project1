import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_screens_states.dart';

class AuthScreensCubit extends Cubit<AuthScreensStates> {
  bool isVisible = false;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthScreensCubit() : super(AuthScreensInitState());

  static AuthScreensCubit get(context) => BlocProvider.of(context);

  void toggleVisiblePassword() {
    isVisible = !isVisible;
    emit(ToggleVisiblePasswordState());
  }
}
