abstract class LoginScreenStates {}

class LoginScreenInitState extends LoginScreenStates {}

class LoginScreenLoadingState extends LoginScreenStates {}

class LoginScreenSuccessState extends LoginScreenStates {}

class ToggleVisiblePasswordState extends LoginScreenStates {}

class LoginScreenErrorState extends LoginScreenStates {
  final String message;
  LoginScreenErrorState(this.message);
}
