abstract class NoteScreenStates {}

class NoteScreenInitState extends NoteScreenStates {}

class NoteScreenLoadingState extends NoteScreenStates {}

class NoteScreenSuccessState extends NoteScreenStates {}

class NoteScreenErrorState extends NoteScreenStates {
  final String message;
  NoteScreenErrorState(this.message);
}
