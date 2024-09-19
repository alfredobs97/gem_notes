import 'package:langchain_community/langchain_community.dart';

import '../entities/document_entity.dart';
import 'objectbox.g.dart';

class NotesVectorStore extends BaseObjectBoxVectorStore<DocumentEntity> {
  NotesVectorStore({
    required super.embeddings,
    required Store store,
  }) : super(
          box: store.box<DocumentEntity>(),
          createEntity: (
            String id,
            String content,
            String metadata,
            List<double> embedding,
          ) =>
              DocumentEntity(
            id: id,
            content: content,
            metadata: metadata,
            embedding: embedding,
          ),
          createDocument: (DocumentEntity docDto) => docDto.toModel(),
          getIdProperty: () => DocumentEntity_.id,
          getEmbeddingProperty: () => DocumentEntity_.embedding,
        );
}
