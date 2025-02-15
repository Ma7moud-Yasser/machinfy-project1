import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_screen_states.dart';

class SplashScreenCubit extends Cubit<SplashScreenStates> {
  bool _isActive = true;

  SplashScreenCubit() : super(SplashScreenInitState());

  static SplashScreenCubit get(context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _isActive = false;
    return super.close();
  }
}
