import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_screen_states.dart';

class LoginScreenCubit extends Cubit<LoginScreenStates> {
  bool _isActive = true;

  LoginScreenCubit() : super(LoginScreenInitState());

  static LoginScreenCubit get(context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _isActive = false;
    return super.close();
  }
}
