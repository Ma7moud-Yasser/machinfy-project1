abstract class NotificationScreenStates {}

class NotificationScreenInitState extends NotificationScreenStates {}

class NotificationScreenLoadingState extends NotificationScreenStates {}

class NotificationScreenSuccessState extends NotificationScreenStates {}

class NotificationScreenErrorState extends NotificationScreenStates {
  final String message;
  NotificationScreenErrorState(this.message);
}
