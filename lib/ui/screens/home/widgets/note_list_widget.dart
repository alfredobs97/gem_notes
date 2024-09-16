import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gem_notes/core/model/note.dart';

class NoteListWidget extends StatelessWidget {
  final Note note;

  NoteListWidget({required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Flexible(child: MarkdownBody(data: note.content)),
          ],
        ),
      ),
    );
  }
}
