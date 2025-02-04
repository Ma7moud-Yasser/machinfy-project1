import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'package:to_do_app/core/resources/app_stings.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes() {
    emit(NotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(AppString.notesBox);
      List<NoteModel> notes = notesBox.values.toList();
      emit(NotesSuccess(notes));
    } on Exception catch (e) {
      emit(NotesError(e.toString()));
    }
  }
}
