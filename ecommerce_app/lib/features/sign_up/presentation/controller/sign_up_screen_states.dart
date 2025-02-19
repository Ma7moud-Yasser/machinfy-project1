abstract class SignUpScreenStates {}

class SignUpScreenInitState extends SignUpScreenStates {}

class SignUpScreenLoadingState extends SignUpScreenStates {}

class SignUpScreenSuccessState extends SignUpScreenStates {}

class SignUpScreenErrorState extends SignUpScreenStates {
  final String message;
  SignUpScreenErrorState(this.message);
}
