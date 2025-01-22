import 'package:flutter_bloc/flutter_bloc.dart';
import 'note_screen_states.dart';

class NoteScreenCubit extends Cubit<NoteScreenStates> {
  bool _isActive = true;

  NoteScreenCubit() : super(NoteScreenInitState());

  static NoteScreenCubit get(context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _isActive = false;
    return super.close();
  }
}
