import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'edit_note_screen_states.dart';

class EditNoteScreenCubit extends Cubit<EditNoteScreenStates> {
  bool isActive = true;
  bool isEditing = false;
  String title = '';
  String description = '';
  EditNoteScreenCubit() : super(EditNoteScreenInitState());

  static EditNoteScreenCubit get(context) => BlocProvider.of(context);

  editNote(NoteModel note) {
    emit(EditNoteScreenLoadingState());
    try {
      note.title = title.trim() == '' ? note.title : title;
      note.description =
          description.trim() == '' ? note.description : description;
      emit(EditNoteScreenSuccessState());
    } on Exception catch (e) {
      emit(EditNoteScreenErrorState(e.toString()));
    }
  }

  void toggleEditing(NoteModel note) {
    if (isEditing) {
      editNote(note);
      note.save();
    }
    isEditing = !isEditing;
    emit(ToggleEditingState());
  }

  @override
  Future<void> close() {
    isActive = false;
    return super.close();
  }
}
