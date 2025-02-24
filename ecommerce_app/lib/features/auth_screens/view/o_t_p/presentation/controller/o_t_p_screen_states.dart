abstract class OTPScreenStates {}

class OTPScreenInitState extends OTPScreenStates {}

class OTPScreenLoadingState extends OTPScreenStates {}

class OTPScreenSuccessState extends OTPScreenStates {}

class OTPScreenErrorState extends OTPScreenStates {
  final String message;
  OTPScreenErrorState(this.message);
}
