import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'package:to_do_app/core/resources/app_stings.dart';
import 'add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  bool isActive = true;
  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteDescription = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddNoteCubit() : super(AddNoteInitState());

  static AddNoteCubit get(context) => BlocProvider.of(context);
  addNotes(NoteModel note) async {
    if (formKey.currentState!.validate()) {
      emit(AddNoteLoadingState());
      try {
        var notesBox = Hive.box<NoteModel>(AppString.notesBox);
        await notesBox.add(note);
        emit(AddNoteSuccessState());
        clearControllers();
      } on Exception catch (e) {
        emit(AddNoteErrorState(e.toString()));
      }
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
    isActive = false;
    return super.close();
  }
}
