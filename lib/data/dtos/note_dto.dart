import 'package:gem_notes/core/model/note.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class NoteDto {
  @Id()
  int internalId = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  final String id;

  /// The embedding of the document.
  @HnswIndex(dimensions: 512) // Set dynamically in the ObjectBoxVectorStore
  @Property(type: PropertyType.floatVector)
  final List<double> embedding;

  final String title;
  final String content;

  @Property(type: PropertyType.date)
  final DateTime timestamp;

  NoteDto({
    required this.title,
    required this.content,
    required this.timestamp,
    required this.id,
    required this.embedding,
  });

  factory NoteDto.fromEntity(Note note) => NoteDto(
        title: note.title,
        content: note.content,
        timestamp: note.date,
        embedding: [],
        id: '',
      );

  Note toEntity() => Note(
        title: title,
        content: content,
        date: timestamp,
      );
}
