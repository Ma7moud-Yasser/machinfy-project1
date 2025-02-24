import 'package:flutter_bloc/flutter_bloc.dart';
import 'o_t_p_screen_states.dart';

class OTPScreenCubit extends Cubit<OTPScreenStates> {
  bool _isActive = true;

  OTPScreenCubit() : super(OTPScreenInitState());

  static OTPScreenCubit get(context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _isActive = false;
    return super.close();
  }
}
