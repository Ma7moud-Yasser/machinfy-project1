import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'package:to_do_app/core/resources/app_stings.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  List<NoteModel>? searchResults;

  void fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(AppString.notesBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }

  void searchNotes(String query) {
    emit(SearchLoading());
    try {
      if (query.trim().isEmpty) {
        searchResults = notes;
      } else {
        searchResults = notes
            ?.where((note) =>
                note.title.toLowerCase().contains(query.trim().toLowerCase()))
            .toList();
      }
      emit(SearchSuccess(searchResults));
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }
}
