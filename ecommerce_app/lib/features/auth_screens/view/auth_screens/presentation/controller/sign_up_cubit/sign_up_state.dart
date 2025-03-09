part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitialState extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}

final class SignUpSuccessState extends SignUpState {}

final class SignUpFailureState extends SignUpState {
  final String errorMessage;
  SignUpFailureState(this.errorMessage);
}

final class ToggleVisibleConfirmPasswordState extends SignUpState {}

final class ToggleCheckBoxState extends SignUpState {}
