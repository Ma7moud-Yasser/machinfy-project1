import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'forget_password_screen_states.dart';

class ForgetPasswordScreenCubit extends Cubit<ForgetPasswordScreenStates> {
  GlobalKey<FormState> formKey = GlobalKey();
  ForgetPasswordScreenCubit() : super(ForgetPasswordScreenInitState());

  static ForgetPasswordScreenCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
