abstract class ResetPasswordScreenStates {}

class ResetPasswordScreenInitState extends ResetPasswordScreenStates {}

class ResetPasswordScreenLoadingState extends ResetPasswordScreenStates {}

class ResetPasswordScreenSuccessState extends ResetPasswordScreenStates {}

class ToggleVisiblePasswordState extends ResetPasswordScreenStates {}

class ToggleVisibleConfirmPasswordState extends ResetPasswordScreenStates {}

class ResetPasswordScreenErrorState extends ResetPasswordScreenStates {
  final String message;
  ResetPasswordScreenErrorState(this.message);
}
