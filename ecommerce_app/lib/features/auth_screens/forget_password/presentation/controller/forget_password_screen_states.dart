abstract class ForgetPasswordScreenStates {}

class ForgetPasswordScreenInitState extends ForgetPasswordScreenStates {}

class ForgetPasswordScreenLoadingState extends ForgetPasswordScreenStates {}

class ForgetPasswordScreenSuccessState extends ForgetPasswordScreenStates {}

class ForgetPasswordScreenErrorState extends ForgetPasswordScreenStates {
  final String message;
  ForgetPasswordScreenErrorState(this.message);
}
