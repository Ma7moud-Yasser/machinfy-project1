import 'package:flutter_bloc/flutter_bloc.dart';
import 'setting_screen_states.dart';

class SettingScreenCubit extends Cubit<SettingScreenStates> {
  SettingScreenCubit() : super(SettingScreenInitState());

  static SettingScreenCubit get(context) => BlocProvider.of(context);
}
