import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  TextEditingController userNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController regionController = TextEditingController();

  bool isNotVisible = true;
  bool isChecked = false;
  String selectedFlag = "🌍";

  void signUp() {}

  void toggleVisibleConfirmPassword() {
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
