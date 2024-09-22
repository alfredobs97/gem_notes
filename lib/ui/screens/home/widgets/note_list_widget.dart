import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gem_notes/core/model/note.dart';
import 'package:gem_notes/ui/routes.dart';

class NoteListWidget extends StatelessWidget {
  const NoteListWidget({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(Routes.noteDetails.name, arguments: note),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: note.id,
                child: Text(
                  note.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                child: MarkdownBody(
                  data: '${note.content.substring(0, min(200, note.content.length))}...',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
