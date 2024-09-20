import 'package:gem_notes/core/model/note.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class NoteEntity {
  @Id()
  int internalId = 0;

  @Unique(onConflict: ConflictStrategy.replace)
  final String id;

  final String title;
  final String content;

  @Property(type: PropertyType.date)
  final DateTime timestamp;

  NoteEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.timestamp,
  });

  factory NoteEntity.fromModel(Note note) => NoteEntity(
        id: note.id,
        title: note.title,
        content: note.content,
        timestamp: note.date,
      );

  Note toModel() => Note(
        id: id,
        title: title,
        content: content,
        date: timestamp,
      );
}
