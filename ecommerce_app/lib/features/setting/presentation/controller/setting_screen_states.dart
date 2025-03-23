abstract class SettingScreenStates {}

class SettingScreenInitState extends SettingScreenStates {}

class SettingScreenLoadingState extends SettingScreenStates {}

class SettingScreenSuccessState extends SettingScreenStates {}

class SettingScreenErrorState extends SettingScreenStates {
  final String message;
  SettingScreenErrorState(this.message);
}
