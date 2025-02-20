import 'package:flutter_bloc/flutter_bloc.dart';
import 'forget_password_screen_states.dart';

class ForgetPasswordScreenCubit extends Cubit<ForgetPasswordScreenStates> {
  bool _isActive = true;

  ForgetPasswordScreenCubit() : super(ForgetPasswordScreenInitState());

  static ForgetPasswordScreenCubit get(context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _isActive = false;
    return super.close();
  }
}
