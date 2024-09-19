import 'dart:convert';

import 'package:langchain/langchain.dart';
import 'package:objectbox/objectbox.dart';

/// The ObjectBox entity representing a LangChain Document.
@Entity()
class DocumentEntity {
  @Id()
  int internalId = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  String id;

  String content;

  String metadata;

  @HnswIndex(dimensions: 768)
  @Property(type: PropertyType.floatVector)
  List<double> embedding;

  DocumentEntity({
    required this.id,
    required this.content,
    required this.metadata,
    required this.embedding,
  });

  factory DocumentEntity.fromModel(Document doc, List<double> embedding) => DocumentEntity(
        id: doc.id ?? '',
        content: doc.pageContent,
        metadata: jsonEncode(doc.metadata),
        embedding: embedding,
      );

  Document toModel() => Document(
        id: id,
        pageContent: content,
        metadata: jsonDecode(metadata),
      );
}
