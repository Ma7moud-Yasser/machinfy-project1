import 'package:flutter_bloc/flutter_bloc.dart';
import 'notification_screen_states.dart';

class NotificationScreenCubit extends Cubit<NotificationScreenStates> {
  NotificationScreenCubit() : super(NotificationScreenInitState());

  static NotificationScreenCubit get(context) => BlocProvider.of(context);
}
