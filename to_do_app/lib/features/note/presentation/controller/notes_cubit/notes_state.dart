part of 'notes_cubit.dart';

abstract class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesSuccess extends NotesState {}

final class NotesError extends NotesState {
  final String message;
  NotesError(this.message);
}
