import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'o_t_p_screen_states.dart';

class OTPScreenCubit extends Cubit<OTPScreenStates> {
  OTPScreenCubit() : super(OTPScreenInitState());
  static OTPScreenCubit get(context) => BlocProvider.of(context);
  List<TextEditingController> otpController = List.generate(
    4,
    (index) => TextEditingController(),
  );

  void resendCode() {
    log('Re-sending OTP code...');
  }

  @override
  Future<void> close() {
    log('🛑 Closing OTPScreenCubit and disposing controllers');
    for (var controller in otpController) {
      controller.dispose();
    }
    return super.close();
  }
}
