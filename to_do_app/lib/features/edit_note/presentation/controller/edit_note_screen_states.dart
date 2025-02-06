abstract class EditNoteScreenStates {}

class EditNoteScreenInitState extends EditNoteScreenStates {}

class EditNoteScreenLoadingState extends EditNoteScreenStates {}

class EditNoteScreenSuccessState extends EditNoteScreenStates {}

class ToggleEditingState extends EditNoteScreenStates {}

class EditNoteScreenErrorState extends EditNoteScreenStates {
  final String message;
  EditNoteScreenErrorState(this.message);
}
