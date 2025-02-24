import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'reset_password_screen_states.dart';

class ResetPasswordScreenCubit extends Cubit<ResetPasswordScreenStates> {
  ResetPasswordScreenCubit() : super(ResetPasswordScreenInitState()) {
    passwordController.addListener(checkPasswordMatch);
    confirmPasswordController.addListener(checkPasswordMatch);
  }

  static ResetPasswordScreenCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final ValueNotifier<bool> isVisiblePassword = ValueNotifier(true);
  final ValueNotifier<bool> isVisibleConfirmPassword = ValueNotifier(true);
  final ValueNotifier<String?> passwordMatchStatus = ValueNotifier(null);

  void toggleVisiblePassword() {
    isVisiblePassword.value = !isVisiblePassword.value;
  }

  void toggleVisibleConfirmPassword() {
    isVisibleConfirmPassword.value = !isVisibleConfirmPassword.value;
  }

  void checkPasswordMatch() {
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (confirmPassword.isEmpty) {
      passwordMatchStatus.value = null; // لا تعرض أي شيء
    } else if (password == confirmPassword) {
      passwordMatchStatus.value = 'Password Matching';
    } else {
      passwordMatchStatus.value = 'Passwords do not match';
    }
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
