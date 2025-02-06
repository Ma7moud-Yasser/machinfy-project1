import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'edit_note_screen_states.dart';

class EditNoteScreenCubit extends Cubit<EditNoteScreenStates> {
  bool isEditing = false;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  EditNoteScreenCubit(NoteModel note) : super(EditNoteScreenInitState()) {
    title.text = note.title;
    description.text = note.description;
  }

  static EditNoteScreenCubit get(context) => BlocProvider.of(context);

  void editNote(NoteModel note) {
    emit(EditNoteScreenLoadingState());

    try {
      bool hasChanges = false;

      if (title.text.trim().isNotEmpty && title.text.trim() != note.title) {
        note.title = title.text.trim();
        hasChanges = true;
      }
      if (description.text.trim().isNotEmpty &&
          description.text.trim() != note.description) {
        note.description = description.text.trim();
        hasChanges = true;
      }

      if (hasChanges) {
        emit(EditNoteScreenSuccessState());
      } else {
        emit(EditNoteScreenInitState());
      }
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
    title.dispose();
    description.dispose();
    return super.close();
  }
}
