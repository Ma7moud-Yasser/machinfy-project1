abstract class WelcomeScreenStates {}

class WelcomeScreenInitState extends WelcomeScreenStates {}

class WelcomeScreenLoadingState extends WelcomeScreenStates {}

class WelcomeScreenSuccessState extends WelcomeScreenStates {}

class WelcomeScreenErrorState extends WelcomeScreenStates {
  final String message;
  WelcomeScreenErrorState(this.message);
}
