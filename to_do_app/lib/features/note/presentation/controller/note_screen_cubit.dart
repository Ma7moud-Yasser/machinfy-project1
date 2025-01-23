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
    clearControllers();
    emit(NoteScreenLoadingState());

    try {
      if (formKey.currentState!.validate()) {
        notes.add(
          NoteModel(
            title: noteTitleController.text,
            description: noteDescription.text,
            date: "12/12/2024",
          ),
        );
        emit(NoteScreenSuccessState());
        Navigator.pop(context);
      }
      clearControllers();
    } on Exception catch (e) {
      NoteScreenErrorState(e.toString());
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
