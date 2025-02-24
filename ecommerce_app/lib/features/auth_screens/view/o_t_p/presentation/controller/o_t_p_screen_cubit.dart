import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'o_t_p_screen_states.dart';

class OTPScreenCubit extends Cubit<OTPScreenStates> {
  OTPScreenCubit() : super(OTPScreenInitState());
  bool isActive = true;
  static OTPScreenCubit get(context) => BlocProvider.of(context);
  List<TextEditingController> otpController = List.generate(
    4,
    (index) => TextEditingController(),
  );

  resendCode() {
    log('ReSending Code....');
  }

  @override
  Future<void> close() {
    isActive = false;
    return super.close();
  }
}
