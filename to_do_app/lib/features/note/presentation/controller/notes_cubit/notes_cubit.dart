import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'package:to_do_app/core/resources/app_stings.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes = [
    NoteModel(
      title: "First Note",
      description: "their is note their is note their is note",
      date: "10/1/2025",
    ),
    NoteModel(
      title: "Second Note",
      description: "their is note their is note their is note",
      date: "1/1/2025",
    ),
    NoteModel(
      title: "Third Note",
      description: "their is note their is note their is note",
      date: "12/12/2024",
    ),
    NoteModel(
      title: "Fourth Note",
      description: "their is note their is note their is note",
      date: "8/12/2024",
    ),
    NoteModel(
      title: "Fifth Note",
      description: "their is note their is note their is note",
      date: "1/12/2024",
    ),
  ];

  fetchAllNotes() {
    // emit(NotesLoading());
    var notesBox = Hive.box<NoteModel>(AppString.notesBox);
    notes = notesBox.values.toList();
  }
}
