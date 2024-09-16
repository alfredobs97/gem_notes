part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesLoading extends NotesState {}

final class NotesReady extends NotesState {
  final List<Note> notes;

  NotesReady({required this.notes});
}

final class NotesError extends NotesState {
  final dynamic error;

  NotesError({required this.error});
}
