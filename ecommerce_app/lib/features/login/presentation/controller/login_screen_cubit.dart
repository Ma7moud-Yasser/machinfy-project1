import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_screen_states.dart';

class LoginScreenCubit extends Cubit<LoginScreenStates> {
  bool isActive = false;
  bool rememberMe = false;
  bool isVisible = false;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginScreenCubit() : super(LoginScreenInitState());

  static LoginScreenCubit get(context) => BlocProvider.of(context);

  void login() {}

  void toggleVisiblePassword() {
    isVisible = !isVisible;
    emit(ToggleVisiblePasswordState());
  }

  @override
  /// Set [isActive] to false and call [super.close] to close the [Bloc] and
  /// release any resources it may have acquired.
  ///
  /// This should be called when the [Bloc] is no longer needed and is about to
  /// be removed from the widget tree.
  ///
  /// Subclasses should override this method to release any additional resources
  /// that they may have acquired.
  Future<void> close() {
    isActive = false;
    return super.close();
  }
}
