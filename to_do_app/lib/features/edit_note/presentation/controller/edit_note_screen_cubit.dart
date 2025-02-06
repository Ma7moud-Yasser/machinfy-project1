import 'package:flutter_bloc/flutter_bloc.dart';
import 'edit_note_screen_states.dart';

class EditNoteScreenCubit extends Cubit<EditNoteScreenStates> {
  bool _isActive = true;

  EditNoteScreenCubit() : super(EditNoteScreenInitState());

  static EditNoteScreenCubit get(context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _isActive = false;
    return super.close();
  }
}
