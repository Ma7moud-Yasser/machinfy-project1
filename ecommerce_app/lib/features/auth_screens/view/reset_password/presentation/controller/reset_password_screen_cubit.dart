import 'package:flutter_bloc/flutter_bloc.dart';
import 'reset_password_screen_states.dart';

class ResetPasswordScreenCubit extends Cubit<ResetPasswordScreenStates> {
  bool isActive = true;

  ResetPasswordScreenCubit() : super(ResetPasswordScreenInitState());

  static ResetPasswordScreenCubit get(context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    isActive = false;
    return super.close();
  }
}
