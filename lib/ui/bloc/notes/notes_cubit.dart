import 'package:bloc/bloc.dart';
import 'package:gem_notes/core/model/note.dart';
import 'package:gem_notes/data/services/local_storage_service.dart';
import 'package:meta/meta.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final LocalStorageService localStorageService;

  NotesCubit(this.localStorageService) : super(NotesReady(notes: const []));

  Future<void> init() async {
    emit(NotesLoading());
    await localStorageService.init();
    loadNotes();
  }

  void loadNotes() {
    try {
      emit(NotesReady(notes: localStorageService.getNotes()));
    } catch (e) {
      emit(NotesError(error: e));
    }
  }

  void createNote(Note note) {
    try {
      localStorageService.storeNote(note);
      loadNotes();
    } catch (e) {
      emit(NotesError(error: e));
    }
  }
}
