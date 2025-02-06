import 'package:flutter_bloc/flutter_bloc.dart';
import 'welcome_screen_states.dart';

class WelcomeScreenCubit extends Cubit<WelcomeScreenStates> {
  bool isActive = true;

  WelcomeScreenCubit() : super(WelcomeScreenInitState());

  static WelcomeScreenCubit get(context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    isActive = false;
    return super.close();
  }
}
