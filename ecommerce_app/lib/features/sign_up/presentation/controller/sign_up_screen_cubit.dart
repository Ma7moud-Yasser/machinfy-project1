import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_screen_states.dart';

class SignUpScreenCubit extends Cubit<SignUpScreenStates> {
  bool _isActive = true;

  SignUpScreenCubit() : super(SignUpScreenInitState());

  static SignUpScreenCubit get(context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _isActive = false;
    return super.close();
  }
}
