abstract class SplashScreenStates {}

class SplashScreenInitState extends SplashScreenStates {}

class SplashScreenLoadingState extends SplashScreenStates {}

class SplashScreenSuccessState extends SplashScreenStates {}

class SplashScreenErrorState extends SplashScreenStates {
  final String message;
  SplashScreenErrorState(this.message);
}
