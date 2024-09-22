import 'dart:async';

import 'package:collection/collection.dart';
import 'package:gem_notes/core/model/note.dart';
import 'package:langchain/langchain.dart';

import '../entities/note_entity.dart';
import '../stores/objectbox.g.dart';
import '../stores/vector_store.dart';

class LocalStorageService {
  LocalStorageService({
    required Store store,
    required NotesVectorStore vectorStore,
  })  : _notesBox = store.box<NoteEntity>(),
        _vectorStore = vectorStore,
        _textSplitter = const RecursiveCharacterTextSplitter(chunkSize: 1000, chunkOverlap: 200);

  final Box<NoteEntity> _notesBox;
  final NotesVectorStore _vectorStore;
  final RecursiveCharacterTextSplitter _textSplitter;

  Future<void> storeNote(Note note) async {
    _notesBox.put(NoteEntity.fromModel(note));
    final docs = _createNoteChunks(note);
    await _vectorStore.addDocuments(documents: docs);
  }

  List<Note> getNotes() => _notesBox.getAll().map((dto) => dto.toModel()).toList();

  void deleteNote(String id) {
    _notesBox.remove(int.parse(id));
    unawaited(_vectorStore.delete(ids: [id]));
  }

  Future<List<Note>> searchNotes(String query) async {
    final response = await _vectorStore.similaritySearch(query: query);

    final notes = response.fold<List<NoteEntity>>(<NoteEntity>[], (acc, doc) {
      final note = _notesBox.get(doc.metadata['note_id']);

      return acc.contains(note) ? acc : [note!, ...acc];
    });

    return notes.map((note) => note.toModel()).toList();
  }

  void editNote(String id, String newContent) {
    final note = _notesBox.get(int.parse(id));

    if (note != null) {
      _notesBox.put(note.copyWith(content: newContent));
    }
  }

  List<Document> _createNoteChunks(Note note) {
    final noteString = '${note.title}\n\n${note.content}';
    return _textSplitter.splitText(noteString).mapIndexed((index, chunk) {
      return Document(
        id: '${note.id}_$index',
        pageContent: chunk,
        metadata: {
          'note_id': note.id,
        },
      );
    }).toList();
  }
}
