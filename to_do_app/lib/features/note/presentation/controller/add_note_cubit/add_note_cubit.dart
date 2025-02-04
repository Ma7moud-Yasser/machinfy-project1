import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  bool _isActive = true;
  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteDescription = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddNoteCubit() : super(AddNoteInitState());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  void addNote(List<NoteModel> notes, BuildContext context) {
    try {
      emit(AddNoteLoadingState()); // Start loading state

      if (formKey.currentState!.validate()) {
        notes.insert(
          0,
          NoteModel(
            title: noteTitleController.text,
            description: noteDescription.text,
            date: "12/12/2024",
          ),
        );
        emit(AddNoteSuccessState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Note added successfully!')),
        );
        Navigator.pop(context);
        clearControllers();
      } else {
        emit(AddNoteErrorState("Please fill in all fields"));
      }
    } catch (e) {
      emit(AddNoteErrorState(e.toString()));
    }
  }

  void removeNote(List<NoteModel> notes, int index, BuildContext context) {
    try {
      emit(AddNoteSuccessState());
      notes.removeAt(index);
      emit(AddNoteSuccessState());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Note deleted!")),
      );
    } on Exception catch (e) {
      emit(AddNoteErrorState(e.toString()));
    }
  }

  void clearControllers() {
    noteTitleController.clear();
    noteDescription.clear();
  }

  @override
  Future<void> close() {
    _isActive = false;
    return super.close();
  }
}
