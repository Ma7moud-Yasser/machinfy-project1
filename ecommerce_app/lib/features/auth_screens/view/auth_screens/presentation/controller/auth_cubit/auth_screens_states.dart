abstract class AuthScreensStates {}

class AuthScreensInitState extends AuthScreensStates {}

class AuthScreensLoadingState extends AuthScreensStates {}

class AuthScreensSuccessState extends AuthScreensStates {}

class ToggleVisiblePasswordState extends AuthScreensStates {}

class ToggleRememberPasswordState extends AuthScreensStates {}

class ToggleLoginAndSignUpState extends AuthScreensStates {}

class AuthScreensErrorState extends AuthScreensStates {
  final String message;
  AuthScreensErrorState(this.message);
}
