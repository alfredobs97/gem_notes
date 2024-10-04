class Note {
  Note({
    this.id = 0,
    required this.title,
    required this.content,
    required this.date,
  });

  final int id;
  final String title;
  final String content;
  final DateTime date;

  Note copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? date,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
    );
  }
}
