import 'package:bloc/bloc.dart';
import 'package:gem_notes/core/model/note.dart';
import 'package:gem_notes/data/services/local_storage_service.dart';
import 'package:meta/meta.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this.localStorageService) : super(NotesReady(notes: const []));

  final LocalStorageService localStorageService;

  Future<void> init() async {
    emit(NotesLoading());
    loadNotes();
  }

  void loadNotes() {
    try {
      emit(NotesReady(notes: localStorageService.getNotes()));
    } catch (e) {
      emit(NotesError(error: e));
    }
  }

  void createNote({
    required String title,
    required String content,
  }) {
    try {
      final note = Note(
        title: title,
        content: content,
        date: DateTime.now(),
      );

      localStorageService.storeNote(note);
      loadNotes();
    } catch (e) {
      emit(NotesError(error: e));
    }
  }

  Future<void> deleteNote(int id) async {
    try {
      await localStorageService.deleteNote(id);
      loadNotes();
    } catch (e) {
      emit(NotesError(error: e));
    }
  }

  Future<void> searchNote(String query) async {
    try {
      final notes = await localStorageService.searchNotes(query);

      emit(NotesReady(notes: notes));
    } catch (e) {
      emit(NotesError(error: e));
    }
  }

  Future<void> editNote({required int id, required String newContent}) async {
    try {
      localStorageService.editNote(id, newContent);
      loadNotes();
    } catch (e) {
      emit(NotesError(error: e));
    }
  }
}
