part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class ToggleVisibleConfirmPasswordState extends SignUpState {}

final class ToggleCheckBoxState extends SignUpState {}

final class SignUpUpdatedState extends SignUpState {}
