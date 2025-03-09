import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/services/dio_helper.dart';
import 'package:ecommerce_app/core/services/end_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController regionController = TextEditingController();

  bool isNotVisible = true;
  bool isNotVisibleConfirm = true;
  bool isChecked = false;
  String selectedFlag = "🌍";

  void signUp(BuildContext context) {
    try {
      emit(SignUpLoading());
      DioHelper.postData(
        url: EndPoint.register,
        data: {
          "email": emailController.text,
          "password": passwordController.text,
          "name": userNameController.text,
          "phone": phoneController.text,
        },
      ).then((value) {
        emit(SignUpSuccess());
        Navigator.pop(context);
      });
    } catch (e) {
      print(e);
    }
  }

  void toggleVisibleConfirmPassword() {
    isNotVisibleConfirm = !isNotVisibleConfirm;
    emit(ToggleVisibleConfirmPasswordState());
  }

  void toggleVisiblePassword() {
    isNotVisible = !isNotVisible;
    emit(ToggleVisibleConfirmPasswordState());
  }

  void toggleCheckBox() {
    isChecked = !isChecked;
    emit(ToggleCheckBoxState());
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    countryController.dispose();
    cityController.dispose();
    regionController.dispose();
    return super.close();
  }
}
