import 'dart:convert';

import 'package:gem_notes/core/model/note.dart';
import 'package:gem_notes/data/dtos/note_dto.dart';
import 'package:gem_notes/objectbox.g.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_community/langchain_community.dart';
import 'package:langchain_google/langchain_google.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageService {
  late Store store;

  late BaseObjectBoxVectorStore<NoteDto> vectorStore;

  Future<void> init() async {
    final docsDir = await getApplicationDocumentsDirectory();
    store = await openStore(directory: docsDir.path);

    vectorStore = BaseObjectBoxVectorStore<NoteDto>(
      embeddings: GoogleGenerativeAIEmbeddings(),
      box: store.box<NoteDto>(),
      createEntity: (id, content, metadata, embedding) {
        final metadataParsed = jsonDecode(metadata);
        return NoteDto(
          id: id,
          title: metadataParsed['title'],
          content: content,
          timestamp: DateTime.parse(metadataParsed['timestamp']),
          embedding: metadataParsed['embedding'],
        );
      },
      createDocument: (note) => Document(
        pageContent: note.content,
        id: note.id,
        metadata: {
          'title': note.title,
          'timestamp': note.timestamp,
          'embedding': note.embedding,
        },
      ),
      getEmbeddingProperty: () => NoteDto_.embedding,
      getIdProperty: () => NoteDto_.id,
    );
  }

  Future<void> storeNote(Note note) async {
    store.box<NoteDto>().put(NoteDto.fromEntity(note));
  }

  List<Note> getNotes() => store
      .box<NoteDto>()
      .getAll()
      .map((dto) => Note(title: dto.title, content: dto.content, date: dto.timestamp))
      .toList();
}
