abstract class AuthScreensStates {}

class AuthScreensInitState extends AuthScreensStates {}

class AuthScreensLoadingState extends AuthScreensStates {}

class AuthScreensSuccessState extends AuthScreensStates {}

class ToggleVisiblePasswordState extends AuthScreensStates {}

class AuthScreensErrorState extends AuthScreensStates {
  final String message;
  AuthScreensErrorState(this.message);
}
