import 'package:gem_notes/core/model/note.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class NoteEntity {
  @Id()
  int id;
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

  NoteEntity copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? timestamp,
  }) {
    return NoteEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
