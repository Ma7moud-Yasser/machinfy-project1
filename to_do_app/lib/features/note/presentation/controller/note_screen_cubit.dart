import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'note_screen_states.dart';

class NoteScreenCubit extends Cubit<NoteScreenStates> {
  bool _isActive = true;
  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteDescription = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  NoteScreenCubit() : super(NoteScreenInitState());

  static NoteScreenCubit get(context) => BlocProvider.of(context);

  void addNote(List<NoteModel> notes, BuildContext context) {
    try {
      emit(NoteScreenLoadingState()); // Start loading state

      if (formKey.currentState!.validate()) {
        notes.insert(
          0,
          NoteModel(
            title: noteTitleController.text,
            description: noteDescription.text,
            date: "12/12/2024",
          ),
        );
        emit(NoteScreenSuccessState());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Note added successfully!')),
        );
        Navigator.pop(context);
        clearControllers();
      } else {
        emit(NoteScreenErrorState("Please fill in all fields"));
      }
    } catch (e) {
      emit(NoteScreenErrorState(e.toString())); // Transition to error
    }
  }

  void removeNote(List<NoteModel> notes, int index, BuildContext context) {
    try {
      emit(NoteScreenSuccessState());
      notes.removeAt(index);
      emit(NoteScreenSuccessState());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Note deleted!")),
      );
    } on Exception catch (e) {
      emit(NoteScreenErrorState(e.toString()));
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
