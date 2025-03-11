abstract class LoginScreenStates {}

class LoginScreenInitState extends LoginScreenStates {}

class LoginScreenLoadingState extends LoginScreenStates {}

class LoginScreenSuccessState extends LoginScreenStates {
  final String message;
  final bool status;
  LoginScreenSuccessState({required this.message, required this.status});
}

class ToggleVisiblePasswordState extends LoginScreenStates {}

class ToggleRememberPasswordState extends LoginScreenStates {}

class LoginScreenErrorState extends LoginScreenStates {
  final String message;
  LoginScreenErrorState(this.message);
}
